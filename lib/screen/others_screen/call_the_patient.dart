// import 'package:design/helper/others_helper.dart';
// import 'package:design/screen/get_started.dart';
// import 'package:design/screen/others_screen/order_lab/order_labs.dart';
// import 'package:design/services/patient_details_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';

import '../../helper/others_helper.dart';
import '../../services/patient_details_service.dart';
import '../get_started.dart';
import '../patient/patient_helper.dart';
import 'order_lab/order_labs.dart';
//import 'package:url_launcher/url_launcher.dart';

class CallThePatient extends StatefulWidget {
  const CallThePatient({Key? key}) : super(key: key);

  @override
  _CallThePatientState createState() => _CallThePatientState();
}

String number = '000';

class _CallThePatientState extends State<CallThePatient> {
  // Future<void> _makePhoneCall(String phoneNumber) async {
  //   // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
  //   // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
  //   // such as spaces in the input, which would cause `launch` to fail on some
  //   // platforms.
  //   final Uri launchUri = Uri(
  //     scheme: 'tel',
  //     path: phoneNumber,
  //   );
  //   await launch(launchUri.toString());
  // }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Consumer<PatientDetailsService>(
        builder: (BuildContext context, provider, Widget? child) =>
            provider.patientDetails != null
                ? provider.patientDetails != "error"
                    ? Padding(
                        padding: EdgeInsets.all(screenWidth * 0.05),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: screenHeight * 0.02,
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: allColor.backGroundColor),
                                      onPressed: () {},
                                      child: const Text("Call the Patient")),
                                  const Spacer(),
                                  SizedBox(
                                      height: screenHeight * 0.07,
                                      child:
                                          Image.asset("assets/images/k.jpeg")),
                                ],
                              ),
                              SizedBox(
                                height: screenWidth * 0.05,
                              ),
                              //User name and profile image
                              PatientHelper().nameAndImage(),
                              // Row(children: [
                              //   Text("Javed Ahmad M/46",
                              //       style: TextStyle(
                              //           fontSize: screenWidth * 0.06,
                              //           fontWeight: FontWeight.bold)),
                              //   const Spacer(),
                              //   SizedBox(
                              //     height: screenHeight * 0.08,
                              //     child: const Image(
                              //         image: AssetImage("assets/images/men.png")),
                              //   )
                              // ]),
                              SizedBox(height: screenHeight * 0.35),
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.02),
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            primary: allColor.backGroundColor),
                                        onPressed: () {
                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>()));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: screenWidth * 0.01,
                                              top: screenWidth * 0.02,
                                              bottom: screenWidth * 0.02,
                                              right: screenWidth * 0.01),
                                          child: Text('Call the Patient',
                                              style: TextStyle(
                                                fontSize: screenWidth * 0.04,
                                              )),
                                        )),
                                    Spacer(),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            primary: const Color(0xffb3d9ef)),
                                        onPressed: () {
                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>()));
                                          if (provider.patientDetails.data.uinfo
                                                      .mobile ==
                                                  null ||
                                              provider.patientDetails.data.uinfo
                                                      .mobile ==
                                                  "") {
                                            OthersHelper().showToast(
                                                "This patient don't have any phone number",
                                                allColor.backGroundColor);
                                          } else {
                                            number = provider.patientDetails
                                                .data.uinfo.mobile
                                                .toString();
                                            print(number);

                                            // launch('tel:$number');
                                            FlutterPhoneDirectCaller.callNumber(
                                                number);
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: screenWidth * 0.02,
                                              top: screenWidth * 0.02,
                                              bottom: screenWidth * 0.02,
                                              right: screenWidth * 0.02),
                                          child: const Icon(Icons.call,
                                              color: Colors.black),
                                        )),
                                    Spacer(),
                                    // ElevatedButton(
                                    //     style: ElevatedButton.styleFrom(
                                    //         shape: RoundedRectangleBorder(
                                    //             borderRadius: BorderRadius.circular(30)),
                                    //         primary: Color(0xfffae5dd)),
                                    //     onPressed: () {
                                    //       // Navigator.push(context, MaterialPageRoute(builder: (context)=>()));
                                    //     },
                                    //     child: Padding(
                                    //       padding: EdgeInsets.only(
                                    //           left: screenWidth * 0.02,
                                    //           top: screenWidth * 0.02,
                                    //           bottom: screenWidth * 0.02,
                                    //           right: screenWidth * 0.02),
                                    //       child: Icon(
                                    //         Icons.video_call,
                                    //         color: Colors.black,
                                    //       ),
                                    //     )
                                    //     ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const Text("Something went wrong")
                : OthersHelper().spinner(allColor.backGroundColor),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.10,
          right: screenWidth * 0.10,
        ),
        child: Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  primary: Colors.blue),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    top: screenWidth * 0.02,
                    bottom: screenWidth * 0.02,
                    right: screenWidth * 0.05),
                child: Text('Back',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                    )),
              ),
            ),
            Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    primary: allColor.elevatedBtnColor),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderLabs()));
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05,
                      top: screenWidth * 0.02,
                      bottom: screenWidth * 0.02,
                      right: screenWidth * 0.05),
                  child: Text('Next',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                      )),
                )),
          ],
        ),
      ),
    ));
  }
}
