import 'package:auvnet_cyper/features/search/presentation/viewModel/search%20bloc/search_bloc_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/SearchViewBody.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBlocCubit>(

      create: (BuildContext context) =>SearchBlocCubit() ,


      child: const Scaffold(
          resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SearchViewBody(),
        ),

      ),
    );
  }
}



