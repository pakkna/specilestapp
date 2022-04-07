// import 'package:design/screen/get_started.dart';
// import 'package:design/screen/others_screen/medicine/add_new_medicine.dart';
// import 'package:design/screen/others_screen/medicine/medicine_widgets/show_drug_interaction.dart';
// import 'package:design/services/medicine_service/drug_interaction_service.dart';
// import 'package:design/services/medicine_service/medicine_list_service.dart';
// import 'package:design/services/medicine_service/medicine_status_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helper/others_helper.dart';
import '../../../services/medicine_service/drug_interaction_service.dart';
import '../../../services/medicine_service/medicine_list_service.dart';
import '../../../services/medicine_service/medicine_status_service.dart';
import '../../get_started.dart';
import '../../patient/patient_helper.dart';
import 'add_new_medicine.dart';
import 'medicine_widgets/show_drug_interaction.dart';

class StopOldMedicine extends StatefulWidget {
  const StopOldMedicine({Key? key}) : super(key: key);

  @override
  _StopOldMedicineState createState() => _StopOldMedicineState();
}

class _StopOldMedicineState extends State<StopOldMedicine> {
  @override
  void initState() {
    print('init');
    // TODO: implement initState
    super.initState();
    Provider.of<MedicineListService>(context, listen: false)
        .fetchMedList(false);
  }

  Future<void> _showDrugInteraction() async {
    final comment =
        Provider.of<DrugInteractionService>(context, listen: false).comment;
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return ShowDrugInteraction(comment);
        });
  }

  bool _continue = false;
  List<String?> medicineList = [];
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Consumer<MedicineListService>(
        builder: (context, provider, child) => provider.medList != null
            ? provider.medList != "error"
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
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: allColor.backGroundColor),
                                  onPressed: () {},
                                  child: const Text(
                                      "Stop old medicine/Drug interaction")),
                              const Spacer(),
                              SizedBox(
                                  height: screenHeight * 0.07,
                                  child: Image.asset("assets/images/k.jpeg")),
                            ],
                          ),
                          SizedBox(
                            height: screenWidth * 0.05,
                          ),
                          //User name and profile image ==============>
                          PatientHelper().nameAndImage(),
                          const SizedBox(height: 40),
                          Table(
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(.7),
                              2: FlexColumnWidth(2),
                              3: FlexColumnWidth(1.5),
                              4: FlexColumnWidth(2),
                            },
                            border: TableBorder.all(color: Colors.grey),
                            children: [
                              TableRow(children: [
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.02),
                                  child: Text(
                                    'Select',
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.02),
                                  child: Text(
                                    'S.No.',
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.02),
                                  child: Text('Name',
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.bold)),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.02),
                                  child: Text('Before/After Meal',
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.bold)),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.02),
                                  child: Text('Continue/Discontinue',
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.bold)),
                                )),
                              ]),
                              for (int i = 0;
                                  i < provider.medList.data.data.length;
                                  i++)
                                TableRow(children: [
                                  TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(screenWidth * 0.02),
                                    child: Center(
                                      child: Checkbox(
                                          value:
                                              //value,
                                              //
                                              provider.indeX[i],
                                          //
                                          onChanged: (value) {
                                            setState(() {
                                              // this.value = value!;
                                              //
                                              provider.indeX[i] = value!;
                                              if (value == true) {
                                                print(provider.medList.data
                                                    .data[i].medicineName);
                                              }
                                              //
                                            });
                                          }),
                                    ),
                                  )),

                                  //
                                  TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(screenWidth * 0.02),
                                    child: Center(
                                        child: Text(
                                      "${i + 1}",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.04),
                                    )),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(screenWidth * 0.02),
                                    child: Text(
                                        provider
                                            .medList.data.data[i].medicineName,
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.04)),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(screenWidth * 0.02),
                                    child: Text(
                                        provider.medList.data.data[i]
                                            .beforeOrAfterMeal,
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.04)),
                                  )),
                                  if (provider.medList.data.data[i]
                                          .medicineStatus ==
                                      'continue')
                                    TableCell(
                                        child: Padding(
                                            padding: EdgeInsets.all(
                                                screenWidth * 0.02),
                                            child: Switch(
                                                value: true,
                                                onChanged: (value) async {
                                                  await Provider.of<
                                                              MedicineStatusService>(
                                                          context,
                                                          listen: false)
                                                      .medicineStatus(
                                                          provider.medList.data
                                                              .data[i].id
                                                              .toString(),
                                                          context);

                                                  setState(() {
                                                    _continue = value;
                                                    print('click CC');
                                                    print(_continue);
                                                  });
                                                })
                                            // Text('cont',
                                            //     style: TextStyle(
                                            //         fontSize: screenWidth * 0.04)),
                                            ))
                                  else
                                    TableCell(
                                        child: Padding(
                                            padding: EdgeInsets.all(
                                                screenWidth * 0.02),
                                            child: Switch(
                                                value: false,
                                                onChanged: (value) async {
                                                  await Provider.of<
                                                              MedicineStatusService>(
                                                          context,
                                                          listen: false)
                                                      .medicineStatus(
                                                          provider.medList.data
                                                              .data[i].id
                                                              .toString(),
                                                          context);
                                                  setState(() {
                                                    _continue = value;
                                                    print('click DD');
                                                    print(_continue);
                                                  });
                                                })
                                            // Text('disc',
                                            //     style: TextStyle(
                                            //         fontSize:
                                            //             screenWidth * 0.04)),
                                            ))
                                ]),
                            ],
                          ),
                          SizedBox(
                            height: screenWidth * 0.07,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    primary: allColor.elevatedBtnColor),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddNewMedicine()));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.05,
                                      top: screenWidth * 0.02,
                                      bottom: screenWidth * 0.02,
                                      right: screenWidth * 0.05),
                                  child: Text('Add new medicine',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                      )),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: screenWidth * 0.07,
                          ),
                          InkWell(
                            onTap: () async {
                              medicineList = [];
                              print(provider.indeX);
                              for (int i = 0; i < provider.indeX.length; i++) {
                                if (provider.indeX[i] == true) {
                                  medicineList.add(provider
                                      .medList.data.data[i].medicineName);
                                  // print(provider
                                  //     .medList.data.data[i].medicineName);

                                  // if (medicineList.length > 2) {
                                  //   print('>2');
                                  //   print(medicineList);
                                  // }
                                }
                              }
                              //

                              // _medicineList = ['Heparin', 'warfarin'];
                              // print(_medicineList);
                              if (medicineList.length > 2 ||
                                  medicineList.isEmpty) {
                                OthersHelper().showToast(
                                    "Select any two", allColor.redColor);
                              } else {
                                // print(medicineList[0]);
                                // print(medicineList[1]);
                                await Provider.of<DrugInteractionService>(
                                        context,
                                        listen: false)
                                    .fetchDrugInteraction(
                                        medicineList[0], medicineList[1]);

                                _showDrugInteraction();
                              }
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: allColor.backGroundColor,
                                    borderRadius: BorderRadius.circular(6)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.10,
                                    vertical: screenWidth * 0.04),
                                child:
                                    // provider.isloading == false
                                    //     ?
                                    Text(
                                  "Drug interaction",
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.05,
                                      color: Colors.white),
                                )
                                // : SizedBox(
                                //     height: 23,
                                //     child:
                                //         OthersHelper().spinner(Colors.white)),
                                ),
                          )
                          //
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
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(30)),
            //         primary: allColor.elevatedBtnColor),
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => AddNewMedicine()));
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
            //     ),
            //     ),
          ],
        ),
      ),
    ));
  }
}
