import 'package:design/services/auto_log_in_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/color.dart';
import 'auth/log_sin_page.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

AllColor allColor = AllColor();

class _GetStartedState extends State<GetStarted> {
  // var _isinIt = true;
  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //   if (_isinIt) {
  //     Provider.of<AutoLogInService>(context, listen: false).autoLogIn(context);
  //   }
  //   _isinIt = false;
  // }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: allColor.backGroundColor,
        body: SingleChildScrollView(
          child: Column(
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
              Padding(
                padding: EdgeInsets.only(
                    top: screenWidth * 0.12,
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05),
                child: Text(
                    "Kambaii Health's 90-Days Long Lifestyle Changing Wellness Program is a transformational program "
                    "that is designed to empower you to live happy, healthy, proactive and productive life with full of "
                    "confidence. Kambaii Health's primary objective is to provide a better health care through integrated "
                    "medical managment, medicine managment, real time alert monitoring and target oriented wellness program",
                    style: TextStyle(
                        fontSize: screenHeight * 0.02,
                        color: allColor.simpleTextColor)),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogSignPage()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.06,
                        right: screenWidth * 0.06,
                        top: screenWidth * 0.03,
                        bottom: screenWidth * 0.03),
                    child: Text(
                      "Get Started",
                      style: TextStyle(fontSize: screenWidth * 0.05),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
