import 'dart:async';
import 'package:login_singnup_flutter_app/database/database_helper.dart';
import 'package:login_singnup_flutter_app/models/user.dart';

class RestData {
  Future<User> login( String email, String password) async {
    String flagLogged = "logged";
    //simulate internet connection by selecting the local database to check if user has already been registered
    var user = new User(null, null, email, null,password,null);
    var db = new DatabaseHelper();
    var userRetorno = new User(null,null,null,null,null,null);
    userRetorno = await db.selectUser(user);
    if(userRetorno != null){
      flagLogged = "logged";
      return new Future.value(new User(null, null, email, null,password,flagLogged));
    }else {
      flagLogged = "not";
      return new Future.value(new User(null, null, email, null,password,flagLogged));
    }
  }

}