import 'package:design/helper/others_helper.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/screen/patient/patient_prescription.dart';
import 'package:design/services/pcp_notes_list_service.dart';
import 'package:design/services/visit_records_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helper/common_helper.dart';
import '../../services/patient_details_service.dart';
import '../patient/patient_helper.dart';

class HomeVisitRecords extends StatefulWidget {
  const HomeVisitRecords({Key? key}) : super(key: key);

  @override
  _HomeVisitRecordsState createState() => _HomeVisitRecordsState();
}

class _HomeVisitRecordsState extends State<HomeVisitRecords> {
  @override
  void initState() {
    super.initState();
    // Provider.of<PcpNotestListService>(context, listen: false)
    //     .fetchPcpList('201');
    //201 is the patient id
    Provider.of<VisitRecordsService>(context, listen: false).visitRecords();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: CommonHelper().appbarSimple('Visit Records'),
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: SingleChildScrollView(
            child: Consumer<VisitRecordsService>(
              builder: (context, provider, child) => provider.visitrecords !=
                      null
                  ? provider.visitrecords != "error"
                      ? Column(
                          children: [
                            //User name and profile image ==============>
                            //   PatientHelper().nameAndImage(),

                            //   SizedBox(height: screenWidth * 0.05),

                            SizedBox(height: screenWidth * 0.05),
                            //Doctor list ================>
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.02),
                                      spreadRadius: -2,
                                      blurRadius: 13,
                                      offset: const Offset(0, 9)),
                                ],
                              ),
                              child: Column(
                                children: [
                                  //top grey bar
                                  PatientHelper().topgreyBar("Patient list"),

                                  //informations row
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 20, 25),
                                    child: Column(
                                      children: [
                                        for (int i = 0;
                                            i <
                                                provider
                                                    .visitrecords.data.length;
                                            i++)
                                          InkWell(
                                            onTap: () {
                                              print(provider.visitrecords
                                                  .data[i].prescriptionId);
                                              // print('id');

                                              // // Navigator.push(
                                              // //     context,
                                              // //     MaterialPageRoute(
                                              // //         builder: (context) =>
                                              // //             PatientPrescription()));

                                              Navigator.of(context).pushNamed(
                                                  PatientPrescription.routeName,
                                                  arguments: provider
                                                      .visitrecords
                                                      .data[i]
                                                      .prescriptionId);
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 17),
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      width: .5,
                                                      color: Colors.grey
                                                          .withOpacity(.5)),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    provider.visitrecords
                                                        .data[i].patientName,
                                                    style: TextStyle(
                                                      color: allColor
                                                          .blackTextColor,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons
                                                        .arrow_forward_ios_outlined,
                                                    size: 13,
                                                    color: Colors.grey,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: screenWidth * 0.05),
                          ],
                        )
                      : const Text("Something went wrong")
                  : OthersHelper().spinner(allColor.backGroundColor),
            ),
          ),
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
              // Spacer(),
              // ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(30)),
              //         primary: allColor.elevatedBtnColor),
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => DoctorNoteForPcp()));
              //     },
              //     child: Padding(
              //       padding: EdgeInsets.only(
              //           left: screenWidth * 0.05,
              //           top: screenWidth * 0.02,
              //           bottom: screenWidth * 0.02,
              //           right: screenWidth * 0.05),
              //       child: Text('Next',
              //           style: TextStyle(
              //             fontSize: screenWidth * 0.04,
              //           )),
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
