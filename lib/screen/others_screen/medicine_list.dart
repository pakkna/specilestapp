import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/drug_interaction.dart';
import 'package:design/screen/others_screen/stop_old_medicine.dart';
import 'package:design/services/medicine_list_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/others_helper.dart';
import '../patient/patient_helper.dart';

class MedicineList extends StatefulWidget {
  const MedicineList({Key? key}) : super(key: key);

  @override
  _MedicineListState createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<MedicineListService>(context, listen: false).fetchMedList();
  }

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
                                  child: const Text("Medicine List")),
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
                              1: FlexColumnWidth(2),
                            },
                            border: TableBorder.all(color: Colors.grey),
                            children: [
                              TableRow(children: [
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
                                // TableCell(
                                //     child: Padding(
                                //   padding: EdgeInsets.all(screenWidth * 0.02),
                                //   child: Text(
                                //     'Frequency',
                                //     style: TextStyle(
                                //         fontSize: screenWidth * 0.04,
                                //         fontWeight: FontWeight.bold),
                                //   ),
                                // )),
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.02),
                                  child: Text('Before/After Meal',
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
                                  // TableCell(
                                  //     child: Padding(
                                  //   padding: EdgeInsets.all(screenWidth * 0.02),
                                  //   child: Text('OD',
                                  //       style: TextStyle(fontSize: screenWidth * 0.04)),
                                  // )),
                                  TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(screenWidth * 0.02),
                                    child: Text(
                                        provider.medList.data.data[i]
                                            .beforeOrAfterMeal,
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.04)),
                                  )),
                                ]),
                            ],
                          ),
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
        padding: EdgeInsets.all(screenWidth * 0.10),
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
                )),
          ],
        ),
      ),
    ));
  }
}
