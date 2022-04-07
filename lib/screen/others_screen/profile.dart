import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/change_password.dart';
import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight= MediaQuery.of(context).size.height;
    final double screenWidth= MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          body:
          Padding(
            padding:  EdgeInsets.all(screenWidth*0.05),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight*0.02,),
                  Row(
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: allColor.backGroundColor
                              ),
                              onPressed: (){

                              },
                              child: Text("My Profile", style: TextStyle(fontSize: screenWidth*0.05),)),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: screenHeight*0.08,
                                child:
                                Padding(
                                  padding:  EdgeInsets.only(right: screenWidth*0.05),
                                  child: Image(image: AssetImage("assets/images/men.png")),
                                ),
                              ),

                              Padding(
                                padding:  EdgeInsets.only(right: screenWidth*0.05),
                                child: ElevatedButton(
                                    onPressed: (){},
                                    child: Text("Change profile\nphotos")),
                              )
                            ],
                          ),
                        ],
                      ),



                    ],
                  ),


                  SizedBox(height: screenWidth*0.25,),
                  Container(
                    color: Color(0xffedf1fd),
                    width: screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenWidth*0.02,),
                        Padding(
                          padding:  EdgeInsets.all(screenWidth*0.01),
                          child: Text("Name :", style: TextStyle(fontSize: screenWidth*0.04),),
                        ),
                        Divider(),
                        Padding(
                          padding:  EdgeInsets.all(screenWidth*0.01),
                          child: Text("Mob No :", style: TextStyle(fontSize: screenWidth*0.04),),
                        ),
                        Divider(),
                        Padding(
                          padding:  EdgeInsets.all(screenWidth*0.01),
                          child: Text("Email :", style: TextStyle(fontSize: screenWidth*0.04),),
                        ),
                        Divider(),
                        Padding(
                          padding:  EdgeInsets.all(screenWidth*0.01),
                          child: Text("BMDC No. :", style: TextStyle(fontSize: screenWidth*0.04),),
                        ),
                        Divider(),
                        Padding(
                          padding:  EdgeInsets.all(screenWidth*0.01),
                          child: Text("Address :", style: TextStyle(fontSize: screenWidth*0.04),),
                        ),
                        Divider(),
                        Padding(
                          padding:  EdgeInsets.all(screenWidth*0.01),
                          child: Text("Bank Name :", style: TextStyle(fontSize: screenWidth*0.04),),
                        ),
                        Divider(),
                        Padding(
                          padding:  EdgeInsets.all(screenWidth*0.01),
                          child: Text("Account No. :", style: TextStyle(fontSize: screenWidth*0.04),),
                        ),
                        SizedBox(height: screenWidth*0.02,),
                      ],
                    )
                  ),
                  SizedBox(height: screenWidth*0.05,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green
                    ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
                      },
                      child: Text("Change password")),
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
                Spacer(),
                Container(
                  height: screenHeight*0.05,
                  child:
                  InkWell(
                      onTap: (){},
                      child: Image.asset("assets/images/right.png")),
                ),
                Spacer(),
                Container(
                  height: screenHeight*0.05,
                  child:
                  InkWell(
                      onTap: (){},
                      child: Image.asset("assets/images/setting.png")),
                ),
              ],
            ),
          ),
        )
    );
  }
}
