import 'package:design/helper/others_helper.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/order_lab/order_labs.dart';
import 'package:design/services/order_lab_service/all_order_lab_report_name_service.dart';
import 'package:design/services/order_lab_service/given_test_list_service.dart';
import 'package:design/services/order_lab_service/store_order_lab_test_service.dart';
import 'package:design/services/order_lab_service/update_order_lab_test_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GiveATestTwo extends StatefulWidget {
  const GiveATestTwo({
    Key? key,
    //  required this.testName, required this.reaseon
  }) : super(key: key);
  // final String testName;
  // final String reaseon;
  static const routeName = 'give a test';

  @override
  State<GiveATestTwo> createState() => _GiveATestTwoState();
}

TextEditingController _reasonController = TextEditingController();
TextEditingController _searchController = TextEditingController();

class _GiveATestTwoState extends State<GiveATestTwo> {
  @override
  void initState() {
    Provider.of<AllLabReportNameService>(context, listen: false)
        .fetchAllLabReportName();

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
  void didChangeDependencies() {
    if (_isInit) {
      final testId = ModalRoute.of(context)!.settings.arguments;
      print(testId);
      if (testId != null) {
        update = true;
        final giventestlist =
            Provider.of<GivenTestListService>(context, listen: false)
                .givenTestList;
        testName = giventestlist.data[testId].testName;
        reason = giventestlist.data[testId].reason;
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

  List<String> test = ['a', 'b', 'c'];
  List<String> testNameListOnSearch = [];
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
                      child: const Text("Order Labs")),
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
                update ? 'Update' : 'Give test',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
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
                            icon: Icon(Icons.cancel))
                        : SizedBox(
                            width: 1,
                          ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Consumer<AllLabReportNameService>(
                    builder: (BuildContext context, value, Widget? child) =>
                        value.allLabReportName != null
                            ? value.allLabReportName != "error"
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
                                              testNameListOnSearch
                                                  //  value.testName
                                                  = value.testName
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
                                            // top: screenWidth * 0.02,
                                            bottom: screenWidth * 0.02,
                                            right: screenWidth * 0.02,
                                          ),
                                          child: _searchController
                                                      .text.isNotEmpty &&
                                                  testNameListOnSearch.isEmpty
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
                                                      ? testNameListOnSearch
                                                          .length
                                                      : value.testName.length,
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
                                                                  testNameListOnSearch[
                                                                      i];
                                                            } else {
                                                              testName = value
                                                                  .testName[i];
                                                            }
                                                          } else {
                                                            if (_searchController
                                                                .text
                                                                .isNotEmpty) {
                                                              testName =
                                                                  (testName! +
                                                                      ',' +
                                                                      testNameListOnSearch[
                                                                          i]);
                                                            } else {
                                                              testName =
                                                                  (testName! +
                                                                      ',' +
                                                                      value.testName[
                                                                          i]);
                                                            }
                                                          }
                                                        });
                                                      },
                                                      title: _searchController
                                                              .text.isNotEmpty
                                                          ? Text(
                                                              testNameListOnSearch[
                                                                  i])
                                                          : Text(value
                                                              .testName[i]),
                                                    ),
                                                  ),
                                                ),
                                          //
                                        ),
                                      )
                                    ],
                                  )
                                : const Text("Something went wrong")
                            : OthersHelper().spinner(allColor.backGroundColor),
                  ),

                  ////
                  // DropdownButtonFormField(
                  //     decoration: InputDecoration(
                  //       focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(12),
                  //         borderSide: const BorderSide(
                  //           width: 3,
                  //           color: Colors.grey,
                  //         ),
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(12),
                  //         borderSide: const BorderSide(
                  //           width: 3,
                  //           color: Colors.grey,
                  //         ),
                  //       ),
                  //     ),
                  //     value: selectedItem,
                  //     items: items
                  //         .map((item) => DropdownMenuItem(
                  //             value: item,
                  //             child: Text(
                  //               item,
                  //               style: const TextStyle(fontSize: 20),
                  //             )))
                  //         .toList(),
                  //     onChanged: (item) {
                  //       setState(() {
                  //         selectedItem = item as String?;
                  //       });
                  //     }),
                ),
                TextFormField(
                  //   initialValue: "reason",
                  controller: _reasonController,
                  decoration: InputDecoration(labelText: 'Reason'),
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
                          testName!.isNotEmpty) {
                        //StoreOrderLabTest API
                        update
                            ? await Provider.of<UpdateOrderLabTestService>(
                                    context,
                                    listen: false)
                                .updateOrderLabTest(updateId!, testName!,
                                    _reasonController.text, context)
                            : await Provider.of<StoreOrderLabTestService>(
                                    context,
                                    listen: false)
                                .storeOrderLabTest(
                                    testName!, _reasonController.text, context);
                      } else {
                        OthersHelper().showToast(
                            "Provide Proper Data!", allColor.backGroundColor);
                      }
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
                          builder: (context) => const OrderLabs()));
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

// import 'package:design/screen/get_started.dart';
// import 'package:flutter/material.dart';

// class OrderLabsTwo extends StatefulWidget {
//   const OrderLabsTwo({Key? key}) : super(key: key);

//   @override
//   _OrderLabsTwoState createState() => _OrderLabsTwoState();
// }

// List<String> rules = [];
// String? initValRules;
// TextEditingController _labTestEditingController = TextEditingController();

// class _OrderLabsTwoState extends State<OrderLabsTwo> {
//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;
//     return SafeArea(
//         child: Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(screenWidth * 0.05),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: screenHeight * 0.02,
//             ),
//             Row(children: [
//               ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       primary: allColor.backGroundColor),
//                   onPressed: () {},
//                   child: Text("Order Labs")),
//               Spacer(),
//               Container(
//                   height: screenHeight * 0.07,
//                   child: Image.asset("assets/images/k.jpeg"))
//             ]),
//             SizedBox(
//               height: screenWidth * 0.05,
//             ),
//             Row(children: [
//               Text("Javed Ahmad M/46",
//                   style: TextStyle(
//                       fontSize: screenWidth * 0.06,
//                       fontWeight: FontWeight.bold)),
//               Spacer(),
//               Container(
//                   height: screenHeight * 0.08,
//                   child: Image(image: AssetImage("assets/images/men.png")))
//             ]),
//             Padding(
//               padding: EdgeInsets.all(screenWidth * 0.01),
//               child: Text("Complaint",
//                   style: TextStyle(
//                       fontSize: screenWidth * 0.04,
//                       fontWeight: FontWeight.bold)),
//             ),
//             Container(
//                 // color: Color(0xffff7e11),
//                 height: screenHeight * 0.05,
//                 decoration:
//                     BoxDecoration(border: Border.all(color: Colors.grey)),
//                 width: screenWidth,
//                 child: Padding(
//                     padding: EdgeInsets.all(screenWidth * 0.03),
//                     child: Text("Chest pain since last 6 month",
//                         style: TextStyle(
//                           fontSize: screenWidth * 0.04,
//                         )))),
//             SizedBox(height: screenWidth * 0.05),
//             Padding(
//               padding: EdgeInsets.all(screenWidth * 0.01),
//               child: Text("Add Lab Test",
//                   style: TextStyle(
//                       fontSize: screenWidth * 0.04,
//                       fontWeight: FontWeight.bold)),
//             ),
//             Container(
//                 height: screenHeight * 0.05,
//                 child: Row(children: [
//                   Flexible(
//                       child: TextFormField(
//                           controller: _labTestEditingController,
//                           decoration: InputDecoration(
//                               hintText: "Lab Test",
//                               focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide:
//                                       BorderSide(color: Colors.black12)),
//                               focusColor: Colors.black12,
//                               border: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.black12),
//                                   borderRadius: BorderRadius.circular(10))))),
//                   SizedBox(
//                     width: screenWidth * 0.02,
//                   ),
//                   Container(
//                       height: screenHeight * 0.07,
//                       decoration: BoxDecoration(
//                           color: Colors.grey,
//                           border: Border.all(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Center(
//                           child: DropdownButton(
//                               iconDisabledColor: Colors.white,
//                               iconEnabledColor: Colors.white,
//                               hint: Text('Lab Test',
//                                   style: TextStyle(color: Colors.white)),
//                               items: rules
//                                   .map((val) => DropdownMenuItem(
//                                       value: val, child: Text(val)))
//                                   .toList(),
//                               onChanged: (newVal) {
//                                 setState(() {
//                                   initValRules = newVal.toString();
//                                 });
//                               })))
//                 ])),

//             SizedBox(height: screenWidth * 0.03),
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     primary: allColor.elevatedBtnColor),
//                 onPressed: () {},
//                 child: Padding(
//                     padding: EdgeInsets.only(
//                         left: screenWidth * 0.05,
//                         top: screenWidth * 0.02,
//                         bottom: screenWidth * 0.02,
//                         right: screenWidth * 0.05),
//                     child: Text('Add',
//                         style: TextStyle(fontSize: screenWidth * 0.04)))),
//             SizedBox(height: screenWidth * 0.05),
//             // Expanded(
//             //   child: ListView.builder(
//             //       itemCount: 5,
//             //       itemBuilder: (context, index){
//             //         return
//             //           Padding(
//             //             padding:  EdgeInsets.only(top: 5, bottom: 5),
//             //             child: Container(
//             //               decoration: BoxDecoration(
//             //                   borderRadius: BorderRadius.circular(10),
//             //                   border: Border.all(color: Colors.grey)),
//             //               width: screenWidth,
//             //               height: screenHeight*0.05,
//             //               child: Column(
//             //                 children: [
//             //                   Row(
//             //                     children: [
//             //                       Text(_labTestEditingController.text)
//             //                     ],
//             //                   )
//             //                 ],
//             //               ),
//             //             ),
//             //           );
//             //       }),
//             // ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: EdgeInsets.only(
//             left: screenWidth * 0.10,
//             right: screenWidth * 0.10,
//             bottom: screenWidth * 0.05),
//         child: Row(
//           children: [
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30)),
//                     primary: Colors.blue),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Padding(
//                     padding: EdgeInsets.only(
//                         left: screenWidth * 0.05,
//                         top: screenWidth * 0.02,
//                         bottom: screenWidth * 0.02,
//                         right: screenWidth * 0.05),
//                     child: Text('Back',
//                         style: TextStyle(fontSize: screenWidth * 0.04)))),
//             Spacer(),
//             Container(
//                 height: screenHeight * 0.05,
//                 child: InkWell(
//                     onTap: () {},
//                     child: Image.asset("assets/images/right.png"))),
//             Spacer(),
//             Container(
//               height: screenHeight * 0.05,
//               child: InkWell(
//                   onTap: () {},
//                   child: Image.asset("assets/images/setting.png")),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }

////////////////////////////////////////////////////////////////////////////////
///
///import 'package:design/helper/others_helper.dart';
// import 'package:design/screen/get_started.dart';
// import 'package:design/screen/others_screen/order_lab/order_labs.dart';
// import 'package:design/services/all_lab_report_name_service.dart';
// import 'package:design/services/given_test_list_service.dart';
// import 'package:design/services/store_order_lab_test_service.dart';
// import 'package:design/services/update_order_lab_test_service.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class GiveATest extends StatefulWidget {
//   const GiveATest({
//     Key? key,
//     //  required this.testName, required this.reaseon
//   }) : super(key: key);
//   // final String testName;
//   // final String reaseon;
//   static const routeName = 'give a test';

//   @override
//   State<GiveATest> createState() => _GiveATestState();
// }

// TextEditingController _reasonController = TextEditingController();

// class _GiveATestState extends State<GiveATest> {
//   @override
//   void initState() {
//     Provider.of<AllLabReportNameService>(context, listen: false)
//         .fetchAllLabReportName();

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
//   void didChangeDependencies() {
//     if (_isInit) {
//       final testId = ModalRoute.of(context)!.settings.arguments;
//       print(testId);
//       if (testId != null) {
//         update = true;
//         final giventestlist =
//             Provider.of<GivenTestListService>(context, listen: false)
//                 .givenTestList;
//         testName = giventestlist.data[testId].testName;
//         reason = giventestlist.data[testId].reason;
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
//                       child: const Text("Order Labs")),
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
//                 update ? 'Update' : 'Give test',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//               ),
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
//                             icon: Icon(Icons.cancel))
//                         : SizedBox(
//                             width: 1,
//                           ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Center(
//                   child: Consumer<AllLabReportNameService>(
//                     builder: (BuildContext context, value, Widget? child) =>
//                         value.allLabReportName != null
//                             ? value.allLabReportName != "error"
//                                 ? Container(
//                                     decoration: BoxDecoration(
//                                         border: Border.all(
//                                             width: 3.0, color: Colors.grey),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(5.0))),
//                                     height: screenHeight * 0.25,
//                                     width: double.infinity,
//                                     child: Padding(
//                                       padding: EdgeInsets.only(
//                                         left: screenWidth * 0.02,
//                                         top: screenWidth * 0.02,
//                                         bottom: screenWidth * 0.02,
//                                         right: screenWidth * 0.02,
//                                       ),
//                                       child: ListView.builder(
//                                         itemCount:
//                                             value.allLabReportName.data.length,
//                                         itemBuilder: (_, i) => Card(
//                                           elevation: 2,
//                                           // margin: EdgeInsets.symmetric(vertical: ,horizontal: ),

//                                           child: ListTile(
//                                             onTap: () {
//                                               setState(() {
//                                                 selected = true;
//                                                 if (testName == "null") {
//                                                   testName = value
//                                                       .allLabReportName
//                                                       .data[i]
//                                                       .testname;
//                                                 } else {
//                                                   testName = (testName! +
//                                                       ',' +
//                                                       value.allLabReportName
//                                                           .data[i].testname);
//                                                 }
//                                               });
//                                             },
//                                             title: Text(value.allLabReportName
//                                                 .data[i].testname),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   )
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
//                   decoration: InputDecoration(labelText: 'Reason'),
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
//                         //StoreOrderLabTest API
//                         update
//                             ? await Provider.of<UpdateOrderLabTestService>(
//                                     context,
//                                     listen: false)
//                                 .updateOrderLabTest(updateId!, testName!,
//                                     _reasonController.text, context)
//                             : await Provider.of<StoreOrderLabTestService>(
//                                     context,
//                                     listen: false)
//                                 .storeOrderLabTest(
//                                     testName!, _reasonController.text, context);
//                       } else {
//                         OthersHelper().showToast(
//                             "Provide Proper Data!", allColor.backGroundColor);
//                       }
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
//                           builder: (context) => const OrderLabs()));
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
