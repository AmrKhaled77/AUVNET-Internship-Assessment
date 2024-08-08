

import 'package:auvnet_cyper/features/search/data/repo/SearchRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/Errors/faliuer.dart';
import '../../../../core/services/apiServices.dart';
import '../SearchModel.dart';


class SearchIMPL implements SEarchRepo{
  final ApiServices apiServices=ApiServices();

  @override
  Future<Either<Failure, SearchModel>> GetSearchData({required String key}) async{
    try {
      var responce= await apiServices.post(endPoints: 'products/search',auth: false, data: {
        'text':key,

      });




      return Right(SearchModel.fromjson(responce.data) );
    } on Exception catch (e) {
      if (e is DioError){
        return Left(servasicesFailure.FromDio(e));
      }
      return left(servasicesFailure(errorMassge: e.toString()));
    }
  }
  }

