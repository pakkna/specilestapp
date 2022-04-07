import 'dart:developer';

import 'package:design/helper/others_helper.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/services/lab_report_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LabReportImage extends StatefulWidget {
  const LabReportImage({Key? key}) : super(key: key);
  static const routeName = 'lab report image';

  @override
  State<LabReportImage> createState() => _LabReportImageState();
}

class _LabReportImageState extends State<LabReportImage> {
  var _isInit = true;
  var provider;
  @override
  void didChangeDependencies() {
    if (_isInit == true) {
      Provider.of<LabReportService>(context, listen: false).labReports;
      //   imageId = ModalRoute.of(context)!.settings.arguments;
    }

    _isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final imageId = ModalRoute.of(context)!.settings.arguments;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Consumer<LabReportService>(
        builder: (BuildContext context, provider, Widget? child) =>
            provider.labReports != null
                ? provider.labReports != "error"
                    ? Scaffold(
                        appBar: AppBar(
                          title:
                              Text(provider.labReports.data[imageId].testname),
                        ),
                        body: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.05),
                          child: Center(
                            // heightFactor: screenHeight * 1,
                            child: InteractiveViewer(
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    'https://dev.kambaiihealth.com/${provider.labReports.data[imageId].images[0].img}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : const Text("Something went wrong")
                : OthersHelper().spinner(allColor.backGroundColor),
      ),
    );
  }
}
