part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}


final class LoginError extends LoginState {

  String Errorrmassge;
  LoginError(this.Errorrmassge);
}


final class LoginSucsess extends LoginState {
  final UserModel loginModel;

  LoginSucsess(this.loginModel);

}

final class LoginChangeVisibilty extends LoginState {}
