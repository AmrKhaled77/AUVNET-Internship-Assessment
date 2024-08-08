import 'package:auvnet_cyper/features/cart/data/models/MakeOrderModel.dart';
import 'package:auvnet_cyper/features/cart/data/models/OrderModel.dart';
import 'package:auvnet_cyper/features/cart/data/models/cartModel.dart';
import 'package:auvnet_cyper/features/favorite/presentation/view/favoriteScreen.dart';
import 'package:auvnet_cyper/features/home/data/model/homeModel.dart';
import 'package:auvnet_cyper/features/settings/presentation/view/SettingScreen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


import '../../../../../core/services/apiServices.dart';
import '../../../../../core/widgets/toast.dart';
import '../../../../cart/presentation/view/cartScreen.dart';
import '../../../../cart/presentation/view/widgets/ShowDialog.dart';
import '../../../../favorite/data/models/favoriteModel.dart';
import '../../../data/repo/HomeRepo.dart';
import '../../view/HomeScreen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  Map<int, bool> favorite = {};
  Map<int, bool> InCart = {};

  HomeCubit(this.homeRepo) : super(HomeInitial());
  ApiServices apiServices = ApiServices();

  final HomeRepo homeRepo;

  int CurrntIndex = 0;

  List<Widget> Screens = [
    HomeScreen(),
    CartScreen(),
    FavoriteSceen(),
    settinscreen(),
  ];

  ChangeIndex(index) {
    CurrntIndex = index;
    emit(ChangeIndexState());
  }

  HomeModel? HomeData;
  FavoriteModel? favoriteModel;
  cartModel? CartModel;



  getHomeData() async {
    emit(HomeGetDataLoadingState());
    var response = await homeRepo.GetHomeData();

    response.fold(
            (l) =>
        {
          print('status'),
          print(l.errorMassge),
          emit(HomeGetDataErrorState(l.errorMassge))
        },
            (r) async =>
        {
          print('status'),


          HomeData =  r,
          r.data.products.forEach((element) {
            InCart.addAll({element.id: element.inCart});

            favorite.addAll({element.id: element.inFavorites});
          }),
          emit(HomeGetDataSucsessState(r))
        });
  }

  ChangeFavorite({required int productId}) async {
    favorite[productId] = !favorite[productId]!;

    emit(HomeChangeFavoriteLoadingState());

    await apiServices
        .post(endPoints: 'favorites', auth: true, data: {
      'product_id': productId,
    })
        .then((value) =>
    {
      print(value.data),
      emit(
        HomeChangeFavoriteSucsessState(),
      ),
      if (!(value.data['status']))
        {
          favorite[productId] = !favorite[productId]!,
          showtoast(text: value.data['message'], color: Colors.red)
        }
      else
        {getFavorite()}
    })
        .catchError((e) {
      emit(HomeChangeFavoriteErrorState(e.toString()));
      favorite[productId] = !favorite[productId]!;
      showtoast(text: 'there was an error', color: Colors.red);
    });
  }

  Future<void> getFavorite() async {
    emit(FavoriteLoading());
    await apiServices
        .get(endPoints: 'favorites', auth: true)
        .then((value) =>
    {
      favoriteModel = FavoriteModel.fromJson(value.data),
      favoriteModel!.elemnt.data.forEach((element) {
        print("favorits :${element.id}");
      }),
      emit(FavoriteSucsess(
          FavoriteModel: FavoriteModel.fromJson(value.data))),
      print('sucsessss'),
    })
        .catchError((e) {
      emit(FavoriteError(error: e.toString()));

      print('errorrrr');
      print(e.toString());
      return Future<void>;
    });
  }

  ChangeCart({required int productId, bool ShowToast = true}) async {
    InCart[productId] = !InCart[productId]!;

    emit(HomeChangeCartLoadingState());

    await apiServices
        .post(endPoints: 'carts', auth: true, data: {
      'product_id': productId,
    })
        .then((value) =>
    {

      print('ChnageCart Val : ${value}'),

      if (ShowToast)
        {
          showtoast(text: value.data['message'], color: Colors.green),
        },
      CalcPrice(),
      emit(
        HomeChangeCartSucsessState(),
      ),
      if (!(value.data['status']))
        {
          InCart[productId] = !InCart[productId]!,
          showtoast(text: value.data['message'], color: Colors.red)
        }
      else
        {getCart()}
    })
        .catchError((e) {
      emit(HomeChangeCartErrorState(e.toString()));
      InCart[productId] = !InCart[productId]!;
      showtoast(text: 'there was an error', color: Colors.red);
    });
  }

  Future<void> getCart() async {
    emit(CartLoading());
    await apiServices
        .get(endPoints: 'carts', auth: true)
        .then((value) =>
    {
      CartModel = cartModel.fromJson(value.data),
      CartModel!.data!.cartItems!.forEach((element) {
        print("carts :${element.id}");
      }),
      CalcPrice(),
      emit(CartSucsess(CartModel: cartModel.fromJson(value.data))),
      print('sucsessss'),
    })
        .catchError((e) {
      emit(FavoriteError(error: e.toString()));

      print('errorrrr');
      print(e.toString());
      return Future<void>;
    });
  }

  int price = 0;

  void CalcPrice() {
    price = 0;
    CartModel!.data!.cartItems!.forEach((element) {
      price += element.product!.price!.round();
    });
    print('price  : ${price}');
  }


  MakeOrderModel? makeOrderModel;
  void MakeOrder(context) async {

    emit(MakeOredertLoadingState());

    await apiServices
        .post(endPoints: 'orders', auth: true, data: {
      'address_id': '35',
      'payment_method': '1',
      'use_points': false
    })
        .then((value) =>

    {

      makeOrderModel=MakeOrderModel.fromJson(value.data),
      showtoast(text: value.data['message'], color: Colors.green),
      showMyDialog( context ,price),
      getCart(),

      emit(
        MakeOrderSucsessState(),
      ),
    })
        .catchError((e) {
      emit(MakeOrderErrorState(error: e.toString()));

      showtoast(text: 'there was an error', color: Colors.red);
    });



  }



  OrderModel? orderModel;
  GetOrder() async {
    emit(GetOredertLoadingState());
    await apiServices
        .get(endPoints: 'orders', auth: true)
        .then((value) => {
          print ('ORDER VAL : ${value}'),
      orderModel = OrderModel.fromJson(value.data),
      emit(GetOrderSucsessState()),

    })
        .catchError((e) {
      emit(GetOrderErrorState(error: e.toString()));

      print('errorrrr FROM GET ORDER');
      print(e.toString());

    });
  }
}