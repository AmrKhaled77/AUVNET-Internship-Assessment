import 'package:auvnet_cyper/features/categoris/data/model/CategoriModel.dart';
import 'package:auvnet_cyper/features/categoris/data/repo/categoriRepo.dart';
import 'package:auvnet_cyper/features/search/data/repo/SearchIMPL.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import '../../../../search/data/SearchModel.dart';
import '../../../../search/data/repo/searchRepo.dart';

part 'catigori_state.dart';

class CatigoriCubit extends Cubit<CatigoriState> {
  CatigoriCubit(this.categoriRepo) : super(CatigoriInitial());

  final CategoriRepo categoriRepo;
  final SearchIMPL searchrepo=SearchIMPL();


  late CategoriModel CategoriData;
  getCategoriData()async{

    emit(CatigoriLoading());
    var response =await categoriRepo.GetCategoriData();





    response.fold((l) => {
      print('status'),
      print(l.errorMassge),
      emit(CatigoriError(l.errorMassge))
    }, (r) => { print('status'),

      print(r.elments.data.length),


      CategoriData=r,


      emit(CatigoriSucsses(r))
    });

  }

  GetData({required String key})async{
    emit(CatigoriLoading());

    var data =await searchrepo.GetSearchData(key: key);

    data.fold((l) => {

      emit(CatigoriError( l.errorMassge)),
      print('object'),
      print(l.errorMassge)

    }, (r) => {
      print('object'),




      emit(CatigoriDetailsSucsses(Proudacts: r))
    });
  }
}
