
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/Errors/faliuer.dart';
import '../model/LoginModel.dart';

abstract class LoginRepo {

  Future<Either<Failure, UserModel>> Login({required String email,
    required String password});
}
