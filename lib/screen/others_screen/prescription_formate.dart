// import 'package:design/helper/others_helper.dart';
// import 'package:design/screen/get_started.dart';
// import 'package:design/services/get_full_prescription_data_service.dart';
// import 'package:design/services/login_service.dart';
// import 'package:design/services/patient_details_service.dart';
// import 'package:design/services/prescription_submit_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import '../../helper/others_helper.dart';
import '../../services/get_full_prescription_data_service.dart';
import '../../services/login_service.dart';
import '../../services/patient_details_service.dart';
import '../../services/prescription_submit_service.dart';
import '../get_started.dart';

class Prescription extends StatefulWidget {
  const Prescription({Key? key}) : super(key: key);

  @override
  _PrescriptionState createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  TextEditingController? _adviceController = TextEditingController();
  TextEditingController? _patientComplaintController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<GetFullPrescriptionDataService>(context, listen: false)
        .getFullPrescriptionData(context);
  }

  String? mfn;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Consumer<GetFullPrescriptionDataService>(
        builder: (BuildContext context, provider, Widget? child) => provider
                    .getfullprescriptiondata !=
                null
            ? provider.getfullprescriptiondata != "error"
                ? Padding(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Row(
                            children: [
                              Text("KAMBAII",
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.07,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey)),
                              Spacer(),
                              Container(
                                  height: screenHeight * 0.07,
                                  child: Image.asset("assets/images/k.jpeg")),
                            ],
                          ),
                          SizedBox(
                            height: screenWidth * 0.05,
                          ),
                          Consumer<LoginService>(
                            builder: (BuildContext context, providerL,
                                    Widget? child) =>
                                Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Dr. ' + providerL.loginDetails.data.name,
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.06,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    'from ' +
                                        providerL
                                            .loginDetails.data.hospitalName,
                                    //  Ahsania Mission Cancer Hospital!",
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.04)),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: screenWidth * 0.05,
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 2,
                          ),
                          SizedBox(height: screenWidth * 0.05),
                          /////////////////////////
                          Consumer<PatientDetailsService>(
                            builder: (BuildContext context, providerP,
                                    Widget? child) =>
                                providerP.patientDetails != null
                                    ? providerP.patientDetails != "error"
                                        ? Column(
                                            children: [
                                              Container(
                                                height: screenHeight * 0.05,
                                                color: Color(0xffdcebf1),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Row(children: [
                                                    Text("Patient Name : ",
                                                        style: TextStyle(
                                                            fontSize:
                                                                screenWidth *
                                                                    0.04,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    Text(
                                                        providerP
                                                                .patientDetails
                                                                .data
                                                                .uinfo
                                                                .name ??
                                                            "",
                                                        style: TextStyle(
                                                            fontSize:
                                                                screenWidth *
                                                                    0.04,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                                  ]),
                                                ),
                                              ),
                                              Container(
                                                  height: screenHeight * 0.05,
                                                  color: allColor.homebgColor,
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Row(children: [
                                                        Text("Reason : ",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    screenWidth *
                                                                        0.04)),
                                                        Text(
                                                            providerP
                                                                    .patientDetails
                                                                    .data
                                                                    .uinfo
                                                                    .remarks ??
                                                                "",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    screenWidth *
                                                                        0.04))
                                                      ]))),
                                              Container(
                                                  height: screenHeight * 0.05,
                                                  color: Color(0xffdcebf1),
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Row(children: [
                                                        Text("Gender : ",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    screenWidth *
                                                                        0.04)),
                                                        Text(
                                                            providerP
                                                                    .patientDetails
                                                                    .data
                                                                    .uinfo
                                                                    .gender ??
                                                                "",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    screenWidth *
                                                                        0.04))
                                                      ]))),
                                              Container(
                                                height: screenHeight * 0.05,
                                                color: allColor.homebgColor,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Age : ",
                                                        style: TextStyle(
                                                            fontSize:
                                                                screenWidth *
                                                                    0.04),
                                                      ),
                                                      Text(
                                                        providerP.patientDetails
                                                            .data.uinfo.age
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize:
                                                                screenWidth *
                                                                    0.04),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(
                                            height: screenHeight - 180,
                                            alignment: Alignment.center,
                                            child: const Text(
                                                "Something went wrong"))
                                    : Container(
                                        height: screenHeight - 180,
                                        alignment: Alignment.center,
                                        child: OthersHelper()
                                            .spinner(allColor.backGroundColor),
                                      ),
                          ),
                          ////////////////////
                          // SizedBox(height: screenWidth * 0.10),
                          // Container(
                          //   height: screenHeight * 0.15,
                          //   width: screenWidth,
                          //   color: allColor.homebgColor,
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(10),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(" Patient Complaint",
                          //             style: TextStyle(
                          //                 fontSize: screenWidth * 0.04)),
                          //       ],
                          //     ),
                          //   ),
                          // ),

                          SizedBox(height: screenWidth * 0.05),
                          Container(
                            height: screenHeight * 0.15,
                            width: screenWidth,
                            color: Color(0xffdcebf1),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("PCP Note Summery",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.04)),
                                  Flexible(
                                    child: ListView.builder(
                                      itemCount: provider
                                          .getfullprescriptiondata
                                          .data
                                          .pcpNoteSummery
                                          .length,
                                      itemBuilder: (_, i) => ListTile(
                                        title: Text(provider
                                            .getfullprescriptiondata
                                            .data
                                            .pcpNoteSummery[i]
                                            .note),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: screenWidth * 0.05),
                          Container(
                            height: screenHeight * 0.15,
                            width: screenWidth,
                            color: allColor.homebgColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Provisional Diagnosis",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.04)),
                                  Flexible(
                                    child: ListView.builder(
                                      itemCount: provider
                                          .getfullprescriptiondata
                                          .data
                                          .provisinalDiagnosis
                                          .length,
                                      itemBuilder: (_, i) => ListTile(
                                        title: Text(provider
                                            .getfullprescriptiondata
                                            .data
                                            .provisinalDiagnosis[i]
                                            .provisinalDiagnosis),
                                        subtitle: Text(provider
                                            .getfullprescriptiondata
                                            .data
                                            .provisinalDiagnosis[i]
                                            .provisinalNote),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: screenWidth * 0.05),
                          Container(
                            height: screenHeight * 0.15,
                            // height: min(
                            //     double.parse(provider.getfullprescriptiondata.data
                            //                 .specialistAssessment.length) *
                            //             20 +
                            //         110,
                            //     200),
                            // : 95,
                            width: screenWidth,
                            color: Color(0xffdcebf1),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Specialist Assessment ",
                                    style:
                                        TextStyle(fontSize: screenWidth * 0.04),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      // physics:
                                      //     const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: provider
                                          .getfullprescriptiondata
                                          .data
                                          .specialistAssessment
                                          .length,
                                      itemBuilder: (_, i) => ListTile(
                                        title: Text(provider
                                            .getfullprescriptiondata
                                            .data
                                            .specialistAssessment[i]
                                            .note),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: screenWidth * 0.05),
                          Container(
                            height: screenHeight * 0.15,
                            width: screenWidth,
                            color: Color(0xffdcebf1),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Order Lab",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.04)),
                                  Flexible(
                                    child: ListView.builder(
                                      itemCount: provider
                                          .getfullprescriptiondata
                                          .data
                                          .orderLabTest
                                          .length,
                                      itemBuilder: (_, i) => ListTile(
                                        title: Text(provider
                                            .getfullprescriptiondata
                                            .data
                                            .orderLabTest[i]
                                            .testName),
                                        subtitle: Text(provider
                                            .getfullprescriptiondata
                                            .data
                                            .orderLabTest[i]
                                            .reason),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: screenWidth * 0.10),
                          Container(
                            //  height: screenHeight * 0.15,
                            width: screenWidth,
                            color: allColor.homebgColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(" Old Continued Medicine",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.042,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: screenWidth * 0.03),
                                  /////////////////
                                  Table(
                                    columnWidths: const {
                                      0: FlexColumnWidth(2),
                                      1: FlexColumnWidth(1),
                                      2: FlexColumnWidth(1),
                                      3: FlexColumnWidth(1),
                                    },
                                    border: TableBorder.all(color: Colors.grey),
                                    children: [
                                      TableRow(
                                        children: [
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  screenWidth * 0.02),
                                              child: Text(
                                                'Name',
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.04,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  screenWidth * 0.02),
                                              child: Text(
                                                'Dose',
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.04,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  screenWidth * 0.02),
                                              child: Text(
                                                'Days',
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.04,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  screenWidth * 0.02),
                                              child: Text(
                                                'Before/After Meal',
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.04,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      for (int i = 0;
                                          i <
                                              provider.getfullprescriptiondata
                                                  .data.oldMedicine.length;
                                          i++)
                                        TableRow(children: [
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  screenWidth * 0.02),
                                              child: Center(
                                                child: Text(
                                                  //medicine type
                                                  provider
                                                          .getfullprescriptiondata
                                                          .data
                                                          .oldMedicine[i]
                                                          .type
                                                          .toString() + ////medicine name
                                                      ' ' +
                                                      provider
                                                          .getfullprescriptiondata
                                                          .data
                                                          .oldMedicine[i]
                                                          .medicineName
                                                          .toString() + //medicine measurement
                                                      ' ' +
                                                      provider
                                                          .getfullprescriptiondata
                                                          .data
                                                          .oldMedicine[i]
                                                          .measurement
                                                          .toString() + //medicine measurement unit
                                                      ' ' +
                                                      provider
                                                          .getfullprescriptiondata
                                                          .data
                                                          .oldMedicine[i]
                                                          .measurementUnit
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.04),
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  screenWidth * 0.02),
                                              child: Center(
                                                child: Text(
                                                  //"${i + 1}",

                                                  (provider
                                                                  .getfullprescriptiondata
                                                                  .data
                                                                  .oldMedicine[
                                                                      i]
                                                                  .morning
                                                                  .toString() ==
                                                              'yes'
                                                          ? '1'
                                                          : '0') +
                                                      '+' +
                                                      (provider
                                                                  .getfullprescriptiondata
                                                                  .data
                                                                  .oldMedicine[
                                                                      i]
                                                                  .afternoon
                                                                  .toString() ==
                                                              'yes'
                                                          ? '1'
                                                          : '0') +
                                                      '+' +
                                                      (provider
                                                                  .getfullprescriptiondata
                                                                  .data
                                                                  .oldMedicine[
                                                                      i]
                                                                  .night
                                                                  .toString() ==
                                                              'yes'
                                                          ? '1'
                                                          : '0'),
                                                  style: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.04),
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  screenWidth * 0.02),
                                              child: Center(
                                                child: Text(
                                                  //"${i + 1}",
                                                  provider
                                                      .getfullprescriptiondata
                                                      .data
                                                      .oldMedicine[i]
                                                      .howManyDays
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.04),
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  screenWidth * 0.02),
                                              child: Center(
                                                child: Text(
                                                  //"${i + 1}",
                                                  provider
                                                      .getfullprescriptiondata
                                                      .data
                                                      .oldMedicine[i]
                                                      .borameal
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.04),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ])
                                    ],
                                  )
                                  ///////////////////////
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: screenWidth * 0.05),
                          Container(
                            //  height: screenHeight * 0.15,
                            width: screenWidth,
                            color: Color(0xffdcebf1),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("New Medicine",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.042,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: screenWidth * 0.03),
                                  ////////////////////////////
                                  Table(
                                    columnWidths: const {
                                      0: FlexColumnWidth(2),
                                      1: FlexColumnWidth(1),
                                      2: FlexColumnWidth(1),
                                      3: FlexColumnWidth(1),
                                    },
                                    border: TableBorder.all(color: Colors.grey),
                                    children: [
                                      TableRow(
                                        children: [
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  screenWidth * 0.02),
                                              child: Text(
                                                'Name',
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.04,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  screenWidth * 0.02),
                                              child: Text(
                                                'Dose',
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.04,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  screenWidth * 0.02),
                                              child: Text(
                                                'days',
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.04,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  screenWidth * 0.02),
                                              child: Text(
                                                'Before/After Meal',
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.04,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      for (int i = 0;
                                          i <
                                              provider.getfullprescriptiondata
                                                  .data.newMedicine.length;
                                          i++)
                                        TableRow(children: [
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  screenWidth * 0.02),
                                              child: Center(
                                                child: Text(
                                                  //medicine type
                                                  provider
                                                          .getfullprescriptiondata
                                                          .data
                                                          .newMedicine[i]
                                                          .type
                                                          .toString() + ////medicine name
                                                      ' ' +
                                                      provider
                                                          .getfullprescriptiondata
                                                          .data
                                                          .newMedicine[i]
                                                          .medicineName
                                                          .toString() + //medicine measurement
                                                      ' ' +
                                                      provider
                                                          .getfullprescriptiondata
                                                          .data
                                                          .newMedicine[i]
                                                          .measurement
                                                          .toString() + //medicine measurement unit
                                                      ' ' +
                                                      provider
                                                          .getfullprescriptiondata
                                                          .data
                                                          .newMedicine[i]
                                                          .measurementUnit
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.04),
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  screenWidth * 0.02),
                                              child: Center(
                                                child: Text(
                                                  //"${i + 1}",

                                                  (provider
                                                                  .getfullprescriptiondata
                                                                  .data
                                                                  .newMedicine[
                                                                      i]
                                                                  .morning
                                                                  .toString() ==
                                                              'yes'
                                                          ? '1'
                                                          : '0') +
                                                      '+' +
                                                      (provider
                                                                  .getfullprescriptiondata
                                                                  .data
                                                                  .newMedicine[
                                                                      i]
                                                                  .afternoon
                                                                  .toString() ==
                                                              'yes'
                                                          ? '1'
                                                          : '0') +
                                                      '+' +
                                                      (provider
                                                                  .getfullprescriptiondata
                                                                  .data
                                                                  .newMedicine[
                                                                      i]
                                                                  .night
                                                                  .toString() ==
                                                              'yes'
                                                          ? '1'
                                                          : '0'),
                                                  style: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.04),
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  screenWidth * 0.02),
                                              child: Center(
                                                child: Text(
                                                  //"${i + 1}",
                                                  provider
                                                      .getfullprescriptiondata
                                                      .data
                                                      .newMedicine[i]
                                                      .howManyDays
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.04),
                                                ),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  screenWidth * 0.02),
                                              child: Center(
                                                child: Text(
                                                  //"${i + 1}",
                                                  provider
                                                      .getfullprescriptiondata
                                                      .data
                                                      .newMedicine[i]
                                                      .borameal
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.04),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ])
                                    ],
                                  )
                                  //////////////////////////////
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: screenWidth * 0.10),
                          // Container(
                          //     height: screenHeight * 0.05,
                          //     color: Color(0xfffae5dd),
                          //     child: Padding(
                          //         padding: const EdgeInsets.all(10),
                          //         child: Row(children: [
                          //           Text("Medicine Name",
                          //               style: TextStyle(
                          //                   fontSize: screenWidth * 0.04)),
                          //           Spacer(),
                          //           Text("Strength",
                          //               style: TextStyle(
                          //                   fontSize: screenWidth * 0.04)),
                          //           Spacer(),
                          //           Text("Time",
                          //               style: TextStyle(
                          //                   fontSize: screenWidth * 0.04)),
                          //           Spacer(),
                          //           Text("Meal",
                          //               style: TextStyle(
                          //                   fontSize: screenWidth * 0.04)),
                          //           Spacer(),
                          //           Text("Days",
                          //               style: TextStyle(
                          //                   fontSize: screenWidth * 0.04))
                          //         ]))),
                          // SizedBox(height: screenWidth * 0.05),
                          Container(
                            width: screenWidth,
                            color: allColor.homebgColor,
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: TextFormField(
                                  controller: _patientComplaintController,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                      hintText: "Patient Complaint"),
                                )),
                          ),
                          SizedBox(height: screenWidth * 0.10),
                          Container(
                            width: screenWidth,
                            color: Color(0xffdcebf1),
                            // allColor.homebgColor,
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: TextFormField(
                                  controller: _adviceController,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  decoration:
                                      InputDecoration(hintText: "Advice"),
                                )),
                          ),
                          SizedBox(height: screenWidth * 0.15),
                        ],
                      ),
                    ),
                  )
                : Container(
                    height: screenHeight - 180,
                    alignment: Alignment.center,
                    child: const Text("Something went wrong"))
            : Container(
                height: screenHeight - 180,
                alignment: Alignment.center,
                child: OthersHelper().spinner(allColor.backGroundColor),
              ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.10,
            right: screenWidth * 0.10,
            top: screenWidth * 0.02,
            bottom: screenWidth * 0.05),
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
                    bottom: screenWidth * 0.02,
                    right: screenWidth * 0.05),
                child: Text(
                  'Back',
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    primary: allColor.elevatedBtnColor),
                onPressed: () async {
                  await Provider.of<PrescriptionSubmitService>(context,
                          listen: false)
                      .prescriptionSubmit(_patientComplaintController!.text,
                          _adviceController!.text, context);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05,
                      top: screenWidth * 0.02,
                      bottom: screenWidth * 0.02,
                      right: screenWidth * 0.05),
                  child: Text('Submit',
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
