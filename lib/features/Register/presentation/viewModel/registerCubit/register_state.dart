part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSucsess extends RegisterState {

  final UserModel model;
  RegisterSucsess(this.model);
}

final class RegisterError extends RegisterState {

  String errorMasge;
  RegisterError(this.errorMasge);
}
