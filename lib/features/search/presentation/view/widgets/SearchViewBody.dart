import 'package:auvnet_cyper/core/utills/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../core/widgets/TextFormFeild.dart';
import '../../viewModel/search bloc/search_bloc_cubit.dart';
import 'searchresultListview.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                CustomTextFormField(
                  controller: controller,
                  label: 'search',
                  onChanged: (val) {
                    BlocProvider.of<SearchBlocCubit>(context).GetData(key: val);
                  },
                  sufixIcon: IconButton(
                    onPressed: () {
                      print(Token);
                      BlocProvider.of<SearchBlocCubit>(context)
                          .GetData(key: controller.text);
                    },
                    icon: Icon(Icons.search),
                  ),
                ),
                BlocBuilder<SearchBlocCubit, SearchBlocState>(
                    builder: (context, state) {
                  if (state is SearchBlocInitial) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .7,
                      child: const Center(
                        child: Text('no data '),
                      ),
                    );
                  } else if (state is SearchBlocsucsses) {
                    return Expanded(
                        child: customSearchresult(
                      Model: state.Proudacts,
                    ));
                  } else if (state is SearchBlocfaliur) {
                    return Text(state.errorMasege);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
