import 'package:design/helper/custom_text_field.dart';
import 'package:design/screen/home/home_page.dart';
import 'package:flutter/material.dart';

class PhoneNumberVerify extends StatefulWidget {
  const PhoneNumberVerify({Key? key}) : super(key: key);

  @override
  _PhoneNumberVerifyState createState() => _PhoneNumberVerifyState();
}

TextEditingController _codeNumberController = TextEditingController();

class _PhoneNumberVerifyState extends State<PhoneNumberVerify> {
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
            child: Column(
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
                  Spacer(),
                  Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.02),
                      child: Container(
                          height: screenHeight * 0.07,
                          child: Image.asset("assets/images/k.jpeg")))
                ]),
                SizedBox(height: screenHeight * 0.05),
                CustomTextField(
                  controller: _codeNumberController,
                  hintText: "Enter code number",
                  suffixIcon: Icon(Icons.drive_file_rename_outline),
                  obsecureValue: false,
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Container(
                  width: screenWidth,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Text("Phone number verify")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
