import 'dart:io';

import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/lab_report/lab_report.dart';
import 'package:design/screen/patient_datas/review_vitals.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PatientPrescriptionRecords extends StatefulWidget {
  const PatientPrescriptionRecords({Key? key}) : super(key: key);
  static const routeName = 'patient prescription';

  @override
  _PatientPrescriptionRecordsState createState() =>
      _PatientPrescriptionRecordsState();
}

class _PatientPrescriptionRecordsState
    extends State<PatientPrescriptionRecords> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.

    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final pId = ModalRoute.of(context)!.settings.arguments;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          if (await controller.canGoBack()) {
            controller.goBack();
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: allColor.backGroundColor,
              title: Text("Patient prescription"),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: IconButton(
                      onPressed: () async {
                        controller.reload();
                      },
                      icon: const Icon(Icons.refresh)),
                )
              ]),
          body: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl:
                "https://dev.kambaiihealth.com/prescription-view-for-app/$pId",
            onWebViewCreated: (controller) {
              this.controller = controller;
            },
          ),
          // bottomNavigationBar: Padding(
          //   padding: EdgeInsets.only(
          //     left: screenWidth * 0.10,
          //     right: screenWidth * 0.10,
          //   ),
          //   child: Row(
          //     children: [
          //       ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(30)),
          //             primary: Colors.blue),
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //         child: Padding(
          //           padding: EdgeInsets.only(
          //               left: screenWidth * 0.05,
          //               top: screenWidth * 0.02,
          //               bottom: screenWidth * 0.02,
          //               right: screenWidth * 0.05),
          //           child: Text('Back',
          //               style: TextStyle(
          //                 fontSize: screenWidth * 0.04,
          //               )),
          //         ),
          //       ),
          //       Spacer(),
          //       ElevatedButton(
          //           style: ElevatedButton.styleFrom(
          //               shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(30)),
          //               primary: allColor.elevatedBtnColor),
          //           onPressed: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => ReviewVitals()));
          //           },
          //           child: Padding(
          //             padding: EdgeInsets.only(
          //                 left: screenWidth * 0.05,
          //                 top: screenWidth * 0.02,
          //                 bottom: screenWidth * 0.02,
          //                 right: screenWidth * 0.05),
          //             child: Text('Next',
          //                 style: TextStyle(
          //                   fontSize: screenWidth * 0.04,
          //                 )),
          //           )),
          //     ],
          //   ),
          // ),
          //
        ),
      ),
    );
  }
}
