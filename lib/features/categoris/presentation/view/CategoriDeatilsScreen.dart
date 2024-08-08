
import 'package:auvnet_cyper/features/search/presentation/view/widgets/searchresultListview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/TextFormFeild.dart';
import '../viewModel/catrgori Cubit/catigori_cubit.dart';

class CategoriDeatilsScreen extends StatelessWidget {

  const CategoriDeatilsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return   Padding(
      padding: const EdgeInsets.all(30.0),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [



                BlocBuilder<CatigoriCubit, CatigoriState>(
                    builder: (context, state) {
                     if(state is CatigoriDetailsSucsses){

                        return Expanded(child: customSearchresult(Model: state.Proudacts,));


                      }else {
                        return const Center(child: CircularProgressIndicator(),);

                      }

                    }
                )


              ],
            ),
          )
        ],

      ),
    );
  }
}



