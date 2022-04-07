import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/lab_report.dart';
import 'package:design/screen/others_screen/special_assessment.dart';
import 'package:flutter/material.dart';
class Provitional extends StatefulWidget {
  const Provitional({Key? key}) : super(key: key);

  @override
  _ProvitionalState createState() => _ProvitionalState();
}
List<String>abcdList=[
  "A",
  "B",
  "C",
];
List<String> rules=[];
String ? initValRules;
String ? initVal;
class _ProvitionalState extends State<Provitional> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight*0.02,),
                  Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: allColor.backGroundColor),
                          onPressed: (){},
                          child: Text("Provisional Diagnosis")),
                      Spacer(),
                      Container(
                          height: screenHeight*0.07,
                          child:Image.asset("assets/images/k.jpeg"))]),
                  SizedBox(height: screenWidth*0.05,),
                  Row(children: [
                    Text("Javed Ahmad M/46", style: TextStyle(fontSize: screenWidth*0.06,
                        fontWeight: FontWeight.bold)),
                    Spacer(),
                    Container(
                      height: screenHeight*0.08,
                      child: Image(image: AssetImage("assets/images/men.png")),
                    )]),
                  SizedBox(height: screenWidth*0.15),
                  Text("Current medical diagnosis \nwill appear here",
                      style: TextStyle(fontSize: screenWidth*0.05)),
                  SizedBox(height: screenHeight*0.05,),
                  Row(
                      children: [
                        Flexible(
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: " Write Diagnosis",
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.black12)),
                                    focusColor: Colors.black12,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black12),
                                        borderRadius: BorderRadius.circular(10))))),
                        SizedBox(width: screenWidth*0.02,),
                        Container(
                          height: screenHeight*0.07,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(
                                  color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: DropdownButton(
                                iconDisabledColor: Colors.white,
                                iconEnabledColor: Colors.white,
                                hint: Text('Diagnosis', style: TextStyle(color: Colors.white)),
                                items: rules.map((val) => DropdownMenuItem(
                                    value: val,
                                    child: Text(val))).toList(),
                                onChanged: (newVal){
                                  setState(() {
                                    initValRules=newVal.toString();
                                  });
                                }),
                          ),
                        )

                      ]),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SpecialistAssessment()));
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
