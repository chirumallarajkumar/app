import 'dart:async';
import 'package:flutter/material.dart';
import 'package:arawinzhilo/Packages/CommonAssets/Colors.dart';
import 'package:arawinzhilo/Packages/CommonAssets/TextStyle.dart';
import "package:arawinzhilo/route.dart" as route;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Widgets/Text.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  var finaltkn;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getValidationdata().whenComplete(() {
      Timer(Duration(seconds: 2), () {
        finaltkn == null
            ? Navigator.pushNamed(context, route.signinpage)
            : Navigator.pushNamed(context, route.AllAddress);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return finaltkn == null
        ? Container(
            color: Colors.white,
          )
        : Container(
            color: Colors.red,
          );
  }

  Future getValidationdata() async {
    final prefs = await SharedPreferences.getInstance();
    var obtainedtkn = prefs.getString('tkn');
    setState(() {
      finaltkn = obtainedtkn;
      print(finaltkn);
    });
  }
}
