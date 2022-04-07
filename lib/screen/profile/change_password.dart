import 'package:design/helper/custom_text_field.dart';
import 'package:design/helper/others_helper.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/services/change_password_service.dart';
import 'package:design/services/login_service.dart';
import 'package:design/services/profile_update_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ChangePasswordP extends StatefulWidget {
  const ChangePasswordP({Key? key}) : super(key: key);

  @override
  State<ChangePasswordP> createState() => _ChangePasswordPState();
}

final _signUpKey = GlobalKey<FormState>();
TextEditingController _passController = TextEditingController();
TextEditingController _confirmPassController = TextEditingController();
var isLoading = false;

class _ChangePasswordPState extends State<ChangePasswordP> {
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
              child: Consumer<ChangePasswordService>(
                builder: (BuildContext context, provider, Widget? child) =>
                    Column(
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
                            child: Text("Change Password",
                                style: TextStyle(
                                    fontSize: screenWidth * 0.07,
                                    color: allColor.blackTextColor)),
                          ),
                        ],
                      ),
                    ),

                    //Password ================>
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.03),
                      child: Text(
                        "New password",
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.02,
                    ),
                    CustomTextField(
                      controller: _passController,
                      hintText: "Enter your new password",
                      suffixIcon: const Icon(Icons.edit),
                      obsecureValue: false,
                    ),

                    //Confirm password ================>
                    SizedBox(height: screenWidth * 0.06),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.03),
                      child: Text(
                        "Confirm new password",
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.02,
                    ),
                    CustomTextField(
                      controller: _confirmPassController,
                      hintText: "Re-type your new password",
                      suffixIcon: const Icon(Icons.edit),
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
                                  provider.changePassword(
                                      _passController.text, context);
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
                                    "Change",
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
