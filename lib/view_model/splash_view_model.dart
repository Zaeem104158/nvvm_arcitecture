import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:practice_mvvm/model/user_model.dart';
import 'package:practice_mvvm/utilits/routes/routes_name.dart';
import 'package:practice_mvvm/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUsersData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUsersData().then((value) async {
      print(value.token.toString());
      if (value.token == 'null' || value.token == '') {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, StackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
