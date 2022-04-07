import 'package:design/helper/custom_text_field.dart';
import 'package:design/helper/others_helper.dart';
import 'package:design/screen/forgot_pass/forgot_password.dart';
import 'package:design/screen/get_started.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/login_service.dart';
import '../home/home_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

TextEditingController _phoneController = TextEditingController();
TextEditingController _passController = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.05, right: screenWidth * 0.05),
              child: Consumer<LoginService>(
                builder: (context, provider, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      height: screenHeight * 0.29,
                      width: screenWidth,
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight * 0.06),
                          Container(
                            color: Colors.white,
                            width: screenWidth,
                            height: screenHeight * 0.12,
                            child: Image.asset("assets/images/k.jpeg"),
                          ),
                          SizedBox(height: screenHeight * 0.05),
                          Center(
                            child: Text("Kambaii Health",
                                style: TextStyle(
                                    fontSize: screenWidth * 0.07,
                                    color: allColor.blackTextColor)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.03),
                      child: Text(
                        "Phone",
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.02,
                    ),
                    CustomTextField(
                      controller: _phoneController,
                      isNumberField: true,
                      hintText: "Enter your phone number",
                      suffixIcon: const Icon(Icons.phone),
                      obsecureValue: false,
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.03),
                      child: Text(
                        "Password",
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.02,
                    ),
                    CustomTextField(
                      controller: _passController,
                      hintText: "Enter your password",
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      obsecureValue: true,
                    ),
                    SizedBox(height: screenWidth * 0.03),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgottPassword()));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: screenWidth * 0.04, color: Colors.blue),
                        )),
                    SizedBox(height: screenWidth * 0.15),
                    Center(
                      child: InkWell(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                            if (provider.isloading == false) {
                              provider.login(_phoneController.text,
                                  _passController.text, context);
                            }
                          }
                          // Navigator.of(context).pushAndRemoveUntil(
                          //     MaterialPageRoute(
                          //         builder: (context) => const HomePage()),
                          //     (Route<dynamic> route) => false);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: allColor.backGroundColor,
                              borderRadius: BorderRadius.circular(6)),
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.10,
                              vertical: screenWidth * 0.04),
                          child: provider.isloading == false
                              ? Text(
                                  "Log in",
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.05,
                                      color: Colors.white),
                                )
                              : SizedBox(
                                  height: 23,
                                  child: OthersHelper().spinner(Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
