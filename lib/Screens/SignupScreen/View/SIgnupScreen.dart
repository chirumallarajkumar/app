import 'package:arawinzhilo/Screens/SignupScreen/Model/MobileOtpmodel.dart';
import 'package:arawinzhilo/Screens/SignupScreen/View/signupmobile.dart';
import 'package:arawinzhilo/Screens/SignupScreen/bloc/bloc/adduser_bloc.dart';
import 'package:arawinzhilo/Screens/SignupScreen/bloc/signupmobile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:arawinzhilo/Utils/icons.dart';
import "package:arawinzhilo/route.dart" as route;

import 'package:arawinzhilo/Packages/CommonAssets/Colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Packages/CommonAssets/TextStyle.dart';
import '../../../Widgets/Text.dart';
import '../../../Widgets/button.dart';
import '../../../Widgets/textformfield.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen(this.mobileOtpmodel, this.mobile);
  MobileOtpmodel mobileOtpmodel;
  final String mobile;
  TextEditingController _emailPhone = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _name = new TextEditingController();

  TextEditingController _otp = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdduserBloc(
        RepositoryProvider.of(context),
      ),
      child: Scaffold(
        backgroundColor: color.FormColor,
        body: BlocConsumer<AdduserBloc, AdduserState>(
          listener: (context, state) async {
            if (state is AdduserErrorState) {
              final snackBar = SnackBar(
                content: text(data: state.error, style: Text_Style.Error),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is AdduserLoadedState) {
              print("object");
              if (state.addusermodel.status == 1) {
                final snackBar = SnackBar(
                  content: text(
                      data: state.addusermodel.userData.userName,
                      style: Text_Style.Succesfull),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('tkn', state.addusermodel.tkn);
                await prefs.setString(
                    'user_id', state.addusermodel.userData.userId.toString());
                Navigator.pushReplacementNamed(context, route.AllAddress);
              } else {
                final snackBar = SnackBar(
                  backgroundColor: Colors.white,
                  content: text(
                      data: "Check the details you entered",
                      style: Text_Style.Error),
                );
              }
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is AdduserLoadingState) {
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const CircularProgressIndicator(),
                    Text("Loading....")
                  ]));
            }
            if (state is AdduserLoadedState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text(
                        data: "User Successfull registered",
                        style: Text_Style.Succesfull)
                  ],
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3.5,
                        ),
                        text(
                          data: "Welcome to Hilo!",
                          style: Text_Style.Heading,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        text(
                          data: "Please enter your details here",
                          style: Text_Style.SecondaryNormal,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        textformfield(
                          obscuretext: false,
                          maxlength: 6,
                          textInputType: TextInputType.name,
                          controller: _otp,
                          HintText: mobileOtpmodel.otp,
                          prefixicon: icons.pinicon,
                          suffixicon: IconButton(
                            onPressed: () {},
                            icon: Icon(null),
                          ),
                          radius: 30,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        textformfield(
                          obscuretext: false,
                          maxlength: 20,
                          textInputType: TextInputType.name,
                          controller: _name,
                          HintText: "Full Name",
                          prefixicon: icons.personicon,
                          suffixicon: IconButton(
                            onPressed: () {},
                            icon: Icon(null),
                          ),
                          radius: 30,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        textformfield(
                          obscuretext: false,
                          maxlength: 30,
                          textInputType: TextInputType.multiline,
                          controller: _emailPhone,
                          HintText: "Email Id",
                          prefixicon: icons.emailicon,
                          suffixicon: IconButton(
                            onPressed: () {},
                            icon: Icon(null),
                          ),
                          radius: 30,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        textformfield(
                          obscuretext: false,
                          maxlength: 16,
                          textInputType: TextInputType.emailAddress,
                          controller: _password,
                          HintText: "Password",
                          prefixicon: icons.lockicon,
                          suffixicon: IconButton(
                            onPressed: () {},
                            icon: Icon(null),
                          ),
                          radius: 30,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            if (_name.text == null || _name.text.length <= 3) {
                              final snackBar = SnackBar(
                                content: text(
                                    data: "Please check your name",
                                    style: Text_Style.Error),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else if (_emailPhone.text.contains('@')
                                ? false
                                : true) {
                              final snackBar = SnackBar(
                                content: text(
                                    data: "Please enter valid maild id",
                                    style: Text_Style.Error),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else if (_password.text.length < 6 ||
                                _password.text.length > 16) {
                              final snackBar = SnackBar(
                                content: text(
                                    data:
                                        "Please enter password in range 6-16 chars",
                                    style: Text_Style.Error),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              final snackBar = SnackBar(
                                backgroundColor: color.FormColor,
                                content: text(
                                    data: "All details perfectly entered",
                                    style: Text_Style.Succesfull),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              BlocProvider.of<AdduserBloc>(context).add(
                                  LoadAdduserEvent(
                                      mobile,
                                      _emailPhone.text,
                                      _name.text,
                                      mobileOtpmodel.otp,
                                      mobileOtpmodel.otpToken,
                                      _password.text));
                            }
                          },
                          child: button(
                              alignment: Alignment.center,
                              height: 50,
                              width: MediaQuery.of(context).size.width * 90,
                              radius: 18,
                              ContainerColor: color.primary,
                              borderColor: color.primary,
                              buttontext: "Sign Up",
                              buttontextStyle: Text_Style.Form600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
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
