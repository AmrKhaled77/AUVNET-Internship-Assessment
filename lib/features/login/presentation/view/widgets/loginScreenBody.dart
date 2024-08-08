import 'package:auvnet_cyper/core/services/cacheHelper.dart';
import 'package:auvnet_cyper/core/widgets/customElevetedButton.dart';
import 'package:auvnet_cyper/features/login/data/repo/LoginRepoImpl.dart';
import 'package:auvnet_cyper/features/login/presentation/viewModel/loginCubit/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../core/utills/Constants.dart';
import '../../../../../core/widgets/TextFormFeild.dart';
import '../../../../../core/widgets/toast.dart';
import '../../../../Register/presentation/view/RegisterScreen.dart';
import '../../../../home/presentation/view/HomePage.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController EmailControler = TextEditingController();
    TextEditingController passswordControler = TextEditingController();

    var FormKey = GlobalKey<FormState>();
    return BlocProvider<LoginCubit>(
      create: (context) {
        return LoginCubit(LoginRepoImpl());
      },
      child: BlocListener<LoginCubit, LoginState>(
        listener: (BuildContext context, state) {
          if (state is LoginSucsess) {
            if (state.loginModel.status!) {
              Token = state.loginModel.data!.token!;
              cacheHelper.saveData(
                  key: 'token', value: state.loginModel.data!.token);
              print('ssss');
              showtoast(color: Colors.green, text: state.loginModel.message!);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const HomePage()));
            } else {
              showtoast(color: Colors.red, text: state.loginModel.message!);
            }
          } else if (state is LoginError) {
            showtoast(color: Colors.red, text: state.Errorrmassge);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: FormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Login now to brows our hot offers',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormField(
                    prefixIcon: const Icon(Icons.email),
                    controller: EmailControler,
                    label: 'email',
                    addEmailValidation: true,
                    hintText: 'email',
                    keyboardType: TextInputType.emailAddress,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return CustomTextFormField(
                        prefixIcon: const Icon(Icons.password_outlined),
                        sufixIcon: IconButton(
                            onPressed: () {
                              BlocProvider.of<LoginCubit>(context)
                                  .ChangeVisibilty();
                            },
                            icon: Icon(
                                BlocProvider.of<LoginCubit>(context).isVisibile
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                        obscureText:
                            BlocProvider.of<LoginCubit>(context).isVisibile,
                        controller: passswordControler,
                        label: 'password',
                        hintText: 'password',
                        keyboardType: TextInputType.visiblePassword,
                        onTap: () {},
                      );
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return CustomEevetedButton(
                          text: 'Login',
                          onPress: () {
                            if (FormKey.currentState!.validate()) {
                              BlocProvider.of<LoginCubit>(context).Login(
                                email: EmailControler.text,
                                password: passswordControler.text,
                              );
                            }
                          },
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Don\'t have account ?',
                        style: TextStyle(fontSize: 15),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const RegisterScreen()));
                          },
                          child: const Text(
                            'Register now',
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
