import 'package:auvnet_cyper/core/widgets/TextFormFeild.dart';
import 'package:auvnet_cyper/core/widgets/customElevetedButton.dart';
import 'package:auvnet_cyper/core/widgets/toast.dart';
import 'package:auvnet_cyper/features/Register/presentation/viewModel/registerCubit/register_cubit.dart';
import 'package:auvnet_cyper/features/login/presentation/view/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../data/repo/registerRepo impl.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var FormKey = GlobalKey<FormState>();
    var EmailControler = TextEditingController();
    var passswordControler = TextEditingController();
    var nameControler = TextEditingController();
    var phoneControler = TextEditingController();
    return BlocProvider<RegisterCubit>(
        create: (context) => RegisterCubit(RegesterRepoImpl()),
        child: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSucsess) {
              if (state.model.status!) {
                showtoast(
                    text: state.model.message! + ' please log in now ',
                    color: Colors.green);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              } else {
                showtoast(text: state.model.message!, color: Colors.red);
              }
            } else if (state is RegisterError) {
              showtoast(text: state.errorMasge, color: Colors.red);
            }
          },
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 120, right: 16, left: 16, bottom: 16),
                child: Form(
                  key: FormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'REGISTER NOW',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Register now to brows our hot offers',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomTextFormField(
                        prefixIcon: const Icon(Icons.account_box_rounded),
                        controller: nameControler,
                        label: 'Name',
                        hintText: 'name',
                        keyboardType: TextInputType.name,
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomTextFormField(
                        prefixIcon: const Icon(Icons.phone),
                        controller: phoneControler,
                        label: 'phone',
                        validator: (val) {
                          if (val!.length! != 11) {
                            return 'plaese enter valid number';
                          }
                        },
                        hintText: 'phone',
                        keyboardType: TextInputType.phone,
                        onTap: () {},
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
                      CustomTextFormField(
                        prefixIcon: const Icon(Icons.password_outlined),
                        sufixIcon: const Icon(Icons.visibility),
                        obscureText: true,
                        controller: passswordControler,
                        label: 'password',
                        hintText: 'password',
                        keyboardType: TextInputType.visiblePassword,
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      BlocBuilder<RegisterCubit, RegisterState>(
                        builder: (context, state) {
                          if (state is RegisterLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return CustomEevetedButton(
                                text: 'Login',
                                onPress: () {
                                  if (FormKey.currentState!.validate()) {
                                    BlocProvider.of<RegisterCubit>(context)
                                        .Register(
                                            email: EmailControler.text,
                                            password: passswordControler.text,
                                            name: nameControler.text,
                                            phone: phoneControler.text);
                                  }
                                });
                          }
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const Text(
                            'already have account ?',
                            style: TextStyle(fontSize: 15),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const LoginScreen()));
                              },
                              child: const Text(
                                'Login now',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
