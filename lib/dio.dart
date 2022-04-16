import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static   Dio? dio;
  static init(){
    dio = Dio(


      //https://newsapi.org/v2/everything?q=tesla&from=2022-02-09&sortBy=publishedAt&apiKey=API_KEY
      BaseOptions(
        baseUrl:'https://student.valuxapps.com/api/',
        //  'https://newsdata.io/',
        //'https://reqres.in/',
        // baseUrl: 'https://student.valuxapps.com/api/',
        // for login and write this because its constant
        headers: {
          'Content-Type':'application/json',
          'lang':'en'
        },
        receiveDataWhenStatusError: true,

      ),

    );

  }

  static Future<Response> getData({
    required String url ,
    Map<String, dynamic>? query,
    @required
    Map<String, dynamic>? data,
    String lang='ar',
    String? token,
  }) async{
    // here we add headers of postman because we change the  whole header
    dio!.options.headers ={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token,
    };

    return await dio!.get(url , queryParameters: query);
  }


  static Future<Response> postData({
    required String url ,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang='ar',
    String? token,
  }) async{
    dio!.options.headers ={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token,
    };


    return dio!.post(url,queryParameters: query,data: data
    );
  }





//api.goperigon.com/v1/all?category=Sports&language=en&from=2022-03-02&apiKey=[KEY]

//https://jsonplaceholder.typicode.com/posts

//https://stats.nba.com/stats/boxscore


}