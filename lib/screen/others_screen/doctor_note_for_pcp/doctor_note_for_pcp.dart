import '/screen/get_started.dart';
import '/screen/others_screen/doctor_note_for_pcp/create_a_pcp_note.dart';
import '/screen/others_screen/doctor_note_for_pcp/pcp_widgets/given_pcp_list.dart';
import '/screen/others_screen/medical_history.dart';
import '/screen/patient/patient_helper.dart';
import '/services/doctor_note_for_pcp_service.dart/given_pcp_note_list_serice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorNoteForPcp extends StatefulWidget {
  const DoctorNoteForPcp({Key? key}) : super(key: key);

  @override
  State<DoctorNoteForPcp> createState() => _DoctorNoteForPcp();
}

class _DoctorNoteForPcp extends State<DoctorNoteForPcp> {
  @override
  void initState() {
    Provider.of<GivenPcpNoteListService>(context, listen: false)
        .fetchGivenPcpNoteList();
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
                      child: const Text("Write Notes to PCP")),
                  const Spacer(),
                  Container(
                      height: screenHeight * 0.07,
                      child: Image.asset("assets/images/k.jpeg")),
                ],
              ),
              SizedBox(
                height: screenWidth * 0.05,
              ),
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
                'Pcp Notes List',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenWidth * 0.05),
              SizedBox(
                height: screenHeight * 0.58,
                child: const GivenPcpList(),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const CreateAPcpNote()));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Medical()));
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
