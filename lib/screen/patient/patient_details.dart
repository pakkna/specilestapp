import 'package:cached_network_image/cached_network_image.dart';
import 'package:design/helper/common_helper.dart';
import 'package:design/helper/others_helper.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/screen/patient/patient_helper.dart';
import 'package:design/services/common_service.dart';
import 'package:design/services/patient_details_service.dart';
import 'package:flutter/material.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails({Key? key}) : super(key: key);

  static const routeName = 'patientdetails';

  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  @override
  void initState() {
    super.initState();
    Provider.of<PatientDetailsService>(context, listen: false)
        .fetchPatientDetails('', context);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: CommonHelper().appbarSimple(''),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer<PatientDetailsService>(
            builder: (context, provider, child) => provider.patientDetails !=
                    null
                ? provider.patientDetails != "error"
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // PatientHelper().profileCard(),
                          //primary info card
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.02),
                                    spreadRadius: -2,
                                    blurRadius: 13,
                                    offset: const Offset(0, 9)),
                              ],
                            ),
                            child: Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    //profile image
                                    SizedBox(
                                      width: 65,
                                      height: 65,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              'https://dev.kambaiihealth.com/public/profile_pic/${provider.patientDetails.data.uinfo.photo}',
                                          placeholder: (context, url) {
                                            return Image.asset(
                                                'assets/images/men.png'
                                                //'assets/images/placeholder.png'
                                                );
                                          },
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          height: 65,
                                          width: 65,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 13,
                                    ),
                                    Text(
                                      provider.patientDetails.data.uinfo.name ??
                                          "",
                                      style: TextStyle(
                                          color: allColor.blackTextColor,
                                          fontSize: 19),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    //username
                                    Text(
                                      provider.patientDetails.data.uinfo
                                              .mobile ??
                                          "",
                                      style: TextStyle(
                                        color: allColor.blackTextColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Divider(
                                      thickness: .5,
                                      height: 45,
                                      color: Colors.grey.withOpacity(.7),
                                    )
                                  ],
                                ),

                                //informations row
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                  child: Column(
                                    children: [
                                      PatientHelper().infoSingleRow(
                                          "Email:",
                                          provider.patientDetails.data.uinfo
                                                  .email ??
                                              ""),
                                      PatientHelper().infoSingleRow(
                                          "Gender:",
                                          provider.patientDetails.data.uinfo
                                                  .gender ??
                                              ""),
                                      PatientHelper().infoSingleRow(
                                          "Date of birth:",
                                          provider.patientDetails.data.uinfo
                                                      .dateOfBirth !=
                                                  null
                                              ? CommonService().getDate(provider
                                                  .patientDetails
                                                  .data
                                                  .uinfo
                                                  .dateOfBirth)
                                              : ""),
                                      PatientHelper().infoSingleRow(
                                          "Emergency contact:",
                                          provider.patientDetails.data.uinfo
                                                  .emergencyContactNumber ??
                                              "")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),

                          //Buttons=============>
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.fromLTRB(20, 35, 20, 0),
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.02),
                                  spreadRadius: -2,
                                  blurRadius: 13,
                                  offset: Offset(0, 9)),
                            ]),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    PatientHelper().navigate(context, 0);
                                  },
                                  child: Container(
                                    height: 23.0,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          PatientHelper().buttonIcons[0],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 11,
                                ),
                                Text(
                                  PatientHelper().buttonList[0],
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: allColor.blackTextColor,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            )),
                          ),
//////////////////////////////////////////////////////////
                          // Container(
                          //   padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     boxShadow: [
                          //       BoxShadow(
                          //           color: Colors.black.withOpacity(0.02),
                          //           spreadRadius: -2,
                          //           blurRadius: 13,
                          //           offset: const Offset(0, 9)),
                          //     ],
                          //   ),
                          //   child: GridView.builder(
                          //     gridDelegate: const FlutterzillaFixedGridView(
                          //         crossAxisCount: 3,
                          //         mainAxisSpacing: 0,
                          //         crossAxisSpacing: 15,
                          //         height: 110),
                          //     itemCount: 13,
                          //     shrinkWrap: true,
                          //     physics: const NeverScrollableScrollPhysics(),
                          //     itemBuilder: (context, index) {
                          //       return InkWell(
                          //         onTap: () {
                          //           PatientHelper().navigate(context, index);
                          //         },
                          //         child: Column(
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.center,
                          //           children: [
                          //             Container(
                          //               height: 23.0,
                          //               width: double.infinity,
                          //               decoration: BoxDecoration(
                          //                 image: DecorationImage(
                          //                   image: AssetImage(
                          //                     PatientHelper()
                          //                         .buttonIcons[index],
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //             const SizedBox(
                          //               height: 11,
                          //             ),
                          //             Text(
                          //               PatientHelper().buttonList[index],
                          //               textAlign: TextAlign.center,
                          //               maxLines: 2,
                          //               overflow: TextOverflow.ellipsis,
                          //               style: TextStyle(
                          //                 color: allColor.blackTextColor,
                          //                 fontSize: 13,
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       );
                          //     },
                          //   ),
                          // )
////////////////////////////////////
                          // Padding(
                          //     padding: EdgeInsets.all(screenHeight * 0.02),
                          //     child: Row(children: [
                          //       SizedBox(height: screenHeight * 0.10),
                          //       Padding(
                          //           padding: EdgeInsets.only(left: screenWidth * 0.03),
                          //           child: ElevatedButton(
                          //               style: ElevatedButton.styleFrom(
                          //                   primary: allColor.backGroundColor),
                          //               onPressed: () {},
                          //               child: Text(
                          //                 "Patient Details",
                          //                 style:
                          //                     TextStyle(fontSize: screenWidth * 0.05),
                          //               ))),
                          //       const Spacer(),
                          //       SizedBox(
                          //           height: screenHeight * 0.07,
                          //           child: Image.asset("assets/images/k.jpeg"))
                          //     ])),
                          // SizedBox(height: screenHeight*0.02),
                          // Padding(
                          //   padding:  EdgeInsets.only(right: screenWidth*0.25),
                          //   child: Row(
                          //     children: [
                          //       Padding(
                          //         padding:  EdgeInsets.only(left: screenWidth*0.05),
                          //         child:
                          //         Text("Reason :", style: TextStyle(
                          //             fontSize: screenWidth*0.06, fontWeight: FontWeight.bold))),
                          //       const Spacer(),
                          //       Padding(
                          //         padding:  EdgeInsets.only(left: screenWidth*0.05),
                          //         child:
                          //         Text("Chest pain", style: TextStyle(
                          //             fontSize: screenWidth*0.05, fontWeight: FontWeight.bold)),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: screenWidth * 0.01),
                          // Padding(
                          //   padding: EdgeInsets.only(right: screenWidth * 0.25),
                          //   child: Row(
                          //     children: [
                          //       Padding(
                          //         padding: EdgeInsets.only(left: screenWidth * 0.05),
                          //         child: Text("Gender :",
                          //             style: TextStyle(fontSize: screenWidth * 0.04)),
                          //       ),
                          //       const Spacer(),
                          //       Padding(
                          //         padding: EdgeInsets.only(left: screenWidth * 0.05),
                          //         child: Text("Male",
                          //             style: TextStyle(fontSize: screenWidth * 0.04)),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: screenWidth * 0.01),
                          // Padding(
                          //   padding: EdgeInsets.only(right: screenWidth * 0.25),
                          //   child: Row(
                          //     children: [
                          //       Padding(
                          //         padding: EdgeInsets.only(left: screenWidth * 0.05),
                          //         child: Text("Name :",
                          //             style: TextStyle(fontSize: screenWidth * 0.04)),
                          //       ),
                          //       const Spacer(),
                          //       Padding(
                          //         padding: EdgeInsets.only(left: screenWidth * 0.05),
                          //         child: Text("Deepak",
                          //             style: TextStyle(fontSize: screenWidth * 0.04)),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: screenWidth * 0.01),
                          // Padding(
                          //   padding: EdgeInsets.only(right: screenWidth * 0.25),
                          //   child: Row(
                          //     children: [
                          //       Padding(
                          //         padding: EdgeInsets.only(left: screenWidth * 0.05),
                          //         child: Text("Age :",
                          //             style: TextStyle(fontSize: screenWidth * 0.04)),
                          //       ),
                          //       const Spacer(),
                          //       Padding(
                          //         padding: EdgeInsets.only(left: screenWidth * 0.05),
                          //         child: Text("51",
                          //             style: TextStyle(fontSize: screenWidth * 0.04)),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: screenWidth * 0.01),
                          // Padding(
                          //   padding: EdgeInsets.only(right: screenWidth * 0.25),
                          //   child: Row(
                          //     children: [
                          //       Padding(
                          //         padding: EdgeInsets.only(left: screenWidth * 0.05),
                          //         child: Text("Date :",
                          //             style: TextStyle(fontSize: screenWidth * 0.04)),
                          //       ),
                          //       const Spacer(),
                          //       Padding(
                          //         padding: EdgeInsets.only(left: screenWidth * 0.05),
                          //         child: Text("August 25, 2021",
                          //             style: TextStyle(fontSize: screenWidth * 0.04)),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: screenWidth * 0.01),
                          // Padding(
                          //   padding: EdgeInsets.only(right: screenWidth * 0.25),
                          //   child: Row(
                          //     children: [
                          //       Padding(
                          //         padding: EdgeInsets.only(left: screenWidth * 0.05),
                          //         child: Text("Time :",
                          //             style: TextStyle(fontSize: screenWidth * 0.04)),
                          //       ),
                          //       const Spacer(),
                          //       Padding(
                          //         padding: EdgeInsets.only(left: screenWidth * 0.05),
                          //         child: Text("10:50 AM",
                          //             style: TextStyle(fontSize: screenWidth * 0.04)),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      )
                    : Container(
                        height: screenHeight - 180,
                        alignment: Alignment.center,
                        child: const Text("Something went wrong"))
                : Container(
                    height: screenHeight - 180,
                    alignment: Alignment.center,
                    child: OthersHelper().spinner(allColor.backGroundColor),
                  ),
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.symmetric(vertical: 20),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Padding(
      //         padding: EdgeInsets.only(left: screenWidth * 0.05),
      //         child: ElevatedButton(
      //             style: ElevatedButton.styleFrom(
      //                 shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(30)),
      //                 primary: allColor.backGroundColor),
      //             onPressed: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => const PcpNotesOne()));
      //             },
      //             child: const Text("PCP Visit Summary")),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.only(right: screenWidth * 0.05),
      //         child: ElevatedButton(
      //             style: ElevatedButton.styleFrom(
      //                 shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(30)),
      //                 primary: allColor.elevatedBtnColor),
      //             onPressed: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => const Prescription()));
      //             },
      //             child: Padding(
      //                 padding: EdgeInsets.only(
      //                     left: screenWidth * 0.02,
      //                     top: screenWidth * 0.02,
      //                     bottom: screenWidth * 0.02,
      //                     right: screenWidth * 0.02),
      //                 child: Text('My Prescription',
      //                     style: TextStyle(
      //                       fontSize: screenWidth * 0.04,
      //                     )))),
      //       ),
      //     ],
      //   ),
      // )
    ));
  }
}
