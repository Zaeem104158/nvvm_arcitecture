import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:practice_mvvm/repository/auth_repository.dart';
import 'package:practice_mvvm/utilits/routes/routes_name.dart';
import 'package:practice_mvvm/utilits/utilits.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool loadingValue) {
    _loading = loadingValue;
    notifyListeners();
  }

  bool _signUploading = false;
  bool get signUploading => _signUploading;

  setsignUpLoading(bool signUploadingValue) {
    _signUploading = signUploadingValue;
    notifyListeners();
  }

  final _myrepo = AuthRepository();

  Future<void> loginApi(dynamic data, context) async {
    setLoading(true);
    _myrepo.loginApi(data).then((value) {
      setLoading(false);
      Utilits.flushbarSuccessfullMessage('Login Successfully', context);
      Timer(Duration(seconds: 2), () {
        Navigator.pushNamed(context, RoutesName.home);
      });

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, StackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utilits.flushbarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(dynamic data, context) async {
    setsignUpLoading(true);
    _myrepo.signUpApi(data).then((value) {
      setsignUpLoading(false);
      Utilits.flushbarSuccessfullMessage('Account is Registered', context);
      Timer(Duration(seconds: 2), () {
        Navigator.pushNamed(context, RoutesName.login);
      });

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, StackTrace) {
      setsignUpLoading(false);
      if (kDebugMode) {
        Utilits.flushbarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
