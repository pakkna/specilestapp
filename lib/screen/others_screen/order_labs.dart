import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/given_test_page.dart';
import 'package:design/screen/others_screen/patient_test_history.dart';
import 'package:flutter/material.dart';

class OrderLabs extends StatefulWidget {
  const OrderLabs({Key? key}) : super(key: key);

  @override
  _OrderLabsState createState() => _OrderLabsState();
}

class _OrderLabsState extends State<OrderLabs> {
  var addNewReport = false;
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4'
  ]; // DefaultTestList API
  String? selectedItem = 'Item 1';
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
                      child: const Text("Order Labs")),
                  const Spacer(),
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
                const Spacer(),
                Container(
                  height: screenHeight * 0.08,
                  child:
                      const Image(image: AssetImage("assets/images/men.png")),
                )
              ]),
              SizedBox(height: screenWidth * 0.20),
              Container(
                decoration: BoxDecoration(
                    color: allColor.homebgColor,
                    borderRadius: BorderRadius.circular(30)),
                height: screenHeight * 0.45,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: addNewReport
                      ? Column(
                          children: [
                            const Text(
                              'select a report',
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              width: 3, color: Colors.grey))),
                                  value: selectedItem,
                                  items: items
                                      .map((item) => DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                            item,
                                            style:
                                                const TextStyle(fontSize: 20),
                                          )))
                                      .toList(),
                                  onChanged: (item) {
                                    setState(() {
                                      selectedItem = item as String?;
                                    });
                                  }),
                            ),
                            const TextField(
                              decoration:
                                  InputDecoration(labelText: 'Description'),
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    primary: const Color(0xffb3d9ef)),
                                onPressed: () {
                                  //StoreOrderLabTest API
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.02,
                                      top: screenWidth * 0.02,
                                      bottom: screenWidth * 0.02,
                                      right: screenWidth * 0.02),
                                  child: Text('Submit',
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.04,
                                          color: Colors.black)),
                                )),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: double.infinity,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    primary: const Color(0xffb3d9ef)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const GivenTestPage()));
                                  //UserOrderLabTestList API
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.02,
                                      top: screenWidth * 0.02,
                                      bottom: screenWidth * 0.02,
                                      right: screenWidth * 0.02),
                                  child: Text('Given Test',
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.04,
                                          color: Colors.black)),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    primary: const Color(0xfffae5dd)),
                                onPressed: () {
                                  setState(() {
                                    addNewReport = true;
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.02,
                                      top: screenWidth * 0.02,
                                      bottom: screenWidth * 0.02,
                                      right: screenWidth * 0.02),
                                  child: Text('Give a Test',
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.04,
                                          color: Colors.black)),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    primary: const Color(0xfffae5dd)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PatientTestHistory()));
                                  // AllLabReport API
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.02,
                                      top: screenWidth * 0.02,
                                      bottom: screenWidth * 0.02,
                                      right: screenWidth * 0.02),
                                  child: Text('Patient Test History',
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.04,
                                          color: Colors.black)),
                                )),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: addNewReport
          ? Padding(
              padding: EdgeInsets.all(screenWidth * 0.10),
              child: Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          primary: Colors.blue),
                      onPressed: () {
                        setState(() {
                          addNewReport = false;
                        });
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
                      )),
                ],
              ),
            )
          : const SizedBox(
              width: 2,
            ),
    ));
  }
}
