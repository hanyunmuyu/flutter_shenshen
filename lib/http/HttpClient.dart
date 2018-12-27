import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';

typedef CallBack(BuildContext context);

class HttpClient {
  static Options options = new Options(
    baseUrl: "http://192.168.1.66:88",
    connectTimeout: 5000,
    receiveTimeout: 3000,
    responseType: ResponseType.PLAIN,
  );
  static Dio dio = new Dio(options);

  static get(String path, Map<String, dynamic> mapData) async {
    var response = await dio.get(path, data: mapData);
    return response.data.toString();
  }

  static Future post(BuildContext context, String path, dynamic postData,
      [CallBack callback]) async {
    Timer timer = Timer(const Duration(milliseconds: 500), () {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          Future.delayed(const Duration(seconds: 5), () {
            Navigator.pop(context);
          });
          return GestureDetector(
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: 100.0,
                height: 100.0,
                alignment: Alignment.center,
                child: SizedBox(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          );
        },
      );
    });
    Response response;
    try {
      response = await dio.post(path, data: postData);
      if (timer.isActive) {
        timer.cancel();
      }
      if (callback != null) {
        callback(context);
      }
      return response.data.toString();
    } on DioError catch (e) {
      if (e.response == null) {
        if (e.type == DioErrorType.CONNECT_TIMEOUT) {
          return '''{"code": 500}''';
        }
      }
    }
  }
}
