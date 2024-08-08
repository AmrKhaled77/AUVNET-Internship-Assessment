import 'package:auvnet_cyper/core/services/cacheHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/utills/Constants.dart';
import '../../../../core/widgets/TextFormFeild.dart';
import '../../../../core/widgets/customElevetedButton.dart';
import '../../../../core/widgets/toast.dart';
import '../../../../main.dart';
import '../../../home/presentation/viewModel/home cubit/home_cubit.dart';
import '../ViewModel/SettingsBloc/settings_cubit.dart';

class settinscreen extends StatelessWidget {
  const settinscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<FormState>();

    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    return BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {


      if (state is SettingsSucsses) {
        if (state.userModel.status!) {
          email = state.userModel.data!.email!;
          name = state.userModel.data!.name!;
          phone = state.userModel.data!.phone!;
          print('name${state.userModel.data!.email!}');
        }
      }
      if (state is UpdateSucsses) {
        if (state.userModel.status!) {
          email = state.userModel.data!.email!;
          name = state.userModel.data!.name!;
          phone = state.userModel.data!.phone!;
          showtoast(text: state.userModel.message!, color: Colors.green);
          print('name${state.userModel.data!.email!}');
        } else {
          showtoast(text: state.userModel.message!, color: Colors.red);
        }
      }
    }, builder: (context, state) {
      emailController.text = email;
      nameController.text = name;
      phoneController.text = phone;

      if (state is SettingsSucsses || state is UpdateSucsses) {
        return Form(
          key: key,
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomTextFormField(
                      controller: emailController,
                      label: 'email',
                      prefixIcon: const Icon(Icons.email),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomTextFormField(
                      controller: nameController,
                      label: 'name',
                      prefixIcon: const Icon(Icons.person),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomTextFormField(
                      controller: phoneController,
                      label: 'phone',
                      prefixIcon: const Icon(Icons.phone),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomEevetedButton(
                      text: 'update',
                      onPress: () {
                        if (key.currentState!.validate()) {
                          BlocProvider.of<SettingsCubit>(context).updateUser(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text);
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomEevetedButton(
                      text: 'LogOut',
                      onPress: () {
                        cacheHelper.clearData(key: 'token');
              
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MyApp()),

                        );
                        BlocProvider.of<HomeCubit>(context).CurrntIndex=0;
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Previous orders',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                  BlocBuilder<HomeCubit,HomeState>(
                    builder: (BuildContext context, HomeState state) {
              
                      return Visibility(
                        visible: BlocProvider.of<HomeCubit>(context)
                            .orderModel!
                            .data!
                            .data2!
                            .length !=
                            0,
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.3,
                            child: ListView.builder(
                                itemCount:
                                BlocProvider.of<HomeCubit>(context)
                                                                .orderModel!
                                                                .data!
                                                                .data2!
                                                                .length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(

                                          children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 8),
                                            child: Image.asset(

                                                height: 80,
                                                fit: BoxFit.fill,
                                                'assets/images/pastorder.png'),
                                          ),

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text('ID : ${BlocProvider.of<HomeCubit>(context)
                                                      .orderModel!
                                                      .data!
                                                      .data2![index].id}',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                                                  SizedBox(
                                                    width: MediaQuery.of(context).size.width*0.13,
                                                  ),

                                                  Text('Date : ${BlocProvider.of<HomeCubit>(context)
                                                      .orderModel!
                                                      .data!
                                                      .data2![index].date}',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                                ],
                                              ),
                                              const SizedBox(height: 18,),

                                              Text('prics : ${BlocProvider.of<HomeCubit>(context)
                                                  .orderModel!
                                                  .data!
                                                  .data2![index].total!.round()} EGP',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                            ],
                                          ),


                                        ],),

                                      ],
                                    ),
                                  );

                                })),
                      );
                    },
              
                  ),
                ],
              ),
            ),
          ),
        );
      }
      else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
