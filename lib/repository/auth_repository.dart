import 'package:practice_mvvm/data/network/base_apis_service.dart';
import 'package:practice_mvvm/data/network/network_apis_service.dart';
import 'package:practice_mvvm/resourse/app_url.dart';

class AuthRepository {
  BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostResponse(AppUrl.loginEndPoint, data);

      return response;
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostResponse(AppUrl.registerEndPoint, data);

      return response;
    } catch (error) {
      throw error;
    }
  }
}
