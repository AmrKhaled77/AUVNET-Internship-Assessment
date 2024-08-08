part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ChangeIndexState extends HomeState {}

final class HomeGetDataLoadingState extends HomeState {}

final class HomeGetDataSucsessState extends HomeState {
  final HomeModel homeModel;
  HomeGetDataSucsessState(this.homeModel);
}

final class HomeGetDataErrorState extends HomeState {
  String error;
  HomeGetDataErrorState(this.error);
}

final class HomeChangeFavoriteLoadingState extends HomeState {}

final class HomeChangeFavoriteSucsessState extends HomeState {}

final class HomeChangeFavoriteErrorState extends HomeState {
  String error;
  HomeChangeFavoriteErrorState(this.error);
}

final class FavoriteLoading extends HomeState {}

final class FavoriteError extends HomeState {
  String error;
  FavoriteError({required this.error});
}

final class FavoriteSucsess extends HomeState {
  final FavoriteModel;
  FavoriteSucsess({this.FavoriteModel});
}

final class HomeChangeCartLoadingState extends HomeState {}

final class HomeChangeCartSucsessState extends HomeState {}

final class HomeChangeCartErrorState extends HomeState {
  String error;
  HomeChangeCartErrorState(this.error);
}

final class CartLoading extends HomeState {}

final class CartError extends HomeState {
  String error;
  CartError({required this.error});
}

final class CartSucsess extends HomeState {
  final CartModel;
  CartSucsess({this.CartModel});
}

final class MakeOredertLoadingState extends HomeState {}

final class MakeOrderSucsessState extends HomeState {}

final class MakeOrderErrorState extends HomeState {
  String error;
  MakeOrderErrorState({required this.error});
}

final class GetOredertLoadingState extends HomeState {}

final class GetOrderSucsessState extends HomeState {}

final class GetOrderErrorState extends HomeState {
  String error;
  GetOrderErrorState({required this.error});
}
