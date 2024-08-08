import 'package:auvnet_cyper/core/utills/Constants.dart';
import 'package:dio/dio.dart';

class ApiServices{
  final Dio _dio=Dio(

    BaseOptions( 
      baseUrl: "https://student.valuxapps.com/api/",
      headers: {


      }
    )
  );
  final  _baseUrl="https://student.valuxapps.com/api/";


  Future<Response> get({required String endPoints,required bool auth})async{

  var response = await  _dio.get('$_baseUrl$endPoints',
      options: Options(
          headers: {
            'Content-Type': 'application/json',
            'lang':'en',
            if(auth)
              'Authorization':Token
          }
      )
  );
  return response;
  }


  Future<Response> post({
    required String endPoints,
    Map<String,dynamic>? query,
   required Map<String,dynamic>? data,
    required bool auth,


  }
      )async{

    var response = await  _dio.post(endPoints,
      data: data,
      queryParameters: query,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'lang':'en',
          if(auth)
          'Authorization':Token
        }
      )


    );
    return response;
  }
  Future<Response> put({
    required String endPoints,
    Map<String,dynamic>? query,
    required Map<String,dynamic>? data,
    required bool auth

  }
      )async{

    var response = await  _dio.put(endPoints,
        data: data,
        queryParameters: query,
        options: Options(
            headers: {
              'Content-Type': 'application/json',
              'lang':'en',
              if(auth)
                'Authorization':Token
            }
        )


    );
    return response;
  }

}