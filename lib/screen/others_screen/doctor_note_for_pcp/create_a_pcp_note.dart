import 'package:design/helper/others_helper.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/doctor_note_for_pcp/doctor_note_for_pcp.dart';
import 'package:design/screen/others_screen/medicine/new_medicine_list.dart';
import 'package:design/screen/others_screen/order_lab/order_labs.dart';
import 'package:design/screen/others_screen/specialist_assessment/special_assessment.dart';
import 'package:design/services/doctor_note_for_pcp_service.dart/doctor_note_create_service.dart';
import 'package:design/services/doctor_note_for_pcp_service.dart/given_pcp_note_list_serice.dart';
import 'package:design/services/doctor_note_for_pcp_service.dart/update_pcp_note_service.dart';
import 'package:design/services/specialist_assessment_service/assessment_create_service.dart';
import 'package:design/services/specialist_assessment_service/assessment_update_service.dart';
import 'package:design/services/specialist_assessment_service/given_assessment_list_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateAPcpNote extends StatefulWidget {
  const CreateAPcpNote({Key? key}) : super(key: key);
  static const routeName = 'create a pcp note';

  @override
  _CreateAPcpNoteState createState() => _CreateAPcpNoteState();
}

class _CreateAPcpNoteState extends State<CreateAPcpNote> {
  TextEditingController _noteController = TextEditingController();
  var _isLoading = false;
  var _isInit = true;
  var update = false;
  String? note = "";
  String? updateId;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      final testId = ModalRoute.of(context)!.settings.arguments;
      print(testId);
      if (testId != null) {
        update = true;
        final givenassessmentlist =
            Provider.of<GivenPcpNoteListService>(context, listen: false)
                .givenpcpnotelist;
        //   testName = giventestlist.data[testId].testName;
        note = givenassessmentlist.data[testId].note;
        _noteController = TextEditingController(text: note);

        print(note);
        updateId = givenassessmentlist.data[testId].id.toString();
        print(updateId);
      } else {
        _noteController = TextEditingController(text: null);
      }
    }
    _isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

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
              SizedBox(height: screenWidth * 0.15),
              Text(
                // 'Write Pcp Note',
                update ? 'Update Pcp Note' : 'Write Pcp Note',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Divider(),
              SizedBox(height: screenWidth * 0.07),
              Container(
                width: screenWidth,
                child: TextFormField(
                  controller: _noteController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Write here",
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
              SizedBox(height: screenWidth * 0.15),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      primary: const Color(0xffb3d9ef)),
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    if (_noteController.text.isNotEmpty) {
                      ///////Store or Update API ==========>>>>>>
                      update
                          ? await Provider.of<UpdatePcpNoteService>(context,
                                  listen: false)
                              .updatePcpnote(
                                  updateId!, _noteController.text, context)
                              .then((value) => setState(() {
                                    _isLoading = false;
                                  }))
                          : await Provider.of<DoctorNoteCreateService>(context,
                                  listen: false)
                              .doctorNoteCreate(_noteController.text, context)
                              .then((value) => setState(() {
                                    _isLoading = false;
                                  }));
                    } else {
                      OthersHelper().showToast(
                          "Provide Proper Data!", allColor.backGroundColor);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.02,
                      top: screenWidth * 0.02,
                      bottom: screenWidth * 0.02,
                      right: screenWidth * 0.02,
                    ),
                    child:
                        //  _isLoading
                        //     ? OthersHelper().spinner(Colors.white)
                        //     :
                        Text(update ? 'Update' : 'Submit',
                            style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                color: Colors.black)),
                  )),
              // Container(
              //   child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //           primary: allColor.backGroundColor),
              //       onPressed: () async {
              //         setState(() {
              //           _isLoading = true;
              //         });
              //         if (_noteController.text.isNotEmpty) {
              //           await Provider.of<AssessmentCreateService>(context,
              //                   listen: false)
              //               .createAssessment(_noteController.text, context);
              //           setState(() {
              //             _isLoading = false;
              //           });
              //         } else {
              //           setState(() {
              //             _isLoading = false;
              //           });
              //           OthersHelper().showToast(
              //               "Provide Proper Data!", allColor.backGroundColor);
              //         }
              //       },
              //       child: _isLoading
              //           ? SizedBox(
              //               height: screenWidth * 0.20,
              //               child: OthersHelper().spinner(Colors.white))
              //           : const Text('Create')),
              // )
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DoctorNoteForPcp()));
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
            // Spacer(),
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(30)),
            //         primary: allColor.elevatedBtnColor),
            //     onPressed: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => MedicineList()));
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
            //     )),
          ],
        ),
      ),

      // Padding(
      //   padding:  EdgeInsets.all(screenWidth*0.10),
      //   child: Row(
      //     children: [
      //       ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(30)
      //               ),
      //               primary: Colors.blue
      //           ),
      //           onPressed: (){
      //             Navigator.pop(context);
      //           },
      //           child:
      //           Padding(
      //             padding:  EdgeInsets.only(left: screenWidth*0.05, top: screenWidth*0.02,
      //                 bottom: screenWidth*0.02, right: screenWidth*0.05),
      //             child: Text('Back', style: TextStyle(fontSize: screenWidth*0.04,)),
      //           )
      //       ),
      //       Spacer(),
      //       ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(30)
      //               ),
      //               primary: allColor.elevatedBtnColor
      //           ),
      //           onPressed: (){
      //              Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderLabs()));
      //           },
      //           child:
      //           Padding(
      //             padding:  EdgeInsets.only(left: screenWidth*0.05, top: screenWidth*0.02,
      //                 bottom: screenWidth*0.02, right: screenWidth*0.05),
      //             child: Text('Next', style: TextStyle(fontSize: screenWidth*0.04,)),
      //           )
      //       ),
      //     ],
      //   ),
      // ),
    ));
  }
}
