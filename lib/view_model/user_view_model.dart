import 'package:flutter/foundation.dart';
import 'package:practice_mvvm/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> savedUser(UserModel user) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString('token');
    notifyListeners();
    return UserModel(token: token.toString());
  }

  Future<bool> removeUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove('token');
    return true;
  }
}
