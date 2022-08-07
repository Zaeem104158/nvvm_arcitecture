import 'package:practice_mvvm/data/network/base_apis_service.dart';
import 'package:practice_mvvm/data/network/network_apis_service.dart';
import 'package:practice_mvvm/model/single_user_model.dart';
import 'package:practice_mvvm/resourse/app_url.dart';

class SingleUserRepository {
  BaseApiService _apiService = NetworkApiService();
  Future<SingleUserDataModel> singleUserApi() async {
    try {
      dynamic response =
          await _apiService.getGetResponse(AppUrl.userDataEndPoint);

      return response = SingleUserDataModel.fromJson(response);
    } catch (error) {
      throw error;
    }
  }
}
