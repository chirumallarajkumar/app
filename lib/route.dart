import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hilo_bloc/Screens/AddingAddress/view/AddAddress.dart';
import 'package:hilo_bloc/Screens/AllAddress/Repository/alladdressesapi.dart';
import 'package:hilo_bloc/Screens/AllAddress/View/AllAddressScreen.dart';
import 'package:hilo_bloc/Screens/ForgotPassword/View/forgotpasssword.dart';
import 'package:hilo_bloc/Screens/ForgotPassword/View/otpscreenfg.dart';
import 'package:hilo_bloc/Screens/ForgotPassword/View/resetpassword.dart';
import 'package:hilo_bloc/Screens/SignInScreen/View/Signinpage.dart';
import 'package:hilo_bloc/Screens/SignupScreen/View/SIgnupScreen.dart';
import 'package:hilo_bloc/Screens/SplashScreen/View/SplashPage.dart';

import 'Screens/ForgotPassword/Repository/otpapi.dart';
import 'Screens/SignInScreen/Repository/signinvalidation.dart';


const String signinpage = 'signin';
const String splashscreen = 'SplashScreen';
const String AddNewAddress = "AddAddress";
const String AllAddress = "AllAddress";
const String Editaddress = "EditAddress";
const String forgotpassw = "forgotpasssword";
const String otpscreenforgot = "otpscreenforgot";
const String resetpass = "resetpass";
const String Signup = "Signup";

MaterialPageRoute controller(RouteSettings settings) {
  switch (settings.name) {
    case splashscreen:
      return MaterialPageRoute(builder: (context) => SplashPage());
    case signinpage:
      return MaterialPageRoute(
          builder: (context) => RepositoryProvider(
                create: (context) => signinRepository(),
                child: Signinpage(),
              ));
    case AddNewAddress:
      return MaterialPageRoute(builder: (context) => AddAddress());
    //  case Editaddress:
    //   return MaterialPageRoute(builder: (context) => EditAddress(addId: , userids: userids, addLabel: addLabel, addLine1: addLine1, addLine2: addLine2, city: city, state: state, pincode: pincode, contactNo: contactNo, addStatus: addStatus)));
    case AllAddress:
      return MaterialPageRoute(
          builder: (context) => RepositoryProvider(
                create: (context) => UserRepository(),
                child: AllAddressScreen(),
              ));
    case forgotpassw:
      return MaterialPageRoute(
          builder: (context) => RepositoryProvider(
                create: (context) => otpRepository(),
                child: forgotpassword(),
              ));
    // case otpscreenforgot:
    //   return MaterialPageRoute(builder: (context) => otpscreenfg());
    // case resetpass:
    //   return MaterialPageRoute(builder: (context) => resetpassword());
    case Signup:
      return MaterialPageRoute(builder: (context) => SigniupScreen());
    default:
      throw ('the route page does not exist');
  }
}
