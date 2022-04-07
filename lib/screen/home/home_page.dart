import '/helper/others_helper.dart';
import '/screen/get_started.dart';
import '/screen/home/home_visit_records.dart';
import '/screen/others_screen/drug_interaction.dart';
import '/screen/others_screen/my_wallet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../others_screen/view_patient_list_demo.dart';
import '/screen/patient/patient_list.dart';
import '/screen/profile/profile.dart';
import '/services/schedule_service.dart';
import '/services/visit_records_service.dart';
import 'package:flutter/material.dart';
import '/services/login_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.03,
              right: screenWidth * 0.03,
              top: screenWidth * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Row(children: [
                  Text(
                    "Welcome",
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),
                  const Spacer(),
                  Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.02),
                      child: SizedBox(
                          height: screenHeight * 0.07,
                          child: Image.asset("assets/images/k.jpeg")))
                ]),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Consumer<LoginService>(
                  builder: (BuildContext context, provider, Widget? child) =>
                      Row(children: [
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
                    //     image: AssetImage("assets/images/men.png"),
                    //   ),
                    // ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.02),
                              child: Text(provider.loginDetails.data.name,
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.06,
                                      fontWeight: FontWeight.bold))),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.02),
                            child: Text(
                                'from ' +
                                    provider.loginDetails.data.hospitalName,
                                style: TextStyle(fontSize: screenWidth * 0.04)),
                          )
                        ])
                  ]),
                ),
                SizedBox(height: screenHeight * 0.05),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          await Provider.of<ScheduleService>(context,
                                  listen: false)
                              .fetchSchedule('present', context);
                        },
                        child: SizedBox(
                            width: screenWidth,
                            child: Image.asset("assets/images/today.png")),
                      ),
                      InkWell(
                        onTap: () async {
                          await Provider.of<ScheduleService>(context,
                                  listen: false)
                              .fetchSchedule('future', context);
                        },
                        child: SizedBox(
                            width: screenWidth,
                            child: Image.asset("assets/images/upcoming.png")),
                      ),
                      InkWell(
                        onTap: () async {
                          await Provider.of<ScheduleService>(context,
                                  listen: false)
                              .fetchSchedule('previous', context);
                        },
                        child: SizedBox(
                            width: screenWidth,
                            child: Image.asset("assets/images/pre.png")),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.10),
                Container(
                    width: screenWidth,
                    height: screenHeight * 0.17,
                    decoration: BoxDecoration(
                        color: allColor.homebgColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: screenHeight * 0.01,
                            right: screenHeight * 0.01,
                            top: screenHeight * 0.02,
                            bottom: screenHeight * 0.02),
                        child: Row(children: [
                          Row(children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.08,
                                  child: InkWell(
                                      onTap: () async {
                                        // await Provider.of<ScheduleService>(
                                        //         context,
                                        //         listen: false)
                                        //     .fetchSchedule('present', context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ViewPatientDetails()));
                                      },
                                      child:
                                          Image.asset("assets/images/men.png")),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Text("Patient List",
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                        fontWeight: FontWeight.bold))
                              ],
                            )
                          ]),
                          const Spacer(),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: screenHeight * 0.08,
                                    child: InkWell(
                                        onTap: () async {
                                          // await Provider.of<
                                          //             VisitRecordsService>(
                                          //         context,
                                          //         listen: false)
                                          //     .visitRecords();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomeVisitRecords()));
                                        },
                                        child: Image.asset(
                                            "assets/images/file.png")),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Text("Visit Records",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(children: [
                            Column(children: [
                              SizedBox(
                                height: screenHeight * 0.08,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyWallet()));
                                    },
                                    child: Image.asset("assets/images/tk.png")),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text("Account",
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.bold))
                            ])
                          ]),
                          // const Spacer(),
                          // Row(children: [
                          //   Column(children: [
                          //     SizedBox(
                          //       height: screenHeight * 0.08,
                          //       child: InkWell(
                          //           onTap: () {
                          //             Navigator.push(
                          //                 context,
                          //                 MaterialPageRoute(
                          //                     builder: (context) =>
                          //                         const DrugInteraction()));
                          //           },
                          //           child: Image.asset(
                          //               "assets/images/medicine.png")),
                          //     ),
                          //     SizedBox(height: screenHeight * 0.01),
                          //     Text("Medicine",
                          //         style: TextStyle(
                          //             fontSize: screenWidth * 0.04,
                          //             fontWeight: FontWeight.bold))
                          //   ])
                          // ]),
                          const Spacer()
                        ]))),
                SizedBox(
                  height: screenHeight * 0.10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05, right: screenWidth * 0.05),
                  child: SizedBox(
                    width: screenWidth,
                    height: screenHeight * 0.05,
                    child: Row(
                      children: [
                        Container(
                          child: InkWell(
                              onTap: () {},
                              child: Image.asset("assets/images/right.png")),
                        ),
                        const Spacer(),
                        Container(
                          child: InkWell(
                              onTap: () {},
                              child: Image.asset("assets/images/setting.png")),
                        ),
                        const Spacer(),
                        Container(
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Profile()));
                              },
                              child: Image.asset("assets/images/profile.png")),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
