import 'package:flutter/material.dart';

import '../screen/get_started.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController controller;
  String hintText;
  bool obsecureValue;
  var suffixIcon;
  bool isNumberField;

  CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.obsecureValue,
      required this.suffixIcon,
      this.isNumberField = false})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

String passStore = "";

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: widget.controller,
      textInputAction: TextInputAction.next,
      keyboardType:
          widget.isNumberField ? TextInputType.number : TextInputType.text,
      validator: (value) {
        bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value!);
        if (value.isEmpty) {
          return "This field is empty!";
        }
        if (widget.hintText == "Email") {
          if (!emailValid) {
            return "Email format is not correct!";
          }
        }
        if (widget.hintText == "Password") {
          passStore = value;
          if (value.length < 6) {
            return "Password must be atleast 6 char!";
          }
        }
        if (widget.hintText == "Confirm Password") {
          if (passStore != value) {
            return "Password didn't match!";
          }
        }
      },
      obscureText: widget.obsecureValue,
      // cursorColor: allColor.textFieldColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: allColor.textFieldColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        focusColor: Colors.black12,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
