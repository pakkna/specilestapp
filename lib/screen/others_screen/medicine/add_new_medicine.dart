// import 'package:design/helper/others_helper.dart';
// import 'package:design/screen/get_started.dart';
// import 'package:design/screen/others_screen/medicine/new_medicine_list.dart';
// import 'package:design/services/medicine_service/medicine_entry_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helper/others_helper.dart';
import '../../../services/medicine_service/medicine_entry_service.dart';
import '../../get_started.dart';
import '../../patient/patient_helper.dart';
import 'new_medicine_list.dart';

class AddNewMedicine extends StatefulWidget {
  const AddNewMedicine({Key? key}) : super(key: key);

  @override
  _AddNewMedicineState createState() => _AddNewMedicineState();
}

TextEditingController _medicineNameController = TextEditingController();
TextEditingController _howManyDaysController = TextEditingController();
TextEditingController _measurementUnitController = TextEditingController();
TextEditingController _measurementController = TextEditingController();
TextEditingController _genericNameController = TextEditingController();

List<String> medicineType = ['Capsule', 'Tablet', 'Syrap', 'Injection'];
// List<String> medicineMeasurement = ['40', '50', '100', '250', '500'];
// List<String> medicineMeasurementUnit = ['mgm', 'gm', 'mi', 'chamoch'];
String? initMedicineType;
//String? initMedicineMeasurement;
//String? initMedicineMeasurementUnit;

bool _morning = false;
bool _afternoon = false;
bool _night = false;
String? morningYesNo = 'no';
String? afternoonYesNo = 'no';
String? nightYesNo = 'no';

int? _beforeAfterAny;
String? beforeAfterAny;

var isLoading = false;

class _AddNewMedicineState extends State<AddNewMedicine> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Row(children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: allColor.backGroundColor),
                    onPressed: () {},
                    child: const Text("Add New Medicine")),
                Spacer(),
                Container(
                    height: screenHeight * 0.07,
                    child: Image.asset("assets/images/k.jpeg"))
              ]),
              SizedBox(
                height: screenWidth * 0.05,
              ),
              //User name and profile image
              PatientHelper().nameAndImage(),

              // Row(children: [
              //   Text("Javed Ahmad M/46",
              //       style: TextStyle(
              //           fontSize: screenWidth * 0.06,
              //           fontWeight: FontWeight.bold)),
              //   Spacer(),
              //   Container(
              //       height: screenHeight * 0.08,
              //       child: Image(image: AssetImage("assets/images/men.png")))
              // ]),
              SizedBox(height: screenWidth * 0.10),
              const Divider(),
              Text("Add new medicine",
                  style: TextStyle(fontSize: screenWidth * 0.05)),
              SizedBox(height: screenWidth * 0.05),
              Container(
                height: screenHeight * 0.05,
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: _medicineNameController,
                        decoration: InputDecoration(
                          hintText: "Medicine Name",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black12)),
                          focusColor: Colors.black12,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    //  SizedBox(width: screenWidth * 0.01),
                    // Container(
                    //   height: screenHeight * 0.07,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.grey),
                    //       borderRadius: BorderRadius.circular(10)),
                    //   child: Center(
                    //     child: Padding(
                    //       padding: EdgeInsets.all(8.0),
                    //       child: DropdownButton(
                    //           iconSize: 30,
                    //           iconDisabledColor: Colors.black,
                    //           iconEnabledColor: Colors.black,
                    //           hint: Text('',
                    //               style: TextStyle(color: Colors.white)),
                    //           items: rules
                    //               .map((val) => DropdownMenuItem(
                    //                   value: val, child: Text(val)))
                    //               .toList(),
                    //           onChanged: (newVal) {
                    //             setState(() {
                    //               initValRules = newVal.toString();
                    //             });
                    //           }),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              Container(
                height: screenHeight * 0.05,
                child: Row(
                  children: [
                    Flexible(
                        child: TextFormField(
                            controller: _genericNameController,
                            decoration: InputDecoration(
                                hintText: "Generic Name",
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.black12)),
                                focusColor: Colors.black12,
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10))))),
                  ],
                ),
              ),
              // Flexible(
              //   child: TextFormField(
              //     controller: _genericNameController,
              //     decoration: InputDecoration(
              //       hintText: "Generic Name",
              //       focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(color: Colors.black12)),
              //       focusColor: Colors.black12,
              //       border: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.black12),
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: screenWidth * 0.05),
              Container(
                height: screenHeight * 0.05,
                child: Row(
                  children: [
                    const Flexible(
                      child: Text(
                        'Medicine Type',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     hintText: "Medicine Type",
                      //     focusedBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //         borderSide: BorderSide(color: Colors.black12)),
                      //     focusColor: Colors.black12,
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.black12),
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      // ),
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Container(
                      height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: DropdownButton(
                              iconSize: 30,
                              iconDisabledColor: Colors.black,
                              iconEnabledColor: Colors.black,
                              hint: Text('',
                                  style: TextStyle(color: Colors.white)),
                              value: initMedicineType,
                              items: medicineType
                                  .map((val) => DropdownMenuItem(
                                      value: val, child: Text(val)))
                                  .toList(),
                              onChanged: (newVal) {
                                setState(() {
                                  initMedicineType = newVal.toString();
                                });
                              }),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              Container(
                height: screenHeight * 0.05,
                child: Row(
                  children: [
                    const Flexible(
                      child: Text(
                        'Masurement',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Flexible(
                      child: TextFormField(
                        // textAlign: TextAlign.center,
                        controller: _measurementController,
                        decoration: InputDecoration(
                          hintText: "50,100...",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black12)),
                          focusColor: Colors.black12,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   height: screenHeight * 0.07,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.grey),
                    //       borderRadius: BorderRadius.circular(10)),
                    //   child: Center(
                    //     child: Padding(
                    //       padding: EdgeInsets.all(8.0),
                    //       child: DropdownButton(
                    //           iconSize: 30,
                    //           iconDisabledColor: Colors.black,
                    //           iconEnabledColor: Colors.black,
                    //           // hint: Text('',
                    //           //     style: TextStyle(color: Colors.white)),
                    //           value: initMedicineMeasurement,
                    //           items: medicineMeasurement
                    //               .map((val) => DropdownMenuItem(
                    //                   value: val, child: Text(val)))
                    //               .toList(),
                    //           onChanged: (newVal) {
                    //             setState(() {
                    //               initMedicineMeasurement = newVal.toString();
                    //             });
                    //           }),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(width: screenWidth * 0.01),
                    Text(
                      'Unit',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Flexible(
                      child: TextFormField(
                        // textAlign: TextAlign.center,
                        controller: _measurementUnitController,
                        decoration: InputDecoration(
                          hintText: "gm,mi..",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black12)),
                          focusColor: Colors.black12,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   height: screenHeight * 0.07,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.grey),
                    //       borderRadius: BorderRadius.circular(10)),
                    //   child: Center(
                    //     child: Padding(
                    //       padding: EdgeInsets.all(8.0),
                    //       child: DropdownButton(
                    //           iconSize: 30,
                    //           iconDisabledColor: Colors.black,
                    //           iconEnabledColor: Colors.black,
                    //           // hint: Text('',
                    //           //     style: TextStyle(color: Colors.white)),
                    //           value: initMedicineMeasurementUnit,
                    //           items: medicineMeasurementUnit
                    //               .map((val) => DropdownMenuItem(
                    //                   value: val, child: Text(val)))
                    //               .toList(),
                    //           onChanged: (newVal) {
                    //             setState(() {
                    //               initMedicineMeasurementUnit =
                    //                   newVal.toString();
                    //             });
                    //           }),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              const Text(
                'Select time :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      _morning = !_morning;

                      if (_morning) {
                        morningYesNo = 'yes';
                        print(morningYesNo);
                      } else {
                        morningYesNo = 'no';
                        print(morningYesNo);
                      }
                    }),
                    child: Row(children: [
                      Radio(
                        value: true,
                        groupValue: _morning,
                        onChanged: (value) {
                          setState(() {
                            _morning = !_morning;

                            if (_morning) {
                              morningYesNo = 'yes';
                            } else {
                              morningYesNo = 'no';
                            }
                          });
                        },
                      ),
                      Text('Morning'),
                    ]),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      _afternoon = !_afternoon;

                      if (_afternoon) {
                        afternoonYesNo = 'yes';
                      } else {
                        afternoonYesNo = 'no';
                      }
                    }),
                    child: Row(children: [
                      Radio(
                          value: true,
                          groupValue: _afternoon,
                          onChanged: (_) {
                            setState(() {
                              _afternoon = !_afternoon;

                              if (_morning) {
                                afternoonYesNo = 'yes';
                              } else {
                                afternoonYesNo = 'no';
                              }
                            });
                          }),
                      Text('Afternoon'),
                    ]),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      _night = !_night;

                      if (_night) {
                        nightYesNo = 'yes';
                      } else {
                        nightYesNo = 'no';
                      }
                    }),
                    child: Row(children: [
                      Radio(
                          value: true,
                          groupValue: _night,
                          onChanged: (_) {
                            setState(() {
                              _night = !_night;

                              if (_night) {
                                nightYesNo = 'yes';
                              } else {
                                nightYesNo = 'no';
                              }
                            });
                          }),
                      Text('Night'),
                    ]),
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.05),
              Container(
                height: screenHeight * 0.05,
                child: Row(
                  children: [
                    Flexible(
                        child: TextFormField(
                            controller: _howManyDaysController,
                            decoration: InputDecoration(
                                hintText: "How many days",
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.black12)),
                                focusColor: Colors.black12,
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10))))),
                  ],
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              const Text(
                'Before or after meal :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () => setState(() {
                  _beforeAfterAny = 1;
                  beforeAfterAny = 'before';
                }),
                child: Row(
                  children: [
                    Row(children: [
                      Radio(
                          value: 1,
                          groupValue: _beforeAfterAny,
                          onChanged: (_) {
                            setState(() {
                              _beforeAfterAny = 1;
                              beforeAfterAny = 'before';
                            });
                          }),
                      const Text('Before'),
                    ]),
                    InkWell(
                      onTap: () => setState(() {
                        _beforeAfterAny = 2;
                        beforeAfterAny = 'after';
                      }),
                      child: Row(children: [
                        Radio(
                            value: 2,
                            groupValue: _beforeAfterAny,
                            onChanged: (_) {
                              setState(() {
                                _beforeAfterAny = 2;
                                beforeAfterAny = 'after';
                              });
                            }),
                        const Text('After'),
                      ]),
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        _beforeAfterAny = 3;
                        beforeAfterAny = 'any time';
                      }),
                      child: Row(children: [
                        Radio(
                            value: 3,
                            groupValue: _beforeAfterAny,
                            onChanged: (_) {
                              setState(() {
                                _beforeAfterAny = 3;
                                beforeAfterAny = 'any time';
                              });
                            }),
                        const Text('Any time'),
                      ]),
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: screenWidth * 0.1),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: allColor.backGroundColor),
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    // print(_medicineNameController.text);
                    // print(initMedicineType);
                    // print(initMedicineMeasurement);
                    // print(initMedicineMeasurementUnit);
                    // print(morningYesNo);
                    // print(afternoonYesNo);
                    // print(nightYesNo);
                    // print(_howManyDaysController.text);
                    // print(beforeAfterAny);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Prescription()));
                    if (_medicineNameController.text.isNotEmpty &&
                        initMedicineType!.isNotEmpty &&
                        //  initMedicineMeasurement!.isNotEmpty
                        _measurementController.text.isNotEmpty &&
                        _measurementUnitController.text.isNotEmpty &&
                        (morningYesNo!.isNotEmpty ||
                            afternoonYesNo!.isNotEmpty ||
                            nightYesNo!.isNotEmpty) &&
                        _howManyDaysController.text.isNotEmpty &&
                        beforeAfterAny!.isNotEmpty) {
                      await Provider.of<MedicineEntryService>(context,
                              listen: false)
                          .medicineEntry(
                            medicineName: _medicineNameController.text,
                            genericName: _genericNameController.text,
                            type: initMedicineType!,
                            measurement: _measurementController.text
                            // initMedicineMeasurement!
                            ,
                            measurementUnit: _measurementUnitController.text,
                            morning: morningYesNo!,
                            afternoon: afternoonYesNo!,
                            night: nightYesNo!,
                            howManyDays: _howManyDaysController.text,
                            beforeOrAfterMeal: beforeAfterAny!,
                            context: context,
                          )
                          .then((value) => setState(() {
                                isLoading = false;
                              }));
                    } else {
                      OthersHelper().showToast(
                          "Provide Proper Data", allColor.backGroundColor);
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text("Add Medicine"),
                ),
              ),
            ],
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
                          builder: (context) => const NewMedicineList()));
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
    ));
  }
}
