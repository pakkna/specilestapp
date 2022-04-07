import 'package:design/screen/get_started.dart';
import 'package:design/services/update_forgotten_password_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/others_helper.dart';

class FindAccount extends StatefulWidget {
  const FindAccount({Key? key}) : super(key: key);

  @override
  _FindAccountState createState() => _FindAccountState();
}

class _FindAccountState extends State<FindAccount> {
  TextEditingController otpController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.05, right: screenWidth * 0.05),
            child: Consumer<UpdateForgottenPasswordService>(
              builder: (context, provider, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: allColor.backGroundColor),
                          onPressed: () {},
                          child: Text(
                            "Dr. Mahmood",
                            style: TextStyle(fontSize: screenWidth * 0.05),
                          )),
                      const Spacer(),
                      SizedBox(
                        height: screenHeight * 0.08,
                        child: Padding(
                          padding: EdgeInsets.only(right: screenWidth * 0.05),
                          child: const Image(
                              image: AssetImage("assets/images/men.png")),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  TextFormField(
                    controller: otpController,
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
                      hintText: "Enter code",
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextFormField(
                    controller: passController,
                    obscureText: true,
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
                      hintText: "New Password",
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextFormField(
                    controller: confirmPassController,
                    obscureText: true,
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
                      hintText: "Confirm Password",
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  SizedBox(
                    width: screenWidth,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () {
                          if (provider.isloading == false) {
                            if (otpController.text.isNotEmpty &&
                                passController.text.isNotEmpty &&
                                confirmPassController.text.isNotEmpty) {
                              if (passController.text !=
                                  confirmPassController.text) {
                                OthersHelper().showToast(
                                    'Password didn\'t match',
                                    allColor.redColor);
                              } else {
                                FocusScope.of(context).unfocus();
                                //Update pass api hit ========>
                                provider.updatePass(otpController.text,
                                    passController.text, context);
                              }
                            } else {
                              OthersHelper().showToast(
                                  'Field can not be empty', allColor.redColor);
                            }
                          }
                        },
                        child: provider.isloading == false
                            ? Text(
                                "Update",
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              )
                            : SizedBox(
                                height: 15,
                                child: OthersHelper().spinner(Colors.white))),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
