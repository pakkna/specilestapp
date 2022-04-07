import 'package:design/screen/auth/sign_up.dart';
import 'package:design/screen/get_started.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class LogSignPage extends StatefulWidget {
  const LogSignPage({Key? key}) : super(key: key);

  @override
  _LogSignPageState createState() => _LogSignPageState();
}

class _LogSignPageState extends State<LogSignPage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: allColor.backGroundColor,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: screenHeight * 0.29,
            width: screenWidth,
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.06),
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.12,
                  child: Image.asset("assets/images/k.jpeg"),
                ),
                SizedBox(height: screenHeight * 0.05),
                Text("Kambaii Health",
                    style: TextStyle(
                        fontSize: screenWidth * 0.07,
                        color: allColor.blackTextColor)),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.27,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: allColor.elevatedBtnColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.10,
                    right: screenWidth * 0.10,
                    top: screenWidth * 0.03,
                    bottom: screenWidth * 0.03),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: screenWidth * 0.05),
                ),
              )),
          SizedBox(
            height: screenHeight * 0.10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.08,
                    right: screenWidth * 0.08,
                    top: screenWidth * 0.03,
                    bottom: screenWidth * 0.03),
                child: Text(
                  "Signup",
                  style: TextStyle(fontSize: screenWidth * 0.05),
                ),
              )),
        ],
      ),
    ));
  }
}
