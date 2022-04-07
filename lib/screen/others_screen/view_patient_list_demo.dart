import 'package:cached_network_image/cached_network_image.dart';
import '/screen/get_started.dart';
import '/screen/home/home_page.dart';
import '/screen/patient/patient_details.dart';
import '/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewPatientDetails extends StatefulWidget {
  const ViewPatientDetails({Key? key}) : super(key: key);

  @override
  _ViewPatientDetailsState createState() => _ViewPatientDetailsState();
}

class _ViewPatientDetailsState extends State<ViewPatientDetails> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth,
              height: screenHeight * 0.42,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(0.07), BlendMode.dstATop),
                      image: AssetImage("assets/images/clock.png"),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.all(screenHeight * 0.02),
                    child: Consumer<LoginService>(
                      builder:
                          (BuildContext context, provider, Widget? child) =>
                              Row(
                        children: [
                          SizedBox(
                            width: 65,
                            height: 65,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CachedNetworkImage(
                                imageUrl: provider.loginDetails.data.photo,
                                placeholder: (context, url) {
                                  //return Image.asset('assets/images/placeholder.png');
                                  return Image.asset('assets/images/men.png');
                                },
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                height: 65,
                                width: 65,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Container(
                          //   height: screenHeight * 0.10,
                          //   child:
                          //       Image(image: AssetImage("assets/images/men.png")),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.02),
                            child: Text(provider.loginDetails.data.name,
                                style: TextStyle(
                                    fontSize: screenWidth * 0.06,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Spacer(),
                          Container(
                              height: screenHeight * 0.07,
                              child: Image.asset("assets/images/k.jpeg")),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                            width: screenWidth,
                            child: Column(children: [
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.05),
                                  child: Text("Schedule 10 Oct 2021",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.06,
                                          fontWeight: FontWeight.bold))),
                              SizedBox(
                                height: screenHeight * 0.02,
                              ),
                              Center(
                                  child: Text("10 Patient(S)",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.05,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)))
                            ])),
                        Container(
                            width: screenWidth,
                            child: Column(children: [
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.05),
                                  child: Text("Schedule 09 Oct 2021",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.06,
                                          fontWeight: FontWeight.bold))),
                              SizedBox(
                                height: screenHeight * 0.02,
                              ),
                              Center(
                                  child: Text("5 Patient(S)",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.05,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)))
                            ])),
                        Container(
                            width: screenWidth,
                            child: Column(children: [
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.05),
                                  child: Text("Schedule 08 Oct 2021",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.06,
                                          fontWeight: FontWeight.bold))),
                              SizedBox(
                                height: screenHeight * 0.02,
                              ),
                              Center(
                                  child: Text("15 Patient(S)",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.05,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)))
                            ])),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PatientDetails()));
                        },
                        child: Container(
                          height: screenHeight * 0.08,
                          width: screenWidth * 0.20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360)),
                          child: Image.asset("assets/images/men.png"),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                          "Jabed\n"
                          "Ahmad",
                          style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  // Expanded(
                  //   child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: 20,
                  //       itemBuilder: (index, context) {
                  //         return Column(
                  //           children: [
                  //             InkWell(
                  //               onTap: () {
                  //                   Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                         builder: (context) =>
                  //                             const PatientDetails()));
                  //               },
                  //               child: Container(
                  //                 height: screenHeight * 0.08,
                  //                 width: screenWidth * 0.20,
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(360)),
                  //                 child: Image.asset("assets/images/men.png"),
                  //               ),
                  //             ),
                  //             SizedBox(height: screenHeight * 0.01),
                  //             Text(
                  //                 "Jabed\n"
                  //                 "Ahmad",
                  //                 style: TextStyle(
                  //                     fontSize: screenWidth * 0.03,
                  //                     fontWeight: FontWeight.bold)),
                  //           ],
                  //         );
                  //       }),
                  // ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(2),
                },
                border: TableBorder.all(color: Colors.grey),
                children: [
                  TableRow(children: [
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text(
                        'S.No',
                        style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text('Name',
                          style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold)),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text(
                        'Gender/Age',
                        style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text('Reason',
                          style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold)),
                    )),
                  ]),
                  TableRow(children: [
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Center(
                          child: Text(
                        '01',
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      )),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text('Deepak',
                          style: TextStyle(fontSize: screenWidth * 0.04)),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text('M/23',
                          style: TextStyle(fontSize: screenWidth * 0.04)),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text('Chest Paint',
                          style: TextStyle(fontSize: screenWidth * 0.04)),
                    )),
                  ]),
                  TableRow(children: [
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Center(
                          child: Text(
                        '02',
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      )),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text('Shoeb',
                          style: TextStyle(fontSize: screenWidth * 0.04)),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text('M/68 ',
                          style: TextStyle(fontSize: screenWidth * 0.04)),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text('Stomach Pain',
                          style: TextStyle(fontSize: screenWidth * 0.04)),
                    )),
                  ]),
                  TableRow(children: [
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Center(
                          child: Text(
                        '03',
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      )),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text('Usman ',
                          style: TextStyle(fontSize: screenWidth * 0.04)),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text('M/43 ',
                          style: TextStyle(fontSize: screenWidth * 0.04)),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text('Cold',
                          style: TextStyle(fontSize: screenWidth * 0.04)),
                    )),
                  ]),
                  TableRow(children: [
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Center(
                          child: Text(
                        '04',
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      )),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text('Fatima ',
                          style: TextStyle(fontSize: screenWidth * 0.04)),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text('M/23',
                          style: TextStyle(fontSize: screenWidth * 0.04)),
                    )),
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text('Migraine',
                          style: TextStyle(fontSize: screenWidth * 0.04)),
                    )),
                  ]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
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
                          )))),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Container(
          width: screenWidth,
          height: screenHeight * 0.05,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Icon(Icons.home,
                      size: 40, color: allColor.backGroundColor)),
              Spacer(),
              Container(
                  child: InkWell(
                      onTap: () {},
                      child: Image.asset("assets/images/right.png"))),
              Spacer(),
              Container(
                child: InkWell(
                    onTap: () {},
                    child: Image.asset("assets/images/setting.png")),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
