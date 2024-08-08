
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/Errors/faliuer.dart';
import '../../../login/data/model/LoginModel.dart';

abstract class RegisterRepo {

  Future<Either<Failure, UserModel>> Register({required String email,
    required String password,
    required String name,
    required String phone


    ,});
}
