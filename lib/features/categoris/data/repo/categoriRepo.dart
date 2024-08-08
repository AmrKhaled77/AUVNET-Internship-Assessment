
import 'package:dartz/dartz.dart';


import '../../../../core/Errors/faliuer.dart';
import '../model/CategoriModel.dart';


abstract class CategoriRepo {

  Future<Either<Failure, CategoriModel>> GetCategoriData();
}