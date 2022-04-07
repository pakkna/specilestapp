import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/medical_history.dart';
import 'package:design/screen/patient_datas/review_vitals.dart';
import 'package:flutter/material.dart';

class PcpNextPage extends StatefulWidget {
  const PcpNextPage({Key? key}) : super(key: key);

  @override
  _PcpNextPageState createState() => _PcpNextPageState();
}

class _PcpNextPageState extends State<PcpNextPage> {
  @override
  Widget build(BuildContext context) {
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
                      child: Text("Write Notes to PCP")),
                  Spacer(),
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
                Spacer(),
                Container(
                  height: screenHeight * 0.08,
                  child: Image(image: AssetImage("assets/images/men.png")),
                )
              ]),
              SizedBox(height: screenWidth * 0.05),
              Container(
                color: Color(0xffe2eaf5),
                height: screenHeight * 0.06,
                width: screenWidth,
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  child: Text("Write Notes to PCP",
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                      )),
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffdcebf1),
                    borderRadius: BorderRadius.circular(10)),
                width: screenWidth,
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  child: Text(
                      "Example: The patient has the symptoms of ….. And has done"
                      " some of the lab works on …. Has signs of …."
                      "I recommend followinglabs/ investigations …."
                      "Also is taking same group of"
                      "drugs twice and"
                      "drugs twice and"
                      "drugs twice and"
                      "drugs twice and"
                      "drugs twice and"
                      "drugs twice and"
                      "drugs twice and"
                      "drugs twice and"
                      "drugs twice and"
                      "drugs twice and"
                      "drugs twice and"
                      "drugs twice and"
                      "drugs twice and"
                      "drugs twice and"
                      "),",
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                      )),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Medical()));
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
