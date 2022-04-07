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

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

final _signUpKey = GlobalKey<FormState>();
TextEditingController _firstnameController = TextEditingController();
TextEditingController _lastnameController = TextEditingController();
TextEditingController _phoneController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passController = TextEditingController();
TextEditingController _addressController = TextEditingController();
TextEditingController _emergencyCNController = TextEditingController();
TextEditingController _genderController = TextEditingController();
TextEditingController _ageController = TextEditingController();
TextEditingController _zoomIdController = TextEditingController();
TextEditingController _bmdcController = TextEditingController();
var isLoading = false;

class _ProfileUpdateState extends State<ProfileUpdate> {
  var _isInit = true;
  @override
  void didChangeDependencies() {
    // if (_isInit) {
    //   final provider =
    //       Provider.of<LoginService>(context, listen: false).loginDetails;
    //   _firstnameController =
    //       TextEditingController(text: provider.loginDetails.data.firstname);
    //   _lastnameController =
    //       TextEditingController(text: provider.loginDetails.data.lastname);
    //   _phoneController =
    //       TextEditingController(text: provider.loginDetails.data.mobile);
    //   _emailController =
    //       TextEditingController(text: provider.loginDetails.data.email);
    //   //       _passController =
    //   // TextEditingController(text: provider.loginDetails.data.firstname);
    //   _addressController =
    //       TextEditingController(text: provider.loginDetails.data.address);
    //   _genderController =
    //       TextEditingController(text: provider.loginDetails.data.gender);
    // }

    _isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  File? _imageCertificate;
  var _tempImageCertificate = false;
  Future _pickImageCertificate() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        _imageCertificate = imageTemporary;
        _tempImageCertificate = true;
        //  print(imageCertificate);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
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
          child: Form(
            key: _signUpKey,
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

                  //First name ===========>
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.03),
                    child: Text(
                      "First Name",
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.02,
                  ),
                  CustomTextField(
                    controller: _firstnameController,
                    hintText: "Enter your first name",
                    suffixIcon: const Icon(Icons.drive_file_rename_outline),
                    obsecureValue: false,
                  ),

                  //Last name ===============>
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.03),
                    child: Text(
                      "Last Name",
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.02,
                  ),
                  CustomTextField(
                    controller: _lastnameController,
                    hintText: "Enter your last name",
                    suffixIcon: const Icon(Icons.drive_file_rename_outline),
                    obsecureValue: false,
                  ),

                  // Phone ===========>
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.03),
                    child: Text(
                      "Phone",
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.02,
                  ),
                  CustomTextField(
                    isNumberField: true,
                    controller: _phoneController,
                    hintText: "Enter your phone number",
                    suffixIcon: const Icon(Icons.phone),
                    obsecureValue: false,
                  ),

                  //Email ==============>
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.03),
                    child: Text(
                      "Email",
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.02,
                  ),
                  CustomTextField(
                    controller: _emailController,
                    hintText: "Email",
                    suffixIcon: const Icon(Icons.email),
                    obsecureValue: false,
                  ),
                  //Address ==============>
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.03),
                    child: Text(
                      "Address",
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.02,
                  ),
                  CustomTextField(
                    controller: _addressController,
                    hintText: "Address",
                    suffixIcon: const Icon(Icons.place),
                    obsecureValue: false,
                  ),
                  //Emergency contact number ==============>

                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.03),
                    child: Text(
                      "Emergency contact number",
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.02,
                  ),
                  CustomTextField(
                    isNumberField: true,
                    controller: _emergencyCNController,
                    hintText: "Emergency contact number",
                    suffixIcon: const Icon(Icons.phone),
                    obsecureValue: false,
                  ),

                  //Password ================>

                  //Gender ==============>
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.03),
                    child: Text(
                      "Gender",
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.02,
                  ),
                  CustomTextField(
                    controller: _genderController,
                    hintText: "Gender",
                    suffixIcon: const Icon(Icons.drive_file_rename_outline),
                    obsecureValue: false,
                  ),
                  //Age ==============>
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.03),
                    child: Text(
                      "Age",
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.02,
                  ),
                  CustomTextField(
                    isNumberField: true,
                    controller: _ageController,
                    hintText: "Age",
                    suffixIcon: const Icon(Icons.drive_file_rename_outline),
                    obsecureValue: false,
                  ),
                  //Zoom Id ==============>
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.03),
                    child: Text(
                      "Zoom Id",
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.02,
                  ),
                  CustomTextField(
                    controller: _zoomIdController,
                    hintText: "Zoom Id",
                    suffixIcon: const Icon(Icons.drive_file_rename_outline),
                    obsecureValue: false,
                  ),
                  //bmdc ==============>
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.03),
                    child: Text(
                      "bmdc",
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.02,
                  ),
                  CustomTextField(
                    controller: _bmdcController,
                    hintText: "bmdc",
                    suffixIcon: const Icon(Icons.drive_file_rename_outline),
                    obsecureValue: false,
                  ),

                  SizedBox(height: screenWidth * 0.03),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.03),
                        child: Text(
                          'Profile image :',
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      FlatButton(
                          onPressed: () => _pickImageProfile(),
                          child: const Text('Select File')),
                      Text(_tempImageProfile ? '(selected)' : ''),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.03),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.03),
                        child: Text(
                          'bmdc certificate :',
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      FlatButton(
                          onPressed: () => _pickImageCertificate(),
                          child: const Text('Select File')),
                      Text(_tempImageCertificate ? '(selected)' : ''),
                    ],
                  ),

                  SizedBox(height: screenWidth * 0.10),
                  Center(
                    child: InkWell(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });

                          FocusScope.of(context).unfocus();
                          if (_firstnameController.text.isNotEmpty &&
                              _lastnameController.text.isNotEmpty &&
                              _emailController.text.isNotEmpty &&
                              _phoneController.text.isNotEmpty) {
                            print('yes');
                            await Provider.of<ProfileUpdateService>(context,
                                    listen: false)
                                .profileUpdate(
                                  firstName: _firstnameController.text,
                                  lastName: _lastnameController.text,
                                  phone: _phoneController.text.toString(),
                                  email: _emailController.text,
                                  address: _addressController.text,
                                  gender: _genderController.text,
                                  age: _ageController.text.toString(),
                                  emergencyContactNumber:
                                      _emergencyCNController.text.toString(),
                                  bmdc: _bmdcController.text,
                                  zoomId: _zoomIdController.text,
                                  uploadimageCertificate: _imageCertificate,
                                  uploadimageProfile: _imageProfile,
                                  context: context,
                                )
                                .then((value) => setState(() {
                                      isLoading = false;
                                    }));
                          } else {
                            OthersHelper().showToast(
                                "first-last name, phone and email needed",
                                allColor.redColor);

                            print('no');
                            setState(() {
                              isLoading = false;
                            });
                          }
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
      ),
    );
  }
}
