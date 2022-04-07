import 'package:cached_network_image/cached_network_image.dart';
import '../../patient/patient_helper.dart';
import '/screen/get_started.dart';
import '/screen/others_screen/lab_report/lab_report_image.dart';
import '/screen/others_screen/provisional_diagnosis/provisional_diagnosis.dart';
import '/services/lab_report_service.dart';
import 'package:flutter/material.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';

import '../../../helper/others_helper.dart';

class LabReport extends StatefulWidget {
  const LabReport({Key? key}) : super(key: key);

  @override
  _LabReportState createState() => _LabReportState();
}

TextEditingController _viewLabReportController = TextEditingController();

class _LabReportState extends State<LabReport> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LabReportService>(context, listen: false).fetchPatientDetails();
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: const Text("View Lab Report")),
                    const Spacer(),
                    SizedBox(
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
                //   SizedBox(
                //       height: screenHeight * 0.08,
                //       child: const Image(
                //           image: AssetImage("assets/images/men.png")))
                // ]),
                const SizedBox(
                  height: 30,
                ),

                //Reports gridview ===============>
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
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
                  child: Consumer<LabReportService>(
                    builder: (context, provider, child) => provider
                                .labReports !=
                            null
                        ? provider.labReports != "error"
                            ? GridView.builder(
                                gridDelegate: const FlutterzillaFixedGridView(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 0,
                                    crossAxisSpacing: 13,
                                    height: 140),
                                itemCount: provider.labReports.data.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        LabReportImage.routeName,
                                        arguments: index,
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // ExtendedImage.network(
                                        //   'https://dev.kambaiihealth.com/${provider.labReports.data[index].images[0].img}',
                                        //   width: 200,
                                        //   mode: ExtendedImageMode.gesture,
                                        //   initGestureConfigHandler: (state) {
                                        //     return GestureConfig(
                                        //       minScale: 0.9,
                                        //       animationMinScale: 0.7,
                                        //       maxScale: 3.0,
                                        //       animationMaxScale: 3.5,
                                        //       speed: 1.0,
                                        //       inertialSpeed: 100.0,
                                        //       initialScale: 1.0,
                                        //       inPageView: false,
                                        //       initialAlignment:
                                        //           InitialAlignment.center,
                                        //     );
                                        //   },
                                        //   height: 100,
                                        //   fit: BoxFit.fill,
                                        //   cache: true,
                                        //   border: Border.all(
                                        //       color: Colors.red, width: 1.0),
                                        //   // shape: boxShape,
                                        //   borderRadius: BorderRadius.all(
                                        //       Radius.circular(30.0)),
                                        //   //cancelToken: cancellationToken,
                                        // ),

                                        //  .........//........
                                        // if (provider.labReports.data[index]
                                        //         .images.length <
                                        //     0)
                                        CachedNetworkImage(
                                          imageUrl:
                                              'https://dev.kambaiihealth.com/${provider.labReports.data[index].images[0].img}',
                                          placeholder: (context, url) {
                                            return Image.asset(
                                                'assets/images/placeholder.png');
                                          },
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          height: 80,
                                          width: 80,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          provider
                                              .labReports.data[index].testname,
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: allColor.blackTextColor,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          provider.labReports.data[index].tds,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: allColor.blackTextColor,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            : const Text("Something went wrong")
                        : OthersHelper().spinner(allColor.backGroundColor),
                  ),
                )
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
                            builder: (context) =>
                                const ProvitionalDiagnosis()));
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
      ),
    );
  }
}
