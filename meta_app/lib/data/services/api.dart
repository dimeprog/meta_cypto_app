import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta_app/app/app_constant.dart';
import 'package:meta_app/app/widgets/app_exception.dart';
// import 'package:http/http.dart';

class Api {
  // get method
  Future<dynamic> getData(String apiPath) async {
    final url = Uri.parse(BASEURL + apiPath);
    final result = await http.get(url);
    return processResponse(result);
  }

  // post method
  Future<dynamic> postData(
      String apiPath, dynamic body, dynamic headers) async {
    final url = Uri.parse(BASEURL + apiPath);
    final result =
        await http.post(url, body: json.encode(body), headers: headers);
    return processResponse(result);
  }
  // put method

  // process response
  dynamic processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        return json.decode(response.body);
      case 400:
        throw AppException(message: 'No internet connection');
      case 401:
      case 402:
      case 403:
      case 404:
        throw AppException(message: 'Unauthorized request');

      case 500:
      default:
        throw AppException(message: 'Error occured, Try again');
    }
  }

  ////
}
