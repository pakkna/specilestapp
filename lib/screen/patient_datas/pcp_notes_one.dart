import '/screen/get_started.dart';
import '/screen/others_screen/doctor_note_for_pcp/doctor_note_for_pcp.dart';
import '/screen/others_screen/medical_history.dart';
import '/screen/patient/patient_prescription.dart';
import '/screen/patient_datas/pcp_next_page.dart';
import '/services/pcp_notes_list_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/common_helper.dart';
import '../../helper/others_helper.dart';
import '../../services/common_service.dart';
import '../../services/patient_details_service.dart';
import '../patient/patient_helper.dart';

class PcpNotesOne extends StatefulWidget {
  const PcpNotesOne({Key? key}) : super(key: key);

  @override
  _PcpNotesOneState createState() => _PcpNotesOneState();
}

class _PcpNotesOneState extends State<PcpNotesOne> {
  @override
  void initState() {
    super.initState();
    Provider.of<PcpNotestListService>(context, listen: false)
        .fetchPcpList('201');
    //201 is the patient id
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: CommonHelper().appbarSimple('PCP visit summary'),
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: SingleChildScrollView(
            child: Consumer<PatientDetailsService>(
              builder: (context, provider, child) => Column(
                children: [
                  //User name and profile image ==============>
                  PatientHelper().nameAndImage(),

                  SizedBox(height: screenWidth * 0.05),
                  //Pcp notes list ===============>
                  // Consumer<PcpNotestListService>(
                  //   builder: (context, notesProvider, child) => notesProvider
                  //               .pcpNotes !=
                  //           null
                  //       ? notesProvider.pcpNotes != "error"
                  //           ? Container(
                  //               color: const Color(0xffe2eaf5),
                  //               width: screenWidth,
                  //               child: Padding(
                  //                 padding: const EdgeInsets.symmetric(
                  //                     horizontal: 15, vertical: 15),
                  //                 child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     Text("PCP Notes",
                  //                         style: TextStyle(
                  //                           fontSize: screenWidth * 0.05,
                  //                         )),
                  //                     const Divider(),
                  //                     const SizedBox(
                  //                       height: 2,
                  //                     ),
                  //                     for (int i = 0;
                  //                         i < notesProvider.pcpNotes.data.length;
                  //                         i++)
                  //                       Column(
                  //                         crossAxisAlignment:
                  //                             CrossAxisAlignment.start,
                  //                         children: [
                  //                           Text(
                  //                               "${CommonService().getDate(notesProvider.pcpNotes.data[i].createdAt)}",
                  //                               style: const TextStyle(
                  //                                   fontSize: 14, height: 1.4)),
                  //                           const SizedBox(
                  //                             height: 3,
                  //                           ),
                  //                           Text(
                  //                               notesProvider
                  //                                   .pcpNotes.data[i].note,
                  //                               style: const TextStyle(
                  //                                   fontSize: 17, height: 1.4)),
                  //                           const Divider(),
                  //                         ],
                  //                       ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             )
                  //           : Container(
                  //               height: screenHeight - 180,
                  //               alignment: Alignment.center,
                  //               child: const Text("Something went wrong"))
                  //       : Container(
                  //           height: screenHeight - 180,
                  //           alignment: Alignment.center,
                  //           child:
                  //               OthersHelper().spinner(allColor.backGroundColor),
                  //         ),
                  // ),

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
                        PatientHelper().topgreyBar("Doctor list"),

                        //informations row
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
                          child: Column(
                            children: [
                              for (int i = 0;
                                  i <
                                      provider.patientDetails.data.prescription
                                          .data.length;
                                  i++)
                                InkWell(
                                  onTap: () {
                                    print(provider.patientDetails.data
                                        .prescription.data[i].id);
                                    print('id');

                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             PatientPrescription()));

                                    Navigator.of(context).pushNamed(
                                        PatientPrescription.routeName,
                                        arguments: provider.patientDetails.data
                                            .prescription.data[i].id);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 17),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            width: .5,
                                            color: Colors.grey.withOpacity(.5)),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          provider.patientDetails.data
                                              .prescription.data[i].dname,
                                          style: TextStyle(
                                            color: allColor.blackTextColor,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios_outlined,
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
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const PcpNextPage()));
                  //   },
                  //   child: Container(
                  //       color: const Color(0xfff5f3c6),
                  //       height: screenHeight * 0.06,
                  //       width: screenWidth,
                  //       child: Padding(
                  //           padding: EdgeInsets.all(screenWidth * 0.03),
                  //           child: Text("Write Notes to PCP",
                  //               style: TextStyle(fontSize: screenWidth * 0.05)))),
                  // ),
                ],
              ),
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
                            builder: (context) => const DoctorNoteForPcp()));
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
    );
  }
}
