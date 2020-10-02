import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_singnup_flutter_app/constants/constants.dart';
import 'package:login_singnup_flutter_app/database/database_helper.dart';
import 'package:login_singnup_flutter_app/models/user.dart';
import 'package:login_singnup_flutter_app/ui/login.dart';
import 'package:login_singnup_flutter_app/ui/widgets/custom_shape.dart';
import 'package:login_singnup_flutter_app/ui/widgets/customappbar.dart';
import 'package:login_singnup_flutter_app/ui/widgets/responsive_ui.dart';
import 'package:login_singnup_flutter_app/ui/widgets/textformfield.dart';
import 'package:validators/validators.dart' as validator;


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  User user = User(null,null,null,null,null,null);
  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  bool _isLoading = false;


  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88, child: CustomAppBar()),
                clipShape(),
                form(),
                acceptTermsTextRow(),
                SizedBox(
                  height: _height / 35,
                ),
                button(),
                infoTextRow(),
                socialIconsRow(),
                //signInTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 8
                  : (_medium ? _height / 7 : _height / 6.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.cyan, Colors.cyanAccent],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large
                  ? _height / 12
                  : (_medium ? _height / 11 : _height / 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.cyan, Colors.cyanAccent],
                ),
              ),
            ),
          ),
        ),
        Container(
          height: _height / 5.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.0,
                  color: Colors.black26,
                  offset: Offset(1.0, 10.0),
                  blurRadius: 20.0),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
            onTap: () {
              print('Adding photo');
            },
            child: ClipOval(
              child: Image.asset(
                "assets/signup.jpg",
                height: _height/3.5,
                width: _width/3.5,
              ),
            )
          ),
        ),
//        Positioned(
//          top: _height/8,
//          left: _width/1.75,
//          child: Container(
//            alignment: Alignment.center,
//            height: _height/23,
//            padding: EdgeInsets.all(5),
//            decoration: BoxDecoration(
//              shape: BoxShape.circle,
//              color:  Colors.orange[100],
//            ),
//            child: GestureDetector(
//                onTap: (){
//                  print('Adding photo');
//                },
//                child: Icon(Icons.add_a_photo, size: _large? 22: (_medium? 15: 13),)),
//          ),
//        ),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            lastNameTextFormField(),
            SizedBox(height: _height / 60.0),
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            phoneTextFormField(),
            SizedBox(height: _height / 60.0),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    return CustomTextField(
      icon: Icons.person,
      hint: "First Name",
      validator: (String value) {
        String pattern = r'(^[a-zA-Z ]*$)';
        RegExp regExp = new RegExp(pattern);
        if (value.length == 0) {
          return "Name is Required";
        } else if (!regExp.hasMatch(value)) {
          return "Name must be a-z and A-Z";
        }
        return null;
      },
      onSaved: (String value) {
        user.firstName = value;
      },
    );
  }

  Widget lastNameTextFormField() {
    return CustomTextField(
      icon: Icons.person,
      hint: "Last Name",
      validator: (String value) {
        String pattern = r'(^[a-zA-Z ]*$)';
        RegExp regExp = new RegExp(pattern);
        if (value.length == 0) {
          return "Name is Required";
        } else if (!regExp.hasMatch(value)) {
          return "Name must be a-z and A-Z";
        }
        return null;
      },
      onSaved: (String value) {
        user.lastName = value;
      },
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      icon: Icons.email,
      hint: "Email ID",
      isEmail: true,
      validator: (String value) {
        if (!validator.isEmail(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
      onSaved: (String value) {
        user.email = value;
      },

    );
  }

  Widget phoneTextFormField() {
    return CustomTextField(
      icon: Icons.phone,
      hint: "Mobile Number",
      validator: (String value){
        String pattern = r'(^[0-9]*$)';
        RegExp regExp = new RegExp(pattern);
        if (value.length == 0) {
          return "Mobile is Required";
        } else if (value.length < 11) {
          return "Mobile number must 11 digits";
        } else if (!regExp.hasMatch(value)) {
          return "Mobile Number must be digits";
        }
        return null;
      },
      onSaved: (String value) {
        user.phone = value;
      },
    );
  }

  Widget passwordTextFormField() {
    return CustomTextField(
      icon: Icons.lock,
      hint: "Password",
      isPassword: true,
      validator: (String value) {
        if (value.length < 7) {
          return 'Password should be minimum 7 characters';
        }

        _formKey.currentState.save();

        return null;
      },
      onSaved: (String value) {
        user.password = value;
      },
    );
  }

  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: Colors.cyan,
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
              }),
          Text(
            "I accept all terms and conditions",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 12 : (_medium ? 11 : 10)),
          ),
        ],
      ),
    );
  }

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        _submit();
        /*print("Routing to your account");*/
        /*if (_formKey.currentState.validate()) {
          _formKey.currentState.save();

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Result(user: this.user)));
        }*/
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
//        height: _height / 20,
        width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.cyan, Colors.cyanAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'SIGN UP',
          style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10)),
        ),
      ),
    );
  }

  Widget infoTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Or create using social media",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 12 : (_medium ? 11 : 10)),
          ),
        ],
      ),
    );
  }

  Widget socialIconsRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 80.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/googlelogo.png"),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/fblogo.jpg"),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/twitterlogo.jpg"),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(SIGN_IN);
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.cyan,
                  fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
  void _submit(){
    //User user = User(null,null,null,null,null);
    final form = _formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        var users = new User(user.firstName, user.lastName, user.email, user.phone,user.password,null);
        var db = new DatabaseHelper();
        db.saveUser(users);
        _isLoading = false;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInPage()));
      });
    }
  }
}
