import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hilo_bloc/Packages/CommonAssets/Colors.dart';
import 'package:hilo_bloc/Screens/ForgotPassword/Model/otpmodel.dart';
import 'package:hilo_bloc/Screens/ForgotPassword/bloc/bloc/fgpassword_bloc.dart';
import 'package:hilo_bloc/Utils/icons.dart';
import '../../../Packages/CommonAssets/TextStyle.dart';
import '../../../Widgets/Text.dart';
import '../../../Widgets/button.dart';
import '../../../Widgets/textformfield.dart';

import 'package:hilo_bloc/route.dart' as route;

import '../bloc/otp_bloc.dart';

class resetpassword extends StatelessWidget {
  Otpmodel otpmodel;
  resetpassword({required this.otpmodel});

  TextEditingController _Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FgpasswordBloc(
        RepositoryProvider.of(context),
      ),
      child: Scaffold(
        backgroundColor: color.FormColor,
        body: BlocConsumer<FgpasswordBloc, FgpasswordState>(
          listener: (context, state) {
            if (state is FgpasswordErrorState) {
              final snackBar = SnackBar(
                backgroundColor: color.FormColor,
                content: text(
                    data: "Please Enter Valid OTP" + state.error,
                    style: Text_Style.Error),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pop(context);
            }
            if (state is FgpasswordLoadedState) {
              Navigator.pushNamedAndRemoveUntil(context, route.signinpage, (route) => false);
            }

            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is FgpasswordLoadingState) {
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const CircularProgressIndicator(),
                    Text("Loading....")
                  ]));
            }
            if (state is FgpasswordLoadedState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text(
                        data: "Password Successfully updated",
                        style: Text_Style.Succesfull)
                  ],
                ),
              );
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      text(
                        data: "Reset your password",
                        style: Text_Style.Heading,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      text(
                        data: "Please enter your new password",
                        style: Text_Style.SecondaryNormal,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      textformfield(
                        obscuretext: false,
                        maxlength: 16,
                        textInputType: TextInputType.emailAddress,
                        controller: _Password,
                        HintText: "Enter Your Password",
                        prefixicon: icons.lockicon,
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
                          if (_Password.text.length >= 10) {
                            BlocProvider.of<FgpasswordBloc>(context).add(
                                LoadFgpasswordEvent(
                                    _Password.toString(), otpmodel));
                          } else {
                            final snackBar = SnackBar(
                              backgroundColor: color.FormColor,
                              content: text(
                                  data:
                                      "Please enter password more than 10 chars",
                                  style: Text_Style.Error),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }),
                        child: button(
                            alignment: Alignment.center,
                            height: 50,
                            width: MediaQuery.of(context).size.width * 90,
                            radius: 18,
                            ContainerColor: color.Main_Text,
                            borderColor: color.Main_Text,
                            buttontext: "Done",
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
