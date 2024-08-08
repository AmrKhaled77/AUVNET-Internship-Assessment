import 'package:auvnet_cyper/features/Register/data/repo/register%20repo.dart';
import 'package:auvnet_cyper/features/login/data/model/LoginModel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {

  RegisterCubit(this.registerRepo) : super(RegisterInitial());


  final RegisterRepo registerRepo;



  Register ({
    required String email, required String password,
    required String name, required String phone,
  })async{
    emit(RegisterLoading());
    var response =await registerRepo.Register(email: email,
        password: password,
        name: name,
        phone: phone);





    response.fold((l) => {

      emit(RegisterError(l.errorMassge))
    }, (r) => { print('status'),

      print(r.status),


      emit(RegisterSucsess(r))
    });
  }
}
