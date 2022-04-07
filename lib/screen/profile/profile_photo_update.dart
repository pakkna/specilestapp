import 'package:design/helper/custom_text_field.dart';
import 'package:design/helper/others_helper.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/services/login_service.dart';
import 'package:design/services/profile_update_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProfilePhoto extends StatefulWidget {
  const ProfilePhoto({Key? key}) : super(key: key);

  @override
  State<ProfilePhoto> createState() => _ProfilePhotoState();
}

var isLoading = false;

class _ProfilePhotoState extends State<ProfilePhoto> {
  var _isInit = true;
  @override
  void didChangeDependencies() {
    _isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  File? _imageProfile;
  var _tempImageProfile = false;
  Future _pickImageProfile() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        _imageProfile = imageTemporary;
        _tempImageProfile = true;
        //  print(imageProfile);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.05, right: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  height: screenHeight * 0.27,
                  width: screenWidth,
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.06),
                      Container(
                        color: Colors.white,
                        width: screenWidth,
                        height: screenHeight * 0.12,
                        child: Image.asset("assets/images/k.jpeg"),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Center(
                        child: Text("Profile Update",
                            style: TextStyle(
                                fontSize: screenWidth * 0.07,
                                color: allColor.blackTextColor)),
                      ),
                    ],
                  ),
                ),

                //Password ================>

                // SizedBox(
                //   height: screenHeight * 0.03,
                // ),
                // Padding(
                //   padding: EdgeInsets.only(left: screenWidth * 0.03),
                //   child: Text(
                //     "Gender",
                //     style: TextStyle(fontSize: screenWidth * 0.04),
                //   ),
                // ),
                // SizedBox(
                //   height: screenWidth * 0.02,
                // ),
                // CustomTextField(
                //   controller: _genderController,
                //   hintText: "Gender",
                //   suffixIcon: const Icon(Icons.drive_file_rename_outline),
                //   obsecureValue: false,
                // ),

                //bmdc ==============>
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 3.0, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  height: screenHeight * 0.25,
                  //  width: double.infinity,
                  width: screenWidth,

                  child: Center(
                    child: _tempImageProfile
                        ? Text('Image Picked')
                        : FlatButton.icon(
                            onPressed: () => _pickImageProfile(),
                            icon: Icon(Icons.image),
                            label: const Text('Pick an Image'),
                          ),
                  ),
                ),

                SizedBox(height: screenWidth * 0.10),
                Center(
                  child: InkWell(
                      onTap: () async {
                        // setState(() {
                        //   isLoading = true;
                        // });

                        // FocusScope.of(context).unfocus();
                        // if () {
                        //   print('yes');
                        //   await Provider.of<ProfileUpdateService>(context,
                        //           listen: false)
                        //       .profileUpdate(
                        //         uploadimageProfile: _imageProfile,
                        //       )
                        //       .then((value) => setState(() {
                        //             isLoading = false;
                        //           }));
                        // } else {
                        //   print('no');
                        // }
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: allColor.backGroundColor,
                              borderRadius: BorderRadius.circular(6)),
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.10,
                              vertical: screenWidth * 0.04),
                          child: isLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Text(
                                  "Update",
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.05,
                                      color: Colors.white),
                                )
                          // : SizedBox(
                          //     height: 23,
                          //     child:
                          //         OthersHelper().spinner(Colors.white)),
                          )),
                ),

                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
