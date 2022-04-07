import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/call_the_patient.dart';
import 'package:design/screen/others_screen/stop_old_medicine_two.dart';
import 'package:flutter/material.dart';

class StopOldMedicine extends StatefulWidget {
  const StopOldMedicine({Key? key}) : super(key: key);

  @override
  _StopOldMedicineState createState() => _StopOldMedicineState();
}

class _StopOldMedicineState extends State<StopOldMedicine> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight= MediaQuery.of(context).size.height;
    final double screenWidth= MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          body:
          Padding(
            padding:  EdgeInsets.all(screenWidth*0.05),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenHeight*0.02,),
                  Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: allColor.backGroundColor
                          ),
                          onPressed: (){

                          },
                          child: Text("Stop Old Medicine")),
                      Spacer(),
                      Container(
                          height: screenHeight*0.07,
                          child:Image.asset("assets/images/k.jpeg")),
                    ],
                  ),
                  SizedBox(height: screenWidth*0.05,),
                  Row(children: [
                    Text("Javed Ahmad M/46", style: TextStyle(fontSize: screenWidth*0.06,
                        fontWeight: FontWeight.bold)),
                    Spacer(),
                    Container(
                      height: screenHeight*0.08,
                      child: Image(image: AssetImage("assets/images/men.png")),
                    )]),
                  SizedBox(height: screenWidth*0.25),
                  Table(
                    columnWidths:  {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(2),
                      3: FlexColumnWidth(2),
                    },
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      TableRow(
                          children: [
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('S.No.', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.bold),),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('Name', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.bold)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('Frequency', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.bold),),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('Before/After Meal', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.bold)),
                            )),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Center(child: Text('', style: TextStyle(fontSize: screenWidth*0.04),)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Center(child: Text('', style: TextStyle(fontSize: screenWidth*0.04),)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Center(child: Text('', style: TextStyle(fontSize: screenWidth*0.04),)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Center(child: Text('', style: TextStyle(fontSize: screenWidth*0.04),)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('', style: TextStyle(fontSize: screenWidth*0.04))))])]),

                  SizedBox(height: screenWidth*0.15),

                  Padding(
                    padding:  EdgeInsets.all(screenWidth*0.02),
                    child: Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                primary: allColor.backGroundColor
                            ),
                            onPressed: (){
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>()));
                            },
                            child:
                            Padding(
                              padding:  EdgeInsets.only(left: screenWidth*0.01, top: screenWidth*0.02,
                                  bottom: screenWidth*0.02, right: screenWidth*0.01),
                              child: Text('Stop Old Medicine', style: TextStyle(fontSize: screenWidth*0.04,)),
                            )
                        ),
                        Spacer(),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                primary: Color(0xffb3d9ef)),
                            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>StopOldMedicineTwo()));},
                            child:
                            Padding(
                              padding:  EdgeInsets.only(left: screenWidth*0.02, top: screenWidth*0.02,
                                  bottom: screenWidth*0.02, right: screenWidth*0.02),
                              child: Text('Yes', style: TextStyle(fontSize: screenWidth*0.04,color: Colors.black)))),
                        Spacer(),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                primary: Color(0xfffae5dd)),
                            onPressed: (){},
                            child:
                            Padding(
                              padding:  EdgeInsets.only(left: screenWidth*0.02, top: screenWidth*0.02,
                                  bottom: screenWidth*0.02, right: screenWidth*0.02),
                              child: Text('No', style: TextStyle(fontSize: screenWidth*0.04, color: Colors.black)),
                            )
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding:  EdgeInsets.all(screenWidth*0.10),
            child: Row(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        primary: Colors.blue
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child:
                    Padding(
                      padding:  EdgeInsets.only(left: screenWidth*0.05, top: screenWidth*0.02,
                          bottom: screenWidth*0.02, right: screenWidth*0.05),
                      child: Text('Back', style: TextStyle(fontSize: screenWidth*0.04,)),
                    )
                ),
                Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        primary: allColor.elevatedBtnColor
                    ),
                    onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>CallThePatient()));
                    },
                    child:
                    Padding(
                      padding:  EdgeInsets.only(left: screenWidth*0.05, top: screenWidth*0.02,
                          bottom: screenWidth*0.02, right: screenWidth*0.05),
                      child: Text('Next', style: TextStyle(fontSize: screenWidth*0.04,)),
                    )
                ),
              ],
            ),
          ),
        )
    );
  }
}
