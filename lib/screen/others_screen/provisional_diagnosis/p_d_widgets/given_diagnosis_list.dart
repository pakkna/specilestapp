import 'package:design/helper/others_helper.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/provisional_diagnosis/give_a_diagnosis.dart';
import 'package:design/services/order_lab_service/given_test_list_service.dart';
import 'package:design/services/order_lab_service/delete_order_lab_service.dart';
import 'package:design/services/provisinal_diagnosis_services/diagnosis_delete_by_id_service.dart';
import 'package:design/services/provisinal_diagnosis_services/diagnosis_list_by_patient_id_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GivenDiagnosisList extends StatefulWidget {
  const GivenDiagnosisList({Key? key}) : super(key: key);

  @override
  State<GivenDiagnosisList> createState() => _GivenDiagnosisListState();
}

class _GivenDiagnosisListState extends State<GivenDiagnosisList> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Consumer<DiagnosisListByPatientIdService>(
      builder: (BuildContext context, value, Widget? child) => value
                  .diagnosislistbypatientid !=
              null
          ? value.diagnosislistbypatientid != "error"
              ? ListView.builder(
                  itemCount: value.diagnosislistbypatientid.data.length,
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
                        children: [
                          if (value.diagnosislistbypatientid.data[i]
                                  .provisinalDiagnosis ==
                              null)
                            SizedBox(
                              width: screenWidth * 0.28,
                              child: Text(""),
                            )
                          else
                            SizedBox(
                              width: screenWidth * 0.28,
                              child: Text(value.diagnosislistbypatientid.data[i]
                                  .provisinalDiagnosis),
                            ),
                          //
                          SizedBox(width: screenWidth * 0.02),
                          if (value.diagnosislistbypatientid.data[i]
                                  .provisinalNote ==
                              null)
                            SizedBox(width: screenWidth * 0.27, child: Text(""))
                          else
                            SizedBox(
                                width: screenWidth * 0.27,
                                child: Text(value.diagnosislistbypatientid
                                    .data[i].provisinalNote)),
                          IconButton(
                            onPressed: () {
                              //EditOrderLabTest
                              Navigator.of(context).pushNamed(
                                  GiveADiagnosis.routeName,
                                  arguments: i);
                            },
                            icon: const Icon(Icons.edit),
                            color: Theme.of(context).primaryColor,
                          ),
                          IconButton(
                            onPressed: () async {
                              // await Provider.of<DiagnosisDeleteByIdService>(
                              //         context,
                              //         listen: false)
                              //     .diagnosisDeleteById(i.toString(), context);
                              // setState(() {});

                              final givendiagnosislist =
                                  Provider.of<DiagnosisListByPatientIdService>(
                                          context,
                                          listen: false)
                                      .diagnosislistbypatientid;
                              String deleteId =
                                  givendiagnosislist.data[i].id.toString();

                              // //DeleteOrderLabTest API
                              try {
                                await Provider.of<DiagnosisDeleteByIdService>(
                                        context,
                                        listen: false)
                                    .diagnosisDeleteById(deleteId, context);
                              } catch (e) {
                                print(e);
                              }
                            },
                            icon: const Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
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
