import 'package:design/helper/others_helper.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/specialist_assessment/create_a_assessment.dart';
import 'package:design/services/order_lab_service/given_test_list_service.dart';
import 'package:design/services/order_lab_service/delete_order_lab_service.dart';
import 'package:design/services/specialist_assessment_service/assessment_delete_service.dart';
import 'package:design/services/specialist_assessment_service/given_assessment_list_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GivenAssessmentList extends StatefulWidget {
  const GivenAssessmentList({Key? key}) : super(key: key);

  @override
  State<GivenAssessmentList> createState() => _GivenAssessmentListState();
}

class _GivenAssessmentListState extends State<GivenAssessmentList> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Consumer<GivenAssessmentListService>(
      builder: (BuildContext context, value, Widget? child) => value
                  .givenassessmentlist !=
              null
          ? value.givenassessmentlist != "error"
              ? ListView.builder(
                  itemCount: value.givenassessmentlist.data.length,
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
                          if (value.givenassessmentlist.data[i].note == null)
                            SizedBox(
                              width: screenWidth * 0.28,
                              child: Text(""),
                            )
                          else
                            SizedBox(
                              width: screenWidth * 0.28,
                              child:
                                  Text(value.givenassessmentlist.data[i].note),
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
                                      CreateAAssessment.routeName,
                                      arguments: i);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                color: Theme.of(context).errorColor,
                                onPressed: () async {
                                  final givenassessmentlist =
                                      Provider.of<GivenAssessmentListService>(
                                              context,
                                              listen: false)
                                          .givenassessmentlist;
                                  String deleteId =
                                      givenassessmentlist.data[i].id.toString();
                                  // print(deleteId);

                                  // DeleteOrderLabTest API
                                  try {
                                    await Provider.of<AssessmentDeleteService>(
                                            context,
                                            listen: false)
                                        .deleteAssessment(deleteId, context);
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
