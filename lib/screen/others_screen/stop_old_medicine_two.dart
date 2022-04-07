import 'package:design/screen/get_started.dart';
import 'package:flutter/material.dart';
class StopOldMedicineTwo extends StatefulWidget {
  const StopOldMedicineTwo({Key? key}) : super(key: key);

  @override
  _StopOldMedicineTwoState createState() => _StopOldMedicineTwoState();
}

class _StopOldMedicineTwoState extends State<StopOldMedicineTwo> {
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
                          child: Text("Medicine List")),
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
                      child: Image(image: AssetImage("assets/images/men.png")))]),
                  SizedBox(height: screenWidth*0.85),
                  Padding(padding:  EdgeInsets.all(screenWidth*0.02),
                    child: Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                primary: allColor.elevatedBtnColor),
                            onPressed: (){},
                            child: Padding(
                              padding:  EdgeInsets.only(left: screenWidth*0.02, top: screenWidth*0.02,
                                  bottom: screenWidth*0.02, right: screenWidth*0.02),
                              child: Text('Continue', style: TextStyle(fontSize: screenWidth*0.04,color: Colors.white)))),
                        Spacer(),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                primary: Color(0xfffae5dd)),
                            onPressed: (){},
                            child: Padding(
                              padding:  EdgeInsets.only(left: screenWidth*0.02, top: screenWidth*0.02,
                                  bottom: screenWidth*0.02, right: screenWidth*0.02),
                              child: Text('Discontinue', style: TextStyle(fontSize: screenWidth*0.04, color: Colors.black)))),
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
                            borderRadius: BorderRadius.circular(30)),
                        primary: Colors.blue),
                    onPressed: (){Navigator.pop(context);},
                    child:
                    Padding(
                      padding:  EdgeInsets.only(left: screenWidth*0.05, top: screenWidth*0.02,
                          bottom: screenWidth*0.02, right: screenWidth*0.05),
                      child: Text('Back', style: TextStyle(fontSize: screenWidth*0.04)))),
                Spacer(),
              ],
            ),
          ),
        )
    );
  }
}
