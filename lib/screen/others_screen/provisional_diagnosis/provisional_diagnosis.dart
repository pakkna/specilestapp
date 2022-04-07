// import 'package:design/screen/get_started.dart';
// import 'package:design/screen/others_screen/provisional_diagnosis/give_a_diagnosis.dart';
// import 'package:design/screen/others_screen/provisional_diagnosis/p_d_widgets/given_diagnosis_list.dart';
// import 'package:design/screen/others_screen/specialist_assessment/special_assessment.dart';
// import 'package:design/services/provisinal_diagnosis_services/diagnosis_list_by_patient_id_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/provisinal_diagnosis_services/diagnosis_list_by_patient_id_service.dart';
import '../../get_started.dart';
import '../../patient/patient_helper.dart';
import '../specialist_assessment/special_assessment.dart';
import 'give_a_diagnosis.dart';
import 'p_d_widgets/given_diagnosis_list.dart';

class ProvitionalDiagnosis extends StatefulWidget {
  const ProvitionalDiagnosis({Key? key}) : super(key: key);

  @override
  State<ProvitionalDiagnosis> createState() => _ProvitionalDiagnosis();
}

class _ProvitionalDiagnosis extends State<ProvitionalDiagnosis> {
  @override
  void initState() {
    Provider.of<DiagnosisListByPatientIdService>(context, listen: false)
        .diagnosisListByPatientId();
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
                'Given Diagnosis List',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenWidth * 0.05),
              SizedBox(
                // height: screenHeight * 0.65,
                height: screenHeight * 0.58,
                child: const GivenDiagnosisList(),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const GiveADiagnosis()));
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
                          builder: (context) => const SpecialistAssessmentN()));
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
