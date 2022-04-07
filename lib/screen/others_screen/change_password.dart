import 'package:design/helper/custom_text_field.dart';
import 'package:design/screen/get_started.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}
TextEditingController _oldPassController= TextEditingController();
TextEditingController _newPassController= TextEditingController();
TextEditingController _newConfirmPassController= TextEditingController();
class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight= MediaQuery.of(context).size.height;
    final double screenWidth= MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding:  EdgeInsets.all(screenWidth*0.05),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenWidth*0.10),
                  Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: allColor.backGroundColor),
                          onPressed: (){},
                          child: Text("Dr. Mahmood", style: TextStyle(fontSize: screenWidth*0.05),)),
                      Spacer(),
                      Container(
                        height: screenHeight*0.08,
                        child:
                        Padding(
                          padding:  EdgeInsets.only(right: screenWidth*0.05),
                          child: Image(image: AssetImage("assets/images/men.png")),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth*0.10),
                  CustomTextField(
                    controller: _oldPassController,
                    hintText: "Enter Old password",
                    obsecureValue: false,
                    suffixIcon: Icon(Icons.edit),
                  ),
                  SizedBox(height: screenWidth*0.02),
                  CustomTextField(
                      controller: _newPassController,
                      hintText: "Enter new password",
                      obsecureValue: false,
                      suffixIcon: Icon(Icons.edit),
                  ),
                  SizedBox(height: screenWidth*0.02),
                  CustomTextField(
                      controller: _newConfirmPassController,
                      hintText: "Confirm password",
                      obsecureValue: false,
                      suffixIcon: Icon(Icons.edit)),
                  SizedBox(height: screenWidth*0.05),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green),
                      onPressed: (){},
                      child: Text("Update", style: TextStyle(fontSize: screenWidth*0.04),)),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding:  EdgeInsets.all(screenWidth*0.10),
            child: Row(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        primary: Colors.blue
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child:
                    Padding(
                      padding:  EdgeInsets.only(left: screenWidth*0.05, top: screenWidth*0.02,
                          bottom: screenWidth*0.02, right: screenWidth*0.05),
                      child: Text('Back', style: TextStyle(fontSize: screenWidth*0.04,)),
                    )
                ),

              ],
            ),
          ),
        )
    );
  }
}
