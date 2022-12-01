import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arawinzhilo/Packages/CommonAssets/Colors.dart';
import 'package:arawinzhilo/Packages/CommonAssets/TextStyle.dart';
import 'package:arawinzhilo/Screens/SignInScreen/bloc/signin_bloc_bloc.dart';
import 'package:arawinzhilo/Utils/icons.dart';
import 'package:arawinzhilo/Widgets/Text.dart';
import 'package:arawinzhilo/Widgets/button.dart';
import 'package:arawinzhilo/Widgets/textformfield.dart';
import "package:arawinzhilo/route.dart" as route;
import 'package:shared_preferences/shared_preferences.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({super.key});
  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  TextEditingController _emailPhone = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninBlocBloc(
        RepositoryProvider.of(context),
      ),
      child: Scaffold(
          backgroundColor: color.FormColor,
          body: BlocConsumer<SigninBlocBloc, SigninBlocState>(
            listener: (context, state) async {
              if (state is SigninBlocErrorState) {
                final snackBar = SnackBar(
                  content: text(data: state.error, style: Text_Style.Error),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              if (state is SigninBlocLoadedState) {
                print("object");
                if (state.signinmodel.status == 1) {
                  final snackBar = SnackBar(
                    content: text(
                        data: state.signinmodel.userData.userName,
                        style: Text_Style.Succesfull),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('tkn', state.signinmodel.tkn);
                  await prefs.setString(
                      'user_id', state.signinmodel.userData.userId.toString());
                  Navigator.pushReplacementNamed(context, route.AllAddress);
                } else {
                  final snackBar = SnackBar(
                    backgroundColor: Colors.white,
                    content: text(
                        data: "Invalid Credentials !!!",
                        style: Text_Style.Error),
                  );
                }
              }
            },
            builder: (context, state) {
              if (state is SigninBlocLoadingState) {
               
               return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const CircularProgressIndicator(),
                  Text("Loading....")
                ]);
              }
              if (state is SigninBlocIntialState) {
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
                            data: "Welcome Back!",
                            style: Text_Style.Heading,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          text(
                            data: "Please enter your account here",
                            style: Text_Style.SecondaryNormal,
                          ),
                          SizedBox(
                            height: 20,
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
                            height: 15,
                          ),
                          textformfield(
                            obscuretext: obscure,
                            maxlength: 16,
                            textInputType: TextInputType.emailAddress,
                            controller: _password,
                            HintText: "Password",
                            prefixicon: icons.lockicon,
                            suffixicon: IconButton(
                              icon: obscure
                                  ? icons.visibilityofficon
                                  : icons.visibilityicon,
                              onPressed: () {
                                setState(() {
                                  obscure = !obscure;
                                });
                              },
                            ),
                            radius: 30,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, route.forgotpassw);
                              },
                              child: text(
                                data: "Forgot password?",
                                style: Text_Style.Heading600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              if (_emailPhone.text.length == 10 &&
                                  _password.text.length >= 4) {
                                final snackBar = SnackBar(
                                  backgroundColor: Colors.white,
                                  content: text(
                                      data: "All data success fully entered",
                                      style: Text_Style.Succesfull),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);

                                BlocProvider.of<SigninBlocBloc>(context).add(
                                    LoadSigninBlocEvent(
                                        _emailPhone.text, _password.text));
                              } else {
                                if (_emailPhone.text.length != 10) {
                                  final snackBar = SnackBar(
                                    backgroundColor: Colors.white,
                                    content: text(
                                        data:
                                            "Please enter 10 digit Mobile Number",
                                        style: Text_Style.Error),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else if (_password.text.length <= 4) {
                                  final snackBar = SnackBar(
                                    backgroundColor: Colors.white,
                                    content: text(
                                        data:
                                            "Password should have minimum 4 chars",
                                        style: Text_Style.Error),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              }
                            },
                            child: button(
                                alignment: Alignment.center,
                                height: 50,
                                width: MediaQuery.of(context).size.width * 90,
                                radius: 18,
                                ContainerColor: color.primary,
                                borderColor: color.primary,
                                buttontext: "Login",
                                buttontextStyle: Text_Style.Form600),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              text(
                                  data: "Don't have any account ?",
                                  style: Text_Style.Headingnormal),
                              InkWell(
                                onTap: (() {
                                  Navigator.pushNamed(context, route.Signupmbl);
                                }),
                                child: text(
                                    data: " Sign Up",
                                    style: Text_Style.primaryNormal),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
              if (state is SigninBlocErrorState) {
                return text(data: state.error, style: Text_Style.Error);
              } else {
                return SizedBox();
              }
            },
          )),
    );
  }
}
