import 'package:auvnet_cyper/features/search/data/SearchModel.dart';
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../data/repo/SearchIMPL.dart';
import '../../../data/repo/SearchRepo.dart';

part 'search_bloc_state.dart';

class SearchBlocCubit extends Cubit<SearchBlocState> {
  SearchBlocCubit() : super(SearchBlocInitial());


  final SearchIMPL searchrepo= SearchIMPL()  ;

  GetData({required String key})async{
    emit(SearchBlocLodaing());

    var data =await searchrepo.GetSearchData(key: key);

    data.fold((l) => {

      emit(SearchBlocfaliur(errorMasege: l.errorMassge)),
      print('object'),
      print(l.errorMassge)

    }, (r) => {
      print('object'),



      emit(SearchBlocsucsses(Proudacts:r ))
    });
  }
}
