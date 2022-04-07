import 'package:cached_network_image/cached_network_image.dart';

import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/change_password.dart';

import '/screen/patient/patient_helper.dart';
import '/screen/profile/change_password.dart';
import '/screen/profile/profile_update.dart';
import '/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Consumer<LoginService>(
            builder: (BuildContext context, provider, Widget? child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: allColor.backGroundColor),
                            onPressed: () {},
                            child: Text(
                              "My Profile",
                              style: TextStyle(fontSize: screenWidth * 0.05),
                            )),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 65,
                              height: 65,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(
                                  imageUrl: provider.loginDetails.data.photo,
                                  placeholder: (context, url) {
                                    return Image.asset(
                                        'assets/images/placeholder.png');
                                  },
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  height: 65,
                                  width: 65,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            //
                            // Container(
                            //   height: screenHeight * 0.08,
                            //   child: Padding(
                            //     padding:
                            //         EdgeInsets.only(right: screenWidth * 0.05),
                            //     child: Image(
                            //         image: AssetImage("assets/images/men.png"),
                            //         ),
                            //   ),
                            // ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: screenWidth * 0.05),
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Change profile\nphotos")),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: screenWidth * 0.25,
                ),
                Container(
                  color: Color(0xffedf1fd),
                  width: screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenWidth * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.01),
                        child: Row(
                          children: [
                            Text(
                              "Name :",
                              style: TextStyle(fontSize: screenWidth * 0.04),
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            Text(
                              provider.loginDetails.data.name,
                              style: TextStyle(fontSize: screenWidth * 0.04),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                          padding: EdgeInsets.all(screenWidth * 0.01),
                          child: Row(
                            children: [
                              Text(
                                "Phone No :",
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              ),
                              SizedBox(
                                width: screenWidth * 0.03,
                              ),
                              Text(
                                provider.loginDetails.data.mobile,
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              ),
                            ],
                          )),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.01),
                        child: Row(
                          children: [
                            Text(
                              "First Name :",
                              style: TextStyle(fontSize: screenWidth * 0.04),
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            Text(
                              provider.loginDetails.data.firstname,
                              style: TextStyle(fontSize: screenWidth * 0.04),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.01),
                        child: Row(
                          children: [
                            Text(
                              "Last Name :",
                              style: TextStyle(fontSize: screenWidth * 0.04),
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            Text(
                              provider.loginDetails.data.lastname,
                              style: TextStyle(fontSize: screenWidth * 0.04),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.01),
                        child: Row(
                          children: [
                            Text(
                              "Email :",
                              style: TextStyle(fontSize: screenWidth * 0.04),
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            Text(
                              provider.loginDetails.data.email,
                              style: TextStyle(fontSize: screenWidth * 0.04),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                          padding: EdgeInsets.all(screenWidth * 0.01),
                          child: Row(
                            children: [
                              Text(
                                "Emergency Contact :",
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              ),
                              SizedBox(
                                width: screenWidth * 0.03,
                              ),
                              Text(
                                provider
                                    .loginDetails.data.emergencyContactNumber,
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              ),
                            ],
                          )),
                      Divider(),
                      Padding(
                          padding: EdgeInsets.all(screenWidth * 0.01),
                          child: Row(
                            children: [
                              Text(
                                "Address :",
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              ),
                              SizedBox(
                                width: screenWidth * 0.03,
                              ),
                              Text(
                                provider.loginDetails.data.address,
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              ),
                            ],
                          )),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.01),
                        child:
                            // PatientHelper().infoSingleRow(
                            //     "Gender:", provider.loginDetails.data.gender),
                            Row(
                          children: [
                            Text(
                              "Gender :",
                              style: TextStyle(fontSize: screenWidth * 0.04),
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            Text(
                              provider.loginDetails.data.gender,
                              style: TextStyle(fontSize: screenWidth * 0.04),
                            ),
                          ],
                        ),
                      ),
                      // Divider(),
                      // Padding(
                      //   padding: EdgeInsets.all(screenWidth * 0.01),
                      //   child:
                      //       // PatientHelper().infoSingleRow(
                      //       //     "Gender:", provider.loginDetails.data.gender),
                      //       Row(
                      //     children: [
                      //       Text(
                      //         "Age :",
                      //         style: TextStyle(fontSize: screenWidth * 0.04),
                      //       ),
                      //       Text(
                      //         provider.loginDetails.data.gender,
                      //         style: TextStyle(fontSize: screenWidth * 0.04),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Divider(),
                      Padding(
                          padding: EdgeInsets.all(screenWidth * 0.01),
                          child: Row(
                            children: [
                              Text(
                                "Zoom Id :",
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              ),
                              SizedBox(
                                width: screenWidth * 0.03,
                              ),
                              Text(
                                provider.loginDetails.data.zoomId,
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              ),
                            ],
                          )),
                      Divider(),
                      Padding(
                          padding: EdgeInsets.all(screenWidth * 0.01),
                          child: Row(
                            children: [
                              Text(
                                "BMDC :",
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              ),
                              SizedBox(
                                width: screenWidth * 0.03,
                              ),
                              Text(
                                provider.loginDetails.data.bmdc,
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: screenWidth * 0.02,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenWidth * 0.05,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePasswordP()
                              //ChangePassword()
                              ));
                    },
                    child: Text("Change password")),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(screenWidth * 0.10),
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
            Container(
              height: screenHeight * 0.05,
              child: InkWell(
                  onTap: () {}, child: Image.asset("assets/images/right.png")),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  primary: Colors.blue),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileUpdate()));
              },
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    top: screenWidth * 0.02,
                    bottom: screenWidth * 0.02,
                    right: screenWidth * 0.05),
                child: Text('Edit',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                    )),
              ),
            ),
            //
            // IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            // Container(
            //   height: screenHeight * 0.05,
            //   child: InkWell(
            //       onTap: () {},
            //       child: Image.asset("assets/images/setting.png")),
            // ),
          ],
        ),
      ),
    ));
  }
}
