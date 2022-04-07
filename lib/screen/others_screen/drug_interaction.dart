import 'package:design/screen/others_screen/call_the_patient.dart';
import 'package:design/screen/others_screen/medicine/stop_old_medicine.dart';
import 'package:design/services/medicine_service/drug_interaction_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/others_helper.dart';
import '../get_started.dart';

class DrugInteraction extends StatefulWidget {
  const DrugInteraction({Key? key}) : super(key: key);

  @override
  _DrugInteractionState createState() => _DrugInteractionState();
}

class _DrugInteractionState extends State<DrugInteraction> {
  TextEditingController medNameControllerOne = TextEditingController();
  TextEditingController medNameControllerTwo = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Consumer<DrugInteractionService>(
          builder: (context, provider, child) => Column(
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Row(children: [
                  Text(
                    "KAMBAII",
                    style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  const Spacer(),
                  Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.02),
                      child: SizedBox(
                          height: screenHeight * 0.07,
                          child: Image.asset("assets/images/k.jpeg")))
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.03,
                    right: screenWidth * 0.03,
                    top: screenWidth * 0.02),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          child: TextFormField(
                            controller: medNameControllerOne,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                                focusColor: Colors.blueGrey,
                                hoverColor: Colors.blueGrey,
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey),
                                ),
                                hintText: "Medicine name"),
                          ),
                          height: 50,
                          color: Colors.white),
                    ),

                    //Second input field ===============>
                    const SizedBox(width: 15),

                    Expanded(
                      child: Container(
                          child: TextFormField(
                            controller: medNameControllerTwo,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                                focusColor: Colors.blueGrey,
                                hoverColor: Colors.blueGrey,
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey),
                                ),
                                hintText: "Medicine name"),
                          ),
                          height: 50,
                          color: Colors.white),
                    ),

                    //Search button ================>
                    const SizedBox(width: 10),
                    Container(
                      child: InkWell(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            // Provider.of<DrugInteractionService>(context,
                            //         listen: false)
                            //     .fetchDrugInteraction(medNameControllerOne.text,
                            //         medNameControllerTwo.text);
                          },
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                      height: 50,
                      width: 50,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              provider.isloading != true
                  ? provider.drugInteractionData != null
                      ? provider.drugInteractionData != "error"
                          ? Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              margin: const EdgeInsets.only(top: 40),
                              child: Column(children: [
                                Text(
                                    provider.isDataExist == true
                                        ? provider.drugInteractionData['data']
                                            ['data']['nlmDisclaimer']
                                        : " ",
                                    style: const TextStyle(height: 1.3)),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  provider.isDataExist == true
                                      ? provider.drugInteractionData['data']
                                                  ['data']
                                              ['fullInteractionTypeGroup'][0]
                                          ['fullInteractionType'][0]['comment']
                                      : " ",
                                  style: const TextStyle(height: 1.3),
                                )
                              ]),
                            )
                          : Container(
                              height: screenHeight - 180,
                              alignment: Alignment.center,
                              child: const Text("Something went wrong"))
                      : Container()
                  : Container(
                      height: screenHeight - 180,
                      alignment: Alignment.center,
                      child: OthersHelper().spinner(allColor.backGroundColor),
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
                          builder: (context) => CallThePatient()));
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
