import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:practice_mvvm/data/app_exceptions.dart';
import 'package:practice_mvvm/data/network/base_apis_service.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getGetResponse(String url) async {
    // throw UnimplementedError();
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchedDataException('No internet connection');
    }
    return responseJson;
  }

  @override
  Future getPostResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 60));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchedDataException('No internet connection');
    }
    return responseJson;
    //throw UnimplementedError();
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 404:
        throw BadRequestException(response.body.toString());
      case 400:
        throw BadRequestException(response.body.toString());
      // case 400:
      //   throw BadRequestException(response.statusCode.toString());
      default:
        throw FetchedDataException('Server Error with status Code : ' +
            response.statusCode.toString());
    }
  }
}
