class User {
  String _firstName;
  String _lastName;
  String _email;
  String _phone;
  String _password;
  String _flaglogged;

  User(this._firstName, this._lastName, this._email, this._phone,
      this._password,this._flaglogged);

  User.map(dynamic obj) {
    this._firstName = obj['fname'];
    this._lastName = obj['lname'];
    this._email = obj['email'];
    this._phone = obj['phone'];
    this._password = obj['password'];
    this._flaglogged = obj['flaglogged'];
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }
  String get flaglogged => _flaglogged;

  set flaglogged(String value) {
    _flaglogged = value;
  }
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["fname"] = _firstName;
    map["lname"] = _lastName;
    map["email"] = _email;
    map["phone"] = _phone;
    map["password"] = _password;
    map["flaglogged"] = _flaglogged;
    return map;
  }

}
