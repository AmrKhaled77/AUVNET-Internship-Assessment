import 'package:dartz/dartz.dart';

import '../../../../core/Errors/faliuer.dart';
import '../SearchModel.dart';

abstract class SEarchRepo {

  Future<Either<Failure,SearchModel>> GetSearchData({ required String key});


}