import 'package:flutter/foundation.dart';
import 'package:practice_mvvm/data/response/api_response.dart';
import 'package:practice_mvvm/model/single_user_model.dart';
import 'package:practice_mvvm/repository/single_user_repository.dart';

class SingleUserViewModel with ChangeNotifier {
  final _myRepo = SingleUserRepository();
  ApiResponse<SingleUserDataModel> singleUserData = ApiResponse.loading();
  setSingleUserData(ApiResponse<SingleUserDataModel> response) {
    singleUserData = response;
    notifyListeners();
  }

  Future<void> fetchSingleUserData() async {
    setSingleUserData(ApiResponse.loading());
    _myRepo.singleUserApi().then((value) {
      setSingleUserData(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setSingleUserData(ApiResponse.error(error.toString()));
    });
    return;
  }
}
