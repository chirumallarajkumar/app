import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arawinzhilo/Packages/CommonAssets/Colors.dart';
import 'package:arawinzhilo/Screens/ForgotPassword/Model/otpmodel.dart';
import 'package:arawinzhilo/Screens/ForgotPassword/Repository/passwordfgapi.dart';
import 'package:arawinzhilo/Screens/ForgotPassword/View/resetpassword.dart';
import 'package:arawinzhilo/Utils/icons.dart';
import '../../../Packages/CommonAssets/TextStyle.dart';
import '../../../Widgets/Text.dart';
import '../../../Widgets/button.dart';
import '../../../Widgets/textformfield.dart';

import 'package:arawinzhilo/route.dart' as route;

class otpscreenfg extends StatelessWidget {
  final Otpmodel otpmodel;
  otpscreenfg({required this.otpmodel});
  final TextEditingController _otpcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.FormColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text(
                data: "Check your mobile",
                style: Text_Style.Heading,
              ),
              SizedBox(
                height: 15,
              ),
              text(
                data: "OTP sent to your Mobile Number",
                style: Text_Style.SecondaryNormal,
              ),
              SizedBox(
                height: 25,
              ),
              textformfield(
                obscuretext: false,
                maxlength: 6,
                textInputType: TextInputType.number,
                controller: _otpcontroller,
                HintText: otpmodel.otp,
                prefixicon: icons.pinicon,
                suffixicon: IconButton(
                  onPressed: () {},
                  icon: Icon(null),
                ),
                radius: 30,
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RepositoryProvider(
                                create: (context) => fgpasswordRepository(),
                                child: resetpassword(otpmodel: otpmodel),
                              )));
                }),
                child: button(
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width * 90,
                    radius: 18,
                    ContainerColor: color.Main_Text,
                    borderColor: color.Main_Text,
                    buttontext: "Submit Otp",
                    buttontextStyle: Text_Style.Form600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
