import 'package:flutter/cupertino.dart';
import 'package:login_singnup_flutter_app/database/rest_data.dart';
import 'package:login_singnup_flutter_app/models/user.dart';

abstract class LoginPageContract{
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class LoginPagePresenter {
  LoginPageContract _view;
  RestData api = new RestData();
  LoginPagePresenter(this._view);

//Simulator login
  doLogin(String username, String password){
    api
        .login(username, password)
        .then((user) => _view.onLoginSuccess(user))
        .catchError((onError) async => _view.onLoginError(onError.toString()));
  }
}