import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/widgets/customElevetedButton.dart';
import '../../../../core/widgets/toast.dart';
import '../../../home/presentation/view/ProdectItemDeatilsScreen.dart';
import '../../../home/presentation/viewModel/home cubit/home_cubit.dart';
import 'widgets/ShowDialog.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (BuildContext context, state) {
    if(state is MakeOrderSucsessState){

      BlocProvider.of<HomeCubit>(context).GetOrder();
    }

      },
      builder: (BuildContext context, state) {

        if(BlocProvider.of<HomeCubit>(context)
            .CartModel is Null){return Center(child: CircularProgressIndicator(),);}

        else if (BlocProvider.of<HomeCubit>(context).price==0){

          return Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Center(child: Image.asset(
              // height: 150,
              // width: 200,
              'assets/images/nodata.png')),
              
              Text('No data in cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
        ],
          );
        }

        else{
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: BlocProvider.of<HomeCubit>(context)
                        .CartModel!
                        .data!
                        .cartItems!
                        .length,
                    itemBuilder: (context, index) {
                      if (BlocProvider.of<HomeCubit>(context).HomeData == null) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProdectItemDeatilsScreen(
                                    index: index,
                                    page: 'cart',
                                  )),
                            );
                          },
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset:
                                  Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.bottomStart,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CachedNetworkImage(
                                        height: 200,
                                        width: 125,
                                        imageUrl:
                                        BlocProvider.of<HomeCubit>(context)
                                            .CartModel!
                                            .data!
                                            .cartItems![index]!
                                            .product!
                                            .image!,
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                    if (BlocProvider.of<HomeCubit>(context)
                                        .CartModel!
                                        .data!
                                        .cartItems![index]!
                                        .product!
                                        .discount !=
                                        0)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        child: Container(
                                          color: Colors.red,
                                          child: const Text(
                                            'DISCOUNT',
                                            style: TextStyle(
                                                fontSize: 9, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            BlocProvider.of<HomeCubit>(context)
                                                .CartModel!
                                                .data!
                                                .cartItems![index]!
                                                .product!
                                                .name!,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              "${BlocProvider.of<HomeCubit>(context).CartModel!.data!.cartItems![index]!.product!.price!.round().toString()} EPG",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.blue),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            if (BlocProvider.of<HomeCubit>(
                                                context)
                                                .CartModel!
                                                .data!
                                                .cartItems![index]!
                                                .product!
                                                .discount !=
                                                0)
                                              Text(
                                                "${BlocProvider.of<HomeCubit>(context).CartModel!.data!.cartItems![index]!.product!.oldPrice!.round().toString()} EPG",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey,
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                              ),
                                            const Spacer(),
                                            // IconButton(
                                            //     onPressed: () {
                                            //       BlocProvider.of<HomeCubit>(context)
                                            //           .ChangeFavorite(
                                            //               productId: BlocProvider.of<
                                            //                       HomeCubit>(context)
                                            //                   .favoriteModel!
                                            //                   .elemnt
                                            //                   .data[index]
                                            //                   .product
                                            //                   .id);
                                            //     },
                                            //     icon: Container(
                                            //       child: Icon(
                                            //           color: BlocProvider.of<HomeCubit>(
                                            //                       context)
                                            //                   .favorite[BlocProvider.of<
                                            //                       HomeCubit>(context)
                                            //                   .favoriteModel!
                                            //                   .elemnt
                                            //                   .data[index]
                                            //                   .product
                                            //                   .id]!
                                            //               ? Colors.red
                                            //               : Colors.grey,
                                            //           Icons.favorite),
                                            //     )
                                            //     )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state is MakeOrderErrorState) {
                    showtoast(text: state.error, color: Colors.red);
                  }
                },
                builder: (context, state) {
                  if (state is MakeOredertLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomEevetedButton(
                          text:
                          '${BlocProvider.of<HomeCubit>(context).price} EGP to pay',
                          onPress: () {


                             BlocProvider.of<HomeCubit>(context).MakeOrder(context);


                          }),
                    );
                  }
                },
              )
            ],
          );
        }

      },
    );
  }
}
