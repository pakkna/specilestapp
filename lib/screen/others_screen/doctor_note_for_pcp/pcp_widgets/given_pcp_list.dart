import 'package:design/helper/others_helper.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/doctor_note_for_pcp/create_a_pcp_note.dart';
import 'package:design/screen/others_screen/specialist_assessment/create_a_assessment.dart';
import 'package:design/services/doctor_note_for_pcp_service.dart/delete_pcp_note_service.dart';
import 'package:design/services/doctor_note_for_pcp_service.dart/given_pcp_note_list_serice.dart';
import 'package:design/services/order_lab_service/given_test_list_service.dart';
import 'package:design/services/order_lab_service/delete_order_lab_service.dart';
import 'package:design/services/specialist_assessment_service/assessment_delete_service.dart';
import 'package:design/services/specialist_assessment_service/given_assessment_list_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GivenPcpList extends StatefulWidget {
  const GivenPcpList({Key? key}) : super(key: key);

  @override
  State<GivenPcpList> createState() => _GivenPcpListState();
}

class _GivenPcpListState extends State<GivenPcpList> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Consumer<GivenPcpNoteListService>(
      builder: (BuildContext context, value, Widget? child) => value
                  .givenpcpnotelist !=
              null
          ? value.givenpcpnotelist != "error"
              ? ListView.builder(
                  itemCount: value.givenpcpnotelist.data.length,
                  itemBuilder: (_, i) => Card(
                    elevation: 2,
                    // margin: EdgeInsets.symmetric(vertical: ,horizontal: ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.02,
                          top: screenWidth * 0.02,
                          bottom: screenWidth * 0.02,
                          right: screenWidth * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //
                          if (value.givenpcpnotelist.data[i].note == null)
                            SizedBox(
                              width: screenWidth * 0.28,
                              child: Text(""),
                            )
                          else
                            SizedBox(
                              width: screenWidth * 0.28,
                              child: Text(value.givenpcpnotelist.data[i].note),
                            ),
                          SizedBox(width: screenWidth * 0.02),
                          //
                          // if (value.givenassessmentlist.data[i].reason == null)
                          //   SizedBox(
                          //     width: screenWidth * 0.27,
                          //     child: Text(""),
                          //   )
                          // else
                          //   SizedBox(
                          //     width: screenWidth * 0.27,
                          //     child: Text(value.givenassessmentlist.data[i].reason),
                          //   ),
                          Row(
                            //  mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                color: Theme.of(context).primaryColor,
                                onPressed: () {
                                  //   EditAssessment
                                  Navigator.of(context).pushNamed(
                                      CreateAPcpNote.routeName,
                                      arguments: i);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                color: Theme.of(context).errorColor,
                                onPressed: () async {
                                  final givenpcpnotelist =
                                      Provider.of<GivenPcpNoteListService>(
                                              context,
                                              listen: false)
                                          .givenpcpnotelist;
                                  String deleteId =
                                      givenpcpnotelist.data[i].id.toString();
                                  // print(deleteId);

                                  // DeleteOrderLabTest API
                                  try {
                                    await Provider.of<DeletePcpNoteService>(
                                            context,
                                            listen: false)
                                        .deletePcpNote(deleteId, context);
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // ListTile(
                    //   leading: Text(value.givenTestList.data[i].testName),
                    //   //  title: Text(value.givenTestList.data[i].tds),
                    //   subtitle: Text(value.givenTestList.data[i].reason),
                    //   trailing: SizedBox(
                    //     width: 100,
                    //     child: Row(
                    //       children: [
                    //         IconButton(
                    //           onPressed: () {
                    //             //EditOrderLabTest
                    //           },
                    //           icon: const Icon(Icons.edit),
                    //           color: Theme.of(context).primaryColor,
                    //         ),
                    //         IconButton(
                    //           onPressed: () async {
                    //             //DeleteOrderLabTest API
                    //           },
                    //           icon: const Icon(Icons.delete),
                    //           color: Theme.of(context).errorColor,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ),
                )
              : const Text("Something went wrong")
          : OthersHelper().spinner(allColor.backGroundColor),
    );
  }
}
