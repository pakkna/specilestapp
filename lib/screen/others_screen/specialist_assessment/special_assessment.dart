// import 'package:design/screen/get_started.dart';
// import 'package:design/screen/others_screen/call_the_patient.dart';
// import 'package:design/screen/others_screen/specialist_assessment/assessment_widgets/given_assessment_list.dart';
// import 'package:design/screen/others_screen/specialist_assessment/create_a_assessment.dart';
// import 'package:design/services/specialist_assessment_service/given_assessment_list_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/specialist_assessment_service/given_assessment_list_service.dart';
import '../../get_started.dart';
import '../../patient/patient_helper.dart';
import '../call_the_patient.dart';
import 'assessment_widgets/given_assessment_list.dart';
import 'create_a_assessment.dart';

class SpecialistAssessmentN extends StatefulWidget {
  const SpecialistAssessmentN({Key? key}) : super(key: key);

  @override
  State<SpecialistAssessmentN> createState() => _SpecialistAssessmentN();
}

class _SpecialistAssessmentN extends State<SpecialistAssessmentN> {
  @override
  void initState() {
    Provider.of<GivenAssessmentListService>(context, listen: false)
        .fetchGivenAssessmentList();
    // TODO: implement initState
    super.initState();
  }

  @override
  // void didChangeDependencies() {
  //   Provider.of<GivenTestListService>(context, listen: false)
  //       .fetchGivenTestList();
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }

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
                      child: const Text("Specialist Assessment")),
                  const Spacer(),
                  Container(
                      height: screenHeight * 0.07,
                      child: Image.asset("assets/images/k.jpeg")),
                ],
              ),
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
              //   const Spacer(),
              //   Container(
              //     height: screenHeight * 0.08,
              //     child:
              //         const Image(image: AssetImage("assets/images/men.png")),
              //   )
              // ]),
              SizedBox(height: screenWidth * 0.10),
              const Text(
                'Specialist Assessment List',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenWidth * 0.05),
              SizedBox(
                //  height: screenHeight * 0.65,
                height: screenHeight * 0.58,
                child: const GivenAssessmentList(),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateAAssessment()));
          //  Navigator.of(context).pushNamed(GiveATest.routeName, arguments: '');
        },
        child: const Icon(Icons.add),
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
                          builder: (context) => const CallThePatient()));
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
