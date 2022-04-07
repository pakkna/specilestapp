import 'package:design/helper/custom_text_field.dart';
import 'package:design/screen/forgot_pass/find_account.dart';
import 'package:design/services/forgot_password_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/others_helper.dart';

class ForgottPassword extends StatefulWidget {
  const ForgottPassword({Key? key}) : super(key: key);

  @override
  _ForgottPasswordState createState() => _ForgottPasswordState();
}

TextEditingController phoneController = TextEditingController();

class _ForgottPasswordState extends State<ForgottPassword> {
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
            child: Consumer<ForgotPasswordService>(
              builder: (context, provider, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Row(children: [
                    Text(
                      "KAMBAII",
                      style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                    const Spacer(),
                    Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.02),
                        child: SizedBox(
                            height: screenHeight * 0.07,
                            child: Image.asset("assets/images/k.jpeg")))
                  ]),
                  SizedBox(height: screenHeight * 0.05),
                  CustomTextField(
                    controller: phoneController,
                    isNumberField: true,
                    hintText: "Enter your phone number",
                    suffixIcon: const Icon(Icons.phone),
                    obsecureValue: false,
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  SizedBox(
                    width: screenWidth,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () {
                          if (provider.isloading == false) {
                            if (phoneController.text.isNotEmpty) {
                              provider.findPhone(phoneController.text, context);
                            }
                          }
                        },
                        child: provider.isloading == false
                            ? const Text("Find your account")
                            : SizedBox(
                                height: 15,
                                child: OthersHelper().spinner(Colors.white))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
