import 'package:design/screen/auth/phone_number_verify.dart';
import 'package:design/services/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/custom_text_field.dart';
import '../../helper/others_helper.dart';
import '../get_started.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

final _signUpKey = GlobalKey<FormState>();
TextEditingController _firstnameController = TextEditingController();
TextEditingController _lastnameController = TextEditingController();
TextEditingController _phoneController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passController = TextEditingController();
TextEditingController _confirmPassController = TextEditingController();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _signUpKey,
            child: Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.05, right: screenWidth * 0.05),
              child: Consumer<SignupService>(
                builder: (context, provider, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      height: screenHeight * 0.27,
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
                          SizedBox(height: screenHeight * 0.04),
                          Center(
                            child: Text("Kambaii Health",
                                style: TextStyle(
                                    fontSize: screenWidth * 0.07,
                                    color: allColor.blackTextColor)),
                          ),
                        ],
                      ),
                    ),

                    //First name ===========>
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.03),
                      child: Text(
                        "First Name",
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.02,
                    ),
                    CustomTextField(
                      controller: _firstnameController,
                      hintText: "Enter your first name",
                      suffixIcon: const Icon(Icons.drive_file_rename_outline),
                      obsecureValue: false,
                    ),

                    //Last name ===============>
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.03),
                      child: Text(
                        "Last Name",
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.02,
                    ),
                    CustomTextField(
                      controller: _lastnameController,
                      hintText: "Enter your last name",
                      suffixIcon: const Icon(Icons.drive_file_rename_outline),
                      obsecureValue: false,
                    ),

                    // Phone ===========>
                    SizedBox(
                      height: screenHeight * 0.03,
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
                      hintText: "Enter your phone number",
                      suffixIcon: const Icon(Icons.phone),
                      obsecureValue: false,
                    ),

                    //Email ==============>
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.03),
                      child: Text(
                        "Email",
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.02,
                    ),
                    CustomTextField(
                      controller: _emailController,
                      hintText: "Email",
                      suffixIcon: const Icon(Icons.email),
                      obsecureValue: false,
                    ),

                    //Password ================>
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

                    //Confirm password ================>
                    SizedBox(height: screenWidth * 0.06),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.03),
                      child: Text(
                        "Confirm password",
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.02,
                    ),
                    CustomTextField(
                      controller: _confirmPassController,
                      hintText: "Re-type your password",
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      obsecureValue: true,
                    ),
                    SizedBox(height: screenWidth * 0.10),

                    Center(
                      child: InkWell(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (_signUpKey.currentState!.validate()) {
                              if (_passController.text !=
                                  _confirmPassController.text) {
                                OthersHelper().showToast(
                                    'Password didn\'t match',
                                    allColor.blackTextColor);
                              } else {
                                if (provider.isloading == false) {
                                  provider.signUp(
                                      _firstnameController.text,
                                      _lastnameController.text,
                                      _phoneController.text,
                                      _passController.text,
                                      _emailController.text,
                                      context);
                                }
                              }
                            }
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
                                    "Sign up",
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.05,
                                        color: Colors.white),
                                  )
                                : SizedBox(
                                    height: 23,
                                    child:
                                        OthersHelper().spinner(Colors.white)),
                          )),
                    ),

                    const SizedBox(
                      height: 40,
                    )
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
