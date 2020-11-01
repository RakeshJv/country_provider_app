import 'package:country_provider_app/model/country.dart';
import 'package:country_provider_app/util/app_string.dart';
import 'package:country_provider_app/util/custom_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart';

class  ApiProvider{

  Future<Response> fetchCountry(String url) async {

    print("url------" +url.toString());

    Response response = await http.get(url);
return response;
  }


  //final String _baseUrl = "https://api.chucknorris.io/";

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(url);
      responseJson = _response(response);

      print("-666666--->"+responseJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url) async
  {
    var responseJson;
    try {
      final response = await http.post(url);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
  dynamic _response(http.Response response)
  {
    switch (response.statusCode) {
      case 200:


        print("--response.body -->"+response.body);
        var responseJson = json.decode(response.body.toString());

        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}