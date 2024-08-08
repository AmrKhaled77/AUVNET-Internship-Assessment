import 'package:dio/dio.dart';

abstract class Failure {

 final String errorMassge;

  Failure({required this.errorMassge});

}


class servasicesFailure extends Failure{
  servasicesFailure({required super.errorMassge});


  factory servasicesFailure.FromDio(DioError dioError){
    switch(dioError.type){
      case DioExceptionType.connectionTimeout:
        return servasicesFailure(errorMassge: "connection time out");
      case DioExceptionType.sendTimeout:
        return servasicesFailure(errorMassge: "send time out");
      case DioExceptionType.receiveTimeout:
        return servasicesFailure(errorMassge: "recive time out");
      case DioExceptionType.badCertificate:
        return servasicesFailure(errorMassge: "bad Certificate");
      case DioExceptionType.badResponse:
return servasicesFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return servasicesFailure(errorMassge: "request was cancels");
      case DioExceptionType.connectionError:
        return servasicesFailure(errorMassge: "connection Error");
      case DioExceptionType.unknown:
        return servasicesFailure(errorMassge: 'Ops there was   error ,please try later!');
        default:
          return servasicesFailure(errorMassge: 'Ops there was   error ,please try later!');

    }



  }


  factory servasicesFailure.fromResponse(int statusCode,dynamic response){

    if(statusCode==400||statusCode==401||statusCode==403){
      return servasicesFailure(errorMassge: response['error']['message']);
    }else if (statusCode==404){
      return servasicesFailure(errorMassge: 'your request not found ,please try later!');

    }else if (statusCode==500){
      return servasicesFailure(errorMassge: 'internal server error ,please try later!');

    }else{
      return servasicesFailure(errorMassge: 'Ops there was   error ,please try later!');
    }

  }
}



