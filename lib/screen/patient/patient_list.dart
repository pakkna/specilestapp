import 'package:cached_network_image/cached_network_image.dart';
import 'package:design/helper/others_helper.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/screen/patient/patient_details.dart';
import 'package:design/screen/patient_datas/pcp_notes_one.dart';
import 'package:design/screen/others_screen/view_patient_list_demo.dart';
import 'package:design/services/login_service.dart';
import 'package:design/services/schedule_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientList extends StatefulWidget {
  const PatientList({Key? key}) : super(key: key);

  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  void initState() {
//    Provider.of<ScheduleService>(context, listen: false).fetchSchedule(context);

    // TODO: implement initState
    super.initState();
  }

  int f = 0;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    // final ff = Provider.of<ScheduleService>(context, listen: false).schedule;
    // print(ff.data.external_schedule_list.data);
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth,
              height: screenHeight * 0.50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(0.07), BlendMode.dstATop),
                      image: const AssetImage("assets/images/clock.png"),
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
                          // SizedBox(
                          //   height: screenHeight * 0.10,
                          //   child: const Image(
                          //       image: AssetImage("assets/images/men.png")),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.02),
                            child: Text(provider.loginDetails.data.name,
                                style: TextStyle(
                                    fontSize: screenWidth * 0.06,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const Spacer(),
                          SizedBox(
                              height: screenHeight * 0.07,
                              child: Image.asset("assets/images/k.jpeg")),
                        ],
                      ),
                    ),
                  ),
                  Consumer<ScheduleService>(
                    builder: (BuildContext context, provider, Widget? child) =>
                        provider.schedule != null
                            ? provider.schedule != "error"
                                ? SizedBox(
                                    width: screenWidth,
                                    child: Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: screenWidth * 0.05),
                                            child: Text(
                                                provider
                                                    .schedule
                                                    .data
                                                    .externalScheduleList
                                                    .data[0]
                                                    .endDateTime,
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.06,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        SizedBox(
                                          height: screenHeight * 0.02,
                                        ),
                                        Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                provider.s!,
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.05,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54),
                                              ),
                                              SizedBox(
                                                width: screenWidth * 0.02,
                                              ),
                                              Text(
                                                "Patients",
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.05,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : const Text("Something went wrong")
                            : OthersHelper().spinner(allColor.backGroundColor),
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  Expanded(
                    child: Consumer<ScheduleService>(
                      builder: (BuildContext context, provider,
                              Widget? child) =>
                          provider.schedule != null
                              ? provider.schedule != "error"
                                  ? ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: provider.schedule.data
                                          .externalScheduleList.data.length,
                                      itemBuilder: (context, index) {
                                        return Column(
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            360)),
                                                child: Image.asset(
                                                    "assets/images/men.png"),
                                              ),
                                            ),
                                            SizedBox(
                                                height: screenHeight * 0.01),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      screenWidth * 0.02),
                                              child: Text(
                                                  provider
                                                      .schedule
                                                      .data
                                                      .externalScheduleList
                                                      .data[index]
                                                      .name,
                                                  style: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.03,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ],
                                        );
                                      },
                                    )
                                  : const Text("Something went wrong")
                              : OthersHelper()
                                  .spinner(allColor.backGroundColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            /////////////////////
            Consumer<ScheduleService>(
              builder: (BuildContext context, provider, Widget? child) =>
                  provider.schedule != null
                      ? provider.schedule != "error"
                          ? Padding(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(.7),
                                  1: FlexColumnWidth(2),
                                  2: FlexColumnWidth(1.3),
                                  3: FlexColumnWidth(1),
                                  4: FlexColumnWidth(2),
                                },
                                border: TableBorder.all(color: Colors.grey),
                                children: [
                                  TableRow(children: [
                                    TableCell(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.all(screenWidth * 0.02),
                                      child: Text(
                                        'S.No',
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.04,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                    TableCell(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.all(screenWidth * 0.02),
                                      child: Text('Name',
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.04,
                                              fontWeight: FontWeight.bold)),
                                    )),
                                    TableCell(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.all(screenWidth * 0.02),
                                      child: Text(
                                        'Gender',
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.04,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                    TableCell(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.all(screenWidth * 0.02),
                                      child: Text(
                                        'Age',
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.04,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                    TableCell(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.all(screenWidth * 0.02),
                                      child: Text('Reason',
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.04,
                                              fontWeight: FontWeight.bold)),
                                    )),
                                  ]),
                                  for (int i = 0;
                                      i <
                                          provider.schedule.data
                                              .externalScheduleList.data.length;
                                      i++)
                                    TableRow(children: [
                                      //serial
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              screenWidth * 0.02),
                                          child: Center(
                                            child: Text(
                                              "${i + 1}",
                                              style: TextStyle(
                                                  fontSize: screenWidth * 0.04),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //name
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              screenWidth * 0.02),
                                          child: Text(
                                              provider
                                                  .schedule
                                                  .data
                                                  .externalScheduleList
                                                  .data[i]
                                                  .name,
                                              style: TextStyle(
                                                  fontSize:
                                                      screenWidth * 0.04)),
                                        ),
                                      ),
                                      //gender
                                      if (provider
                                              .schedule
                                              .data
                                              .externalScheduleList
                                              .data[i]
                                              .gender ==
                                          null)
                                        TableCell(
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                screenWidth * 0.02),
                                            child: Text('---',
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.04)),
                                          ),
                                        )
                                      else
                                        TableCell(
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                screenWidth * 0.02),
                                            child: Text(
                                                provider
                                                    .schedule
                                                    .data
                                                    .externalScheduleList
                                                    .data[i]
                                                    .gender,
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.04)),
                                          ),
                                        ),
                                      //age
                                      if (provider
                                              .schedule
                                              .data
                                              .externalScheduleList
                                              .data[i]
                                              .age ==
                                          null)
                                        TableCell(
                                            child: Padding(
                                          padding: EdgeInsets.all(
                                              screenWidth * 0.02),
                                          child: Text('---',
                                              style: TextStyle(
                                                  fontSize:
                                                      screenWidth * 0.04)),
                                        ))
                                      else
                                        TableCell(
                                            child: Padding(
                                          padding: EdgeInsets.all(
                                              screenWidth * 0.02),
                                          child: Text(
                                              provider
                                                  .schedule
                                                  .data
                                                  .externalScheduleList
                                                  .data[i]
                                                  .age
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                      screenWidth * 0.04)),
                                        )),
                                      if (provider
                                              .schedule
                                              .data
                                              .externalScheduleList
                                              .data[i]
                                              .remarks ==
                                          null)
                                        //reason
                                        TableCell(
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                screenWidth * 0.02),
                                            child: Text('---',
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.04)),
                                          ),
                                        )
                                      else
                                        TableCell(
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                screenWidth * 0.02),
                                            child: Text(
                                                provider
                                                    .schedule
                                                    .data
                                                    .externalScheduleList
                                                    .data[i]
                                                    .remarks,
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.04)),
                                          ),
                                        ),
                                    ]),
                                  ///////
                                ],
                              ),
                            )
                          : const Text("Something went wrong")
                      : OthersHelper().spinner(allColor.backGroundColor),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: screenWidth * 0.05),
            //   child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //           primary: allColor.backGroundColor),
            //       onPressed: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => const ViewPatientDetails()));
            //       },
            //       child: const Text("View All Patient Details")),
            // ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.05, right: screenWidth * 0.05),
              child: SizedBox(
                width: screenWidth,
                height: screenHeight * 0.05,
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Image.asset("assets/images/right.png")),
                    const Spacer(),
                    InkWell(
                        onTap: () {},
                        child: Image.asset("assets/images/setting.png")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
