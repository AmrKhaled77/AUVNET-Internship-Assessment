part of 'catigori_cubit.dart';

@immutable
sealed class CatigoriState {}

final class CatigoriInitial extends CatigoriState {}
final class CatigoriLoading extends CatigoriState {}
final class CatigoriError extends CatigoriState {
  String error;
  CatigoriError(this.error);
}
final class CatigoriSucsses extends CatigoriState {

  final CategoriModel categoriModel;

  CatigoriSucsses(this.categoriModel);



}final class CatigoriDetailsSucsses extends CatigoriState {

  SearchModel Proudacts;

  CatigoriDetailsSucsses({required this.Proudacts});



}
