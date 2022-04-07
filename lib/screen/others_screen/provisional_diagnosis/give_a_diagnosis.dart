import 'package:design/helper/others_helper.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/order_lab/order_labs.dart';
import 'package:design/screen/others_screen/provisional_diagnosis/provisional_diagnosis.dart';
import 'package:design/services/order_lab_service/all_order_lab_report_name_service.dart';
import 'package:design/services/provisinal_diagnosis_services/dafault_name_list_service.dart';
import 'package:design/services/provisinal_diagnosis_services/diagnosis_create_service.dart';
import 'package:design/services/provisinal_diagnosis_services/diagnosis_list_by_patient_id_service.dart';
import 'package:design/services/provisinal_diagnosis_services/diagnosis_update_service.dart';
import 'package:design/services/order_lab_service/update_order_lab_test_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GiveADiagnosis extends StatefulWidget {
  const GiveADiagnosis({
    Key? key,
    //  required this.testName, required this.reaseon
  }) : super(key: key);
  // final String testName;
  // final String reaseon;
  static const routeName = 'give a diagnosis';

  @override
  State<GiveADiagnosis> createState() => _GiveADiagnosisState();
}

TextEditingController _reasonController = TextEditingController();
TextEditingController _searchController = TextEditingController();

class _GiveADiagnosisState extends State<GiveADiagnosis> {
  @override
  void initState() {
    // Provider.of<AllLabReportNameService>(context, listen: false)
    //     .fetchAllLabReportName();
    Provider.of<DefaultNameListService>(context, listen: false)
        .defaultNameList();

    // TODO: implement initState
    super.initState();
  }

  var _isInit = true;
  String? testName = "null";
  String? reason = "";
  var selected = false;
  var update = false;
  String? updateId;
  @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     Provider.of<DefaultNameListService>(context, listen: false)
  //         .defaultNameList();
  //   }
  //   _isInit = false;
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //}

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final testId = ModalRoute.of(context)!.settings.arguments;
      print(testId);
      if (testId != null) {
        update = true;
        final giventestlist =
            Provider.of<DiagnosisListByPatientIdService>(context, listen: false)
                .diagnosislistbypatientid;
        testName = giventestlist.data[testId].provisinalDiagnosis;
        reason = giventestlist.data[testId].provisinalNote;
        _reasonController = TextEditingController(text: reason);
        selected = true;
        print(testName);
        print(reason);
        updateId = giventestlist.data[testId].id.toString();
      } else {
        _reasonController = TextEditingController(text: null);
      }
    }
    _isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _reasonController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  List<String> diagnosisNameListOnSearch = [];
  @override
  Widget build(BuildContext context) {
    // print(itte);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      body: Padding(
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
                      child: const Text("Provisional Diagnosis")),
                  const Spacer(),
                  Container(
                      height: screenHeight * 0.07,
                      child: Image.asset("assets/images/k.jpeg")),
                ],
              ),
              SizedBox(
                height: screenWidth * 0.05,
              ),
              Row(children: [
                Text("Javed Ahmad M/46",
                    style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold)),
                const Spacer(),
                Container(
                  height: screenHeight * 0.08,
                  child:
                      const Image(image: AssetImage("assets/images/men.png")),
                )
              ]),
              SizedBox(height: screenWidth * 0.10),
              Text(
                update ? 'Update' : 'Give Diagnosis',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Divider(),
              SizedBox(height: screenWidth * 0.05),
              // SizedBox(
              //   height: screenHeight * 0.70,
              //   child:
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (selected)
                      Expanded(
                        child: Text(
                          testName!,
                          style: const TextStyle(fontSize: 18),
                        ),
                      )
                    else
                      const Text('Select here', style: TextStyle(fontSize: 18)),
                    selected
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                selected = false;
                                testName = "null";
                              });
                            },
                            icon: const Icon(Icons.cancel))
                        : const SizedBox(
                            width: 1,
                          ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Consumer<DefaultNameListService>(
                    builder: (BuildContext context, value, Widget? child) =>
                        value.defaultnamelist != null
                            ? value.defaultnamelist != "error"
                                ? Column(
                                    children: [
                                      Container(
                                        height: 42,
                                        margin:
                                            EdgeInsets.fromLTRB(16, 16, 16, 16),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.black26),
                                        ),
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: TextField(
                                          onChanged: (val) {
                                            setState(() {
                                              diagnosisNameListOnSearch
                                                  //  value.testName
                                                  = value.diagnosisNameList
                                                      .where((element) => element
                                                          .toLowerCase()
                                                          .contains(val
                                                              .toLowerCase()))
                                                      .toList();
                                            });
                                          },
                                          controller: _searchController,
                                          decoration: const InputDecoration(
                                            icon: Icon(
                                              Icons.search,
                                            ),
                                            hintText: 'Search',
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // decoration: BoxDecoration(
                                        //     border: Border.all(
                                        //         width: 3.0, color: Colors.grey),
                                        //     borderRadius:
                                        //         const BorderRadius.all(
                                        //             Radius.circular(5.0),
                                        //             ),
                                        //             ),
                                        height: screenHeight * 0.25,
                                        width: double.infinity,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: screenWidth * 0.02,
                                            top: screenWidth * 0.02,
                                            bottom: screenWidth * 0.02,
                                            right: screenWidth * 0.02,
                                          ),
                                          child: _searchController
                                                      .text.isNotEmpty &&
                                                  diagnosisNameListOnSearch
                                                      .isEmpty
                                              ? Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: const [
                                                    Icon(
                                                      Icons.search_off,
                                                      // size: 60,
                                                    ),
                                                    Text('No result found',
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                                  ],
                                                )
                                              : ListView.builder(
                                                  itemCount: _searchController
                                                          .text.isNotEmpty
                                                      ? diagnosisNameListOnSearch
                                                          .length
                                                      : value.diagnosisNameList
                                                          .length,
                                                  // value
                                                  //     .allLabReportName.data.length,
                                                  itemBuilder: (_, i) => Card(
                                                    elevation: 2,
                                                    // margin: EdgeInsets.symmetric(vertical: ,horizontal: ),

                                                    child: ListTile(
                                                      onTap: () {
                                                        setState(() {
                                                          selected = true;
                                                          if (testName ==
                                                              "null") {
                                                            if (_searchController
                                                                .text
                                                                .isNotEmpty) {
                                                              testName =
                                                                  diagnosisNameListOnSearch[
                                                                      i];
                                                            } else {
                                                              testName = value
                                                                  .diagnosisNameList[i];
                                                            }
                                                          } else {
                                                            if (_searchController
                                                                .text
                                                                .isNotEmpty) {
                                                              testName =
                                                                  (testName! +
                                                                      ',' +
                                                                      diagnosisNameListOnSearch[
                                                                          i]);
                                                            } else {
                                                              testName =
                                                                  (testName! +
                                                                      ',' +
                                                                      value.diagnosisNameList[
                                                                          i]);
                                                            }
                                                          }
                                                        });
                                                      },
                                                      title: _searchController
                                                              .text.isNotEmpty
                                                          ? Text(
                                                              diagnosisNameListOnSearch[
                                                                  i])
                                                          : Text(value
                                                              .diagnosisNameList[i]),
                                                    ),
                                                  ),
                                                ),
                                          // ListView.builder(
                                          //   itemCount: value
                                          //       .defaultnamelist.data.length,
                                          //   itemBuilder: (_, i) => Card(
                                          //     elevation: 2,
                                          //     // margin: EdgeInsets.symmetric(vertical: ,horizontal: ),

                                          //     child: ListTile(
                                          //       onTap: () {
                                          //         setState(() {
                                          //           selected = true;
                                          //           if (testName == "null") {
                                          //             testName = value
                                          //                 .defaultnamelist
                                          //                 .data[i];
                                          //           } else {
                                          //             testName = (testName! +
                                          //                 ',' +
                                          //                 value.defaultnamelist
                                          //                     .data[i]);
                                          //           }
                                          //         });
                                          //       },
                                          //       title: Text(value
                                          //           .defaultnamelist.data[i]),
                                          //     ),
                                          //   ),
                                          // ),
                                          //
                                        ),
                                      )
                                    ],
                                  )

                                //
                                : const Text("Something went wrong")
                            : OthersHelper().spinner(allColor.backGroundColor),
                  ),
                ),
                TextFormField(
                  //   initialValue: "reason",
                  controller: _reasonController,
                  decoration: InputDecoration(labelText: 'Note'),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        primary: const Color(0xffb3d9ef)),
                    onPressed: () async {
                      if (_reasonController.text.isNotEmpty &&
                          testName!.isNotEmpty &&
                          testName != "null") {
                        update
                            ? await Provider.of<DiagnosisUpdateService>(context,
                                    listen: false)
                                .diagnosisUpdate(
                                updateId!,
                                testName!,
                                _reasonController.text,
                                context,
                              )
                            : await Provider.of<DiagnosisCreateService>(context,
                                    listen: false)
                                .diagnosisCreate(
                                testName!,
                                _reasonController.text,
                                context,
                              );
                      } else {
                        OthersHelper().showToast(
                            "Provide Proper Data!", allColor.backGroundColor);
                      }
                      //StoreOrderLabTest API

                      // await Provider.of<StoreOrderLabTestService>(context,
                      //         listen: false)
                      //     .storeOrderLabTest(
                      //         testName!, _reasonController.text, context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.02,
                        top: screenWidth * 0.02,
                        bottom: screenWidth * 0.02,
                        right: screenWidth * 0.02,
                      ),
                      child: Text(update ? 'Update' : 'Submit',
                          style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Colors.black)),
                    )),
              ]),
              //  )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: Row(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    primary: Colors.blue),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProvitionalDiagnosis()));
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
                )),
          ],
        ),
      ),
    ));
  }
}





// import 'package:design/helper/others_helper.dart';
// import 'package:design/models/provisional_diagnosis_models/provisional_diagnosis_name_model.dart';
// import 'package:design/screen/get_started.dart';
// import 'package:design/screen/others_screen/order_lab/order_labs.dart';
// import 'package:design/screen/others_screen/provisional_diagnosis/provisional_diagnosis.dart';
// import 'package:design/services/all_lab_report_name_service.dart';
// import 'package:design/services/provisinal_diagnosis_services/dafault_name_list_service.dart';
// import 'package:design/services/provisinal_diagnosis_services/diagnosis_create_service.dart';
// import 'package:design/services/provisinal_diagnosis_services/diagnosis_list_by_patient_id_service.dart';
// import 'package:design/services/provisinal_diagnosis_services/diagnosis_update_service.dart';
// import 'package:design/services/update_order_lab_test_service.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class GiveADiagnosis extends StatefulWidget {
//   const GiveADiagnosis({
//     Key? key,
//     //  required this.testName, required this.reaseon
//   }) : super(key: key);
//   // final String testName;
//   // final String reaseon;
//   static const routeName = 'give a diagnosis';

//   @override
//   State<GiveADiagnosis> createState() => _GiveADiagnosisState();
// }

// TextEditingController _reasonController = TextEditingController();
// TextEditingController _searchController = TextEditingController();

// class _GiveADiagnosisState extends State<GiveADiagnosis> {
//   @override
//   void initState() {
//     // Provider.of<AllLabReportNameService>(context, listen: false)
//     //     .fetchAllLabReportName();
//     Provider.of<DefaultNameListService>(context, listen: false)
//         .defaultNameList();

//     // TODO: implement initState
//     super.initState();
//   }

//   var _isInit = true;
//   String? testName = "null";
//   String? reason = "";
//   var selected = false;
//   var update = false;
//   String? updateId;
//   @override
//   // void didChangeDependencies() {
//   //   if (_isInit) {
//   //     Provider.of<DefaultNameListService>(context, listen: false)
//   //         .defaultNameList();
//   //   }
//   //   _isInit = false;
//   //   // TODO: implement didChangeDependencies
//   //   super.didChangeDependencies();
//   //}

//   @override
//   void didChangeDependencies() {
//     if (_isInit) {
//       final testId = ModalRoute.of(context)!.settings.arguments;
//       print(testId);
//       if (testId != null) {
//         update = true;
//         final giventestlist =
//             Provider.of<DiagnosisListByPatientIdService>(context, listen: false)
//                 .diagnosislistbypatientid;
//         testName = giventestlist.data[testId].provisinalDiagnosis;
//         reason = giventestlist.data[testId].provisinalNote;
//         _reasonController = TextEditingController(text: reason);
//         selected = true;
//         print(testName);
//         print(reason);
//         updateId = giventestlist.data[testId].id.toString();
//       } else {
//         _reasonController = TextEditingController(text: null);
//       }
//     }
//     _isInit = false;
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//   }

//   @override
//   void dispose() {
//     _reasonController.dispose();

//     // TODO: implement dispose
//     super.dispose();
//   }
//  List<String> diagnosisNameListOnSearch = [];
//   @override
//   Widget build(BuildContext context) {
//     // print(itte);
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;

//     return SafeArea(
//         child: Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(screenWidth * 0.05),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: screenHeight * 0.02,
//               ),
//               Row(
//                 children: [
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           primary: allColor.backGroundColor),
//                       onPressed: () {},
//                       child: const Text("Provisional Diagnosis")),
//                   const Spacer(),
//                   Container(
//                       height: screenHeight * 0.07,
//                       child: Image.asset("assets/images/k.jpeg")),
//                 ],
//               ),
//               SizedBox(
//                 height: screenWidth * 0.05,
//               ),
//               Row(children: [
//                 Text("Javed Ahmad M/46",
//                     style: TextStyle(
//                         fontSize: screenWidth * 0.06,
//                         fontWeight: FontWeight.bold)),
//                 const Spacer(),
//                 Container(
//                   height: screenHeight * 0.08,
//                   child:
//                       const Image(image: AssetImage("assets/images/men.png")),
//                 )
//               ]),
//               SizedBox(height: screenWidth * 0.10),
//               Text(
//                 update ? 'Update' : 'Give Diagnosis',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//               ),
//               Divider(),
//               SizedBox(height: screenWidth * 0.05),
//               // SizedBox(
//               //   height: screenHeight * 0.70,
//               //   child:
//               Column(children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     if (selected)
//                       Expanded(
//                         child: Text(
//                           testName!,
//                           style: const TextStyle(fontSize: 18),
//                         ),
//                       )
//                     else
//                       const Text('Select here', style: TextStyle(fontSize: 18)),
//                     selected
//                         ? IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 selected = false;
//                                 testName = "null";
//                               });
//                             },
//                             icon: const Icon(Icons.cancel))
//                         : const SizedBox(
//                             width: 1,
//                           ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Center(
//                   child: Consumer<DefaultNameListService>(
//                     builder: (BuildContext context, value, Widget? child) =>
//                         value.defaultnamelist != null
//                             ? value.defaultnamelist != "error"
//                                 ? Column(
//                                     children: [
//                                       Container(
//                                         height: 42,
//                                         margin:
//                                             EdgeInsets.fromLTRB(16, 16, 16, 16),
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(12),
//                                           color: Colors.white,
//                                           border:
//                                               Border.all(color: Colors.black26),
//                                         ),
//                                         padding:
//                                             EdgeInsets.symmetric(horizontal: 8),
//                                         child: TextField(
//                                           onChanged: (val) {
//                                             setState(() {
//                                               diagnosisNameListOnSearch
//                                                   //  value.testName
//                                                   = value.diagnosisNameList
//                                                       .where((element) => element
//                                                           .toLowerCase()
//                                                           .contains(val
//                                                               .toLowerCase()))
//                                                       .toList();
//                                             });
//                                           },
//                                           controller: _searchController,
//                                           decoration: const InputDecoration(
//                                             icon: Icon(
//                                               Icons.search,
//                                             ),
//                                             hintText: 'Search',
//                                           ),
//                                         ),
//                                       ),
//                                       Container(
//                                         // decoration: BoxDecoration(
//                                         //     border: Border.all(
//                                         //         width: 3.0, color: Colors.grey),
//                                         //     borderRadius:
//                                         //         const BorderRadius.all(
//                                         //             Radius.circular(5.0),
//                                         //             ),
//                                         //             ),
//                                         height: screenHeight * 0.25,
//                                         width: double.infinity,
//                                         child: Padding(
//                                           padding: EdgeInsets.only(
//                                             left: screenWidth * 0.02,
//                                             top: screenWidth * 0.02,
//                                             bottom: screenWidth * 0.02,
//                                             right: screenWidth * 0.02,
//                                           ),
//                                           child: ListView.builder(
//                                             itemCount: value
//                                                 .defaultnamelist.data.length,
//                                             itemBuilder: (_, i) => Card(
//                                               elevation: 2,
//                                               // margin: EdgeInsets.symmetric(vertical: ,horizontal: ),

//                                               child: ListTile(
//                                                 onTap: () {
//                                                   setState(() {
//                                                     selected = true;
//                                                     if (testName == "null") {
//                                                       testName = value
//                                                           .defaultnamelist
//                                                           .data[i];
//                                                     } else {
//                                                       testName = (testName! +
//                                                           ',' +
//                                                           value.defaultnamelist
//                                                               .data[i]);
//                                                     }
//                                                   });
//                                                 },
//                                                 title: Text(value
//                                                     .defaultnamelist.data[i]),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   )

//                                 //
//                                 : const Text("Something went wrong")
//                             : OthersHelper().spinner(allColor.backGroundColor),
//                   ),

//                   ////
//                   // DropdownButtonFormField(
//                   //     decoration: InputDecoration(
//                   //       focusedBorder: OutlineInputBorder(
//                   //         borderRadius: BorderRadius.circular(12),
//                   //         borderSide: const BorderSide(
//                   //           width: 3,
//                   //           color: Colors.grey,
//                   //         ),
//                   //       ),
//                   //       enabledBorder: OutlineInputBorder(
//                   //         borderRadius: BorderRadius.circular(12),
//                   //         borderSide: const BorderSide(
//                   //           width: 3,
//                   //           color: Colors.grey,
//                   //         ),
//                   //       ),
//                   //     ),
//                   //     value: selectedItem,
//                   //     items: items
//                   //         .map((item) => DropdownMenuItem(
//                   //             value: item,
//                   //             child: Text(
//                   //               item,
//                   //               style: const TextStyle(fontSize: 20),
//                   //             )))
//                   //         .toList(),
//                   //     onChanged: (item) {
//                   //       setState(() {
//                   //         selectedItem = item as String?;
//                   //       });
//                   //     }),
//                 ),
//                 TextFormField(
//                   //   initialValue: "reason",
//                   controller: _reasonController,
//                   decoration: InputDecoration(labelText: 'Note'),
//                   maxLines: 3,
//                   keyboardType: TextInputType.multiline,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30)),
//                         primary: const Color(0xffb3d9ef)),
//                     onPressed: () async {
//                       if (_reasonController.text.isNotEmpty &&
//                           testName!.isNotEmpty) {
//                         update
//                             ? await Provider.of<DiagnosisUpdateService>(context,
//                                     listen: false)
//                                 .diagnosisUpdate(
//                                 updateId!,
//                                 testName!,
//                                 _reasonController.text,
//                                 context,
//                               )
//                             : await Provider.of<DiagnosisCreateService>(context,
//                                     listen: false)
//                                 .diagnosisCreate(
//                                 testName!,
//                                 _reasonController.text,
//                                 context,
//                               );
//                       } else {
//                         OthersHelper().showToast(
//                             "Provide Proper Data!", allColor.backGroundColor);
//                       }
//                       //StoreOrderLabTest API

//                       // await Provider.of<StoreOrderLabTestService>(context,
//                       //         listen: false)
//                       //     .storeOrderLabTest(
//                       //         testName!, _reasonController.text, context);
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                         left: screenWidth * 0.02,
//                         top: screenWidth * 0.02,
//                         bottom: screenWidth * 0.02,
//                         right: screenWidth * 0.02,
//                       ),
//                       child: Text(update ? 'Update' : 'Submit',
//                           style: TextStyle(
//                               fontSize: screenWidth * 0.04,
//                               color: Colors.black)),
//                     )),
//               ]),
//               //  )
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: EdgeInsets.all(screenWidth * 0.02),
//         child: Row(
//           children: [
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30)),
//                     primary: Colors.blue),
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const ProvitionalDiagnosis()));
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       left: screenWidth * 0.05,
//                       top: screenWidth * 0.02,
//                       bottom: screenWidth * 0.02,
//                       right: screenWidth * 0.05),
//                   child: Text('Back',
//                       style: TextStyle(
//                         fontSize: screenWidth * 0.04,
//                       )),
//                 )),
//           ],
//         ),
//       ),
//     ));
//   }
// }
