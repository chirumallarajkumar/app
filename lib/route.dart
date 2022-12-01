import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arawinzhilo/Screens/AddingAddress/view/AddAddress.dart';
import 'package:arawinzhilo/Screens/AllAddress/Repository/alladdressesapi.dart';
import 'package:arawinzhilo/Screens/AllAddress/View/AllAddressScreen.dart';
import 'package:arawinzhilo/Screens/ForgotPassword/View/forgotpasssword.dart';
import 'package:arawinzhilo/Screens/ForgotPassword/View/otpscreenfg.dart';
import 'package:arawinzhilo/Screens/ForgotPassword/View/resetpassword.dart';
import 'package:arawinzhilo/Screens/SignInScreen/View/Signinpage.dart';
import 'package:arawinzhilo/Screens/SignupScreen/View/SIgnupScreen.dart';
import 'package:arawinzhilo/Screens/SplashScreen/View/SplashPage.dart';

import 'Screens/ForgotPassword/Repository/otpapi.dart';
import 'Screens/SignInScreen/Repository/signinvalidation.dart';
import 'Screens/SignupScreen/Repository/mobileRepository.dart';
import 'Screens/SignupScreen/View/signupmobile.dart';

const String signinpage = 'signin';
const String splashscreen = 'SplashScreen';
const String AddNewAddress = "AddAddress";
const String AllAddress = "AllAddress";
const String Editaddress = "EditAddress";
const String forgotpassw = "forgotpasssword";
const String otpscreenforgot = "otpscreenforgot";
const String resetpass = "resetpass";
const String Signup = "Signup";
const String Signupmbl = "Signupmobile";

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
    // case Signup:
    //   return MaterialPageRoute(builder: (context) => SigniupScreen());
    case Signupmbl:
    
      return MaterialPageRoute(
        
          builder: (context) => RepositoryProvider(
                create: (context) => mobileRepository(),
                child: Signupmobile(),
              ));

    default:
      throw ('the route page does not exist');
  }
}
