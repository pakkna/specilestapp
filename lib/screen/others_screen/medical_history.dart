import 'dart:io';

import '/screen/get_started.dart';
import '/screen/others_screen/lab_report/lab_report.dart';
import '/screen/patient_datas/review_vitals.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '/services/patient_details_service.dart';
import 'package:provider/provider.dart';

class Medical extends StatefulWidget {
  const Medical({Key? key}) : super(key: key);

  @override
  _MedicalState createState() => _MedicalState();
}

var patientId;

class _MedicalState extends State<Medical> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    final patientDetailsProvider =
        Provider.of<PatientDetailsService>(context, listen: false)
            .patientDetails;
    patientId = patientDetailsProvider.data.pid;
  }

  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
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
              title: Text("Medical history"),
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
                //"https://dev.kambaiihealth.com/MedicalHistory_view_for_app/718/739",
                "https://dev.kambaiihealth.com/MedicalHistory_view_for_app/$patientId",
            onWebViewCreated: (controller) {
              this.controller = controller;
            },
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
                              builder: (context) => const ReviewVitals()));
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
        ),
      ),
    );
  }
}
