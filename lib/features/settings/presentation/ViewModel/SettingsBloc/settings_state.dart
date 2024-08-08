part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class SettingsLoading extends SettingsState {}

final class SettingsSucsses extends SettingsState {
  UserModel userModel;
  SettingsSucsses(this.userModel);
}

final class SettingsErorr extends SettingsState {
  String error;
  SettingsErorr(this.error);
}

final class UpdateLoading extends SettingsState {}

final class UpdateSucsses extends SettingsState {
  UserModel userModel;
  UpdateSucsses(this.userModel);
}

final class UpdateErorr extends SettingsState {
  String error;
  UpdateErorr(this.error);
}


