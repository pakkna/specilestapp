import 'package:design/screen/get_started.dart';
import 'package:flutter/material.dart';

class CommonHelper {
  appbarSimple(String title) {
    return AppBar(
      title: Text(title,
          style: TextStyle(color: allColor.blackTextColor, fontSize: 17)),
      iconTheme: IconThemeData(
        color: allColor.blackTextColor, //change your color here
      ),
      backgroundColor: Colors.white,
      // centerTitle: true,
      elevation: 0,
    );
  }
}
