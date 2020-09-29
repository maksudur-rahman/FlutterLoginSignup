import 'package:flutter/material.dart';
import 'package:login_singnup_flutter_app/ui/widgets/responsive_ui.dart';
import 'package:validators/validators.dart' as validator;

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final IconData icon;
  final bool isPassword;
  final bool isEmail;
  double _width;
  double _pixelRatio;
  bool large;
  bool medium;
  final Function validator;
  final Function onSaved;


  CustomTextField(
    {this.hint,
      this.textEditingController,
      this.icon,
      this.isPassword = false,
      this.isEmail = false,
      this.validator,
      this.onSaved
     });

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium=  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large? 12 : (medium? 10 : 8),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        validator: validator,
        onSaved: onSaved,
        obscureText: isPassword ? true : false,
        cursorColor: Colors.cyan,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.cyan, size: 20),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
