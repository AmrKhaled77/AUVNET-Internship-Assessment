
import 'package:auvnet_cyper/features/login/data/model/LoginModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/LoginRepo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.homeRepo) : super(LoginInitial());

  final LoginRepo homeRepo;

  late UserModel userModel;

  Login ({
    required String email, required String password
})async{
    emit(LoginLoading());
    var response =await homeRepo.Login(email: email, password: password );

    print('ree');



    response.fold((l) => {
      print('status'),
      print(l.errorMassge),
      emit(LoginError(l.errorMassge))
    }, (r) => { print('status'),

      print(r.status),


      emit(LoginSucsess(r)),
      userModel=r
    });
  }

  bool isVisibile= true;

  void ChangeVisibilty(){
    isVisibile=!isVisibile;
    emit(LoginChangeVisibilty());
  }
}
