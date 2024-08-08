




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/viewModel/home cubit/home_cubit.dart';

Future<void> showMyDialog(BuildContext context,int price) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // User must tap button to dismiss
    builder: (BuildContext context) {
      

      return BlocBuilder<HomeCubit,HomeState>(
        builder: (BuildContext context, state) {

          return  AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },

                      child: Icon(Icons.close)),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text('payment method : '),
                        Text( BlocProvider.of<HomeCubit>(context).makeOrderModel!.data!.paymentMethod!)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text('Subtotal: '),
                        Text('${price}'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text('vat : '),
                        Text( "${ BlocProvider.of<HomeCubit>(context).makeOrderModel!.data!.vat!.round()}")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text('discount : '),
                        Text( '${BlocProvider.of<HomeCubit>(context).makeOrderModel!.data!.discount!}')
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text('Total : '),
                        Text( '${BlocProvider.of<HomeCubit>(context).makeOrderModel!.data!.vat!.round()!+ price}')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            contentTextStyle: TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
          );
        },

      );
    },
  );
}