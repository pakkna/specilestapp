import 'package:design/screen/get_started.dart';
import 'package:flutter/material.dart';

class ShowDrugInteraction extends StatelessWidget {
  //const ShowDrugInteraction({Key? key}) : super(key: key);
  String? comment;
  ShowDrugInteraction(this.comment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: allColor.backGroundColor,
                      borderRadius: BorderRadius.circular(6)),
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.10,
                      vertical: screenWidth * 0.04),
                  child:
                      // provider.isloading == false
                      //     ?
                      Text(
                    "Drug interaction",
                    style: TextStyle(
                        fontSize: screenWidth * 0.06, color: Colors.white),
                  )
                  // : SizedBox(
                  //     height: 23,
                  //     child:
                  //         OthersHelper().spinner(Colors.white)),
                  ),
              // Text('Drug Interaction'),
              SizedBox(
                height: screenWidth * 0.04,
              ),
              Center(
                child: Text(comment!,
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                    )),
              ),
            ],
          )),
    );
  }
}
