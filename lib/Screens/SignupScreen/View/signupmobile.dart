import 'package:arawinzhilo/Screens/SignupScreen/Model/MobileOtpmodel.dart';
import 'package:arawinzhilo/Screens/SignupScreen/View/SIgnupScreen.dart';
import 'package:flutter/material.dart';
import 'package:arawinzhilo/Packages/CommonAssets/Colors.dart';
import 'package:arawinzhilo/Utils/icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Packages/CommonAssets/TextStyle.dart';
import '../../../Widgets/Text.dart';
import '../../../Widgets/button.dart';
import '../../../Widgets/textformfield.dart';
import 'package:arawinzhilo/route.dart' as route;

import '../bloc/signupmobile_bloc.dart';

class Signupmobile extends StatelessWidget {
  

  TextEditingController _emailPhone = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupmobileBloc(
        RepositoryProvider.of(context),
      ),
      child: Scaffold(
        backgroundColor: color.FormColor,
        body: BlocConsumer<SignupmobileBloc, SignupmobileState>(
          listener: (context, state) {
            if (state is OtpLoadedState) {
              print("Successfully loaded");
              if (state.mobileOtpmodel == null) {
                final snackBar = SnackBar(
                  backgroundColor: color.FormColor,
                  content: text(
                      data: "Please Enter Registered mobile number",
                      style: Text_Style.Error),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignupScreen(state.mobileOtpmodel)),
                );
              }
            }
            if (state is OtpErrorState) {
              final snackBar = SnackBar(
                backgroundColor: color.FormColor,
                content: text(
                    data: "Your Mobile Number already registered" + state.error,
                    style: Text_Style.Error),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is OtpLoadingState) {
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const CircularProgressIndicator(),
                    Text("Loading....")
                  ]));
            }
            if (state is OtpLoadedState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text(
                        data: "Otp Successfullty generated",
                        style: Text_Style.Succesfull)
                  ],
                ),
              );
            }
            else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text(
                      data: "Registration",
                      style: Text_Style.Heading,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    text(
                      data: "Enter Your 10 digit Mobile Number",
                      style: Text_Style.SecondaryNormal,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    textformfield(
                      obscuretext: false,
                      maxlength: 10,
                      textInputType: TextInputType.number,
                      controller: _emailPhone,
                      HintText: "phone number",
                      prefixicon: icons.callicon,
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
                        if (_emailPhone.text.length == 10) {
                             BlocProvider.of<SignupmobileBloc>(context)
                                .add(LoadSignupmobileEvent(_emailPhone.text));
                        } else {
                          final snackBar = SnackBar(
                            backgroundColor: color.FormColor,
                            content: text(
                                data: "Please enter 10 digit mobile number",
                                style: Text_Style.Error),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }),
                      child: button(
                          alignment: Alignment.center,
                          height: 50,
                          width: MediaQuery.of(context).size.width * 90,
                          radius: 18,
                          ContainerColor: color.Main_Text,
                          borderColor: color.Main_Text,
                          buttontext: "Send Otp",
                          buttontextStyle: Text_Style.Form600),
                    ),
                  ],
                ),
              ),
            );
            }
          },
        ),
      ),
    );
  }
}
