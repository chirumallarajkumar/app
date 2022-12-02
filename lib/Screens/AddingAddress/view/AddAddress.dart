import 'package:arawinzhilo/Screens/AllAddress/bloc/all_address_bloc.dart';
import 'package:flutter/material.dart';
import 'package:arawinzhilo/Packages/CommonAssets/Colors.dart';
import 'package:arawinzhilo/Packages/CommonAssets/TextStyle.dart';
import 'package:arawinzhilo/Widgets/Text.dart';
import 'package:arawinzhilo/Widgets/button.dart';
import 'package:arawinzhilo/Widgets/textformfield.dart';
import "package:arawinzhilo/route.dart" as route;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/add_address_bloc.dart';

class typelabel {
  String label;
  Icon icon;
  typelabel(this.label, this.icon);
}

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  TextEditingController addressline1 = new TextEditingController();
  TextEditingController addressline2 = new TextEditingController();
  TextEditingController City = new TextEditingController();
  TextEditingController mobilenumber = new TextEditingController();
  TextEditingController State = new TextEditingController();
  TextEditingController Pincode = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool validation = true;
  bool light = false;
  var label;
  var selectedIndex;
  final List<typelabel> _chipsList = [
    typelabel("Home", Icon(Icons.home)),
    typelabel("Office", Icon(Icons.home_work)),
    typelabel("Other", Icon(Icons.other_houses))
  ];
  List<Widget> techChips() {
    List<Widget> chips = [];
    for (int i = 0; i < _chipsList.length; i++) {
      if (selectedIndex == null) {
        selectedIndex = 0;
        label = _chipsList[i].label;
      }
      Widget item = Padding(
          padding: const EdgeInsets.only(left: 0, right: 0),
          child: ChoiceChip(
              avatar: (_chipsList[i].icon),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              label: Text(_chipsList[i].label,
                  style: TextStyle(
                      color: selectedIndex == i
                          ? color.FormColor
                          : color.Main_Text)),
              selectedColor: color.primary,
              backgroundColor: Colors.grey.withOpacity(0.13),
              selected: selectedIndex == i,
              onSelected: (bool value) {
                setState(() {
                  selectedIndex = i;
                  label = _chipsList[i].label;
                });
              }));

      chips.add(item);
    }
    return chips;
  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAddressBloc(
        RepositoryProvider.of(context),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: color.primary,
          title: text(data: "Add Address", style: Text_Style.Form600),
        ),
        body: BlocConsumer<AddAddressBloc, AddAddressState>(
          listener: (context, state) {
            if (state is AddAddressErrorState) {
              final snackBar = SnackBar(
                content: text(data: state.error, style: Text_Style.Error),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is AddAddressLoadedState) {
              if (state.addAddressmodel.status == 1) {
                Navigator.pop(context);
              }
            }
          },
          builder: (context, state) {
            if (state is AddAddressLoadingState) {
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const CircularProgressIndicator(),
                    Text("Loading....")
                  ]));
            }
            if (state is AddAddressLoadedState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text(
                        data: "Address Succesfully added",
                        style: Text_Style.Succesfull)
                  ],
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Wrap(
                          spacing: 15,
                          direction: Axis.horizontal,
                          children: techChips(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        runSpacing: 25,
                        children: [
                          textformfield(
                            obscuretext: false,
                            maxlength: 40,
                            textInputType: TextInputType.emailAddress,
                            controller: addressline1,
                            HintText: "House/Flat/BlockNo",
                            prefixicon: Icon(null),
                            suffixicon:
                                IconButton(icon: Icon(null), onPressed: () {}),
                            radius: 15,
                          ),
                          textformfield(
                              obscuretext: false,
                              maxlength: 40,
                              textInputType: TextInputType.emailAddress,
                              controller: addressline2,
                              HintText: "Apartment/Road No/Area",
                              prefixicon: Icon(null),
                              suffixicon: IconButton(
                                  icon: Icon(null), onPressed: () {}),
                              radius: 15),
                          textformfield(
                              obscuretext: false,
                              maxlength: 20,
                              textInputType: TextInputType.emailAddress,
                              controller: City,
                              HintText: "City",
                              prefixicon: Icon(null),
                              suffixicon: IconButton(
                                  icon: Icon(null), onPressed: () {}),
                              radius: 15),
                          textformfield(
                              obscuretext: false,
                              maxlength: 20,
                              textInputType: TextInputType.emailAddress,
                              controller: State,
                              HintText: "State",
                              prefixicon: Icon(null),
                              suffixicon: IconButton(
                                  icon: Icon(null), onPressed: () {}),
                              radius: 15),
                          textformfield(
                              obscuretext: false,
                              maxlength: 6,
                              textInputType: TextInputType.number,
                              controller: Pincode,
                              HintText: "Pincode",
                              prefixicon: Icon(null),
                              suffixicon: IconButton(
                                  icon: Icon(null), onPressed: () {}),
                              radius: 15),
                          textformfield(
                              obscuretext: false,
                              maxlength: 10,
                              textInputType: TextInputType.number,
                              controller: mobilenumber,
                              HintText: "Mobile",
                              prefixicon: Icon(null),
                              suffixicon: IconButton(
                                  icon: Icon(null), onPressed: () {}),
                              radius: 15),
                          Row(
                            children: [
                              text(
                                  data: "Make it priority",
                                  style: Text_Style.Heading600),
                              Switch(
                                // This bool value toggles the switch.
                                value: light,
                                onChanged: (bool value) {
                                  // This is called when the user toggles the switch.
                                  setState(() {
                                    light = value;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          print("543.5");
                          if (addressline1.text.length == 0) {
                            final snackBar = SnackBar(
                              content: text(
                                  data: "Please Enter Addressline1",
                                  style: Text_Style.Error),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (addressline2.text.length == 0) {
                            final snackBar = SnackBar(
                              content: text(
                                  data: "Please Enter Addressline2",
                                  style: Text_Style.Error),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (City.text.length == 0) {
                            final snackBar = SnackBar(
                              content: text(
                                  data: "Please Enter city",
                                  style: Text_Style.Error),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (State.text.length == 0) {
                            final snackBar = SnackBar(
                              content: text(
                                  data: "Please Enter state",
                                  style: Text_Style.Error),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (Pincode.text.length == 0) {
                            final snackBar = SnackBar(
                              content: text(
                                  data: "Please Enter pincode",
                                  style: Text_Style.Error),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (mobilenumber.text.length == 0) {
                            final snackBar = SnackBar(
                              content: text(
                                  data: "Please Enter Mobile NUmber",
                                  style: Text_Style.Error),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (label.length == 0) {
                            final snackBar = SnackBar(
                              content: text(
                                  data: "Please Enter Addressline2",
                                  style: Text_Style.Error),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            var priority = light ? 1 : 0;
                            BlocProvider.of<AddAddressBloc>(context).add(
                                LoadAddAddressEvent(
                                    mobilenumber.text,
                                    label,
                                    addressline1.text,
                                    addressline2.text,
                                    City.text,
                                    State.text,
                                    priority.toString(),
                                    Pincode.text));
                          }
                        },
                        child: button(
                            alignment: Alignment.center,
                            height: 50,
                            width: MediaQuery.of(context).size.width * 90,
                            radius: 12,
                            ContainerColor: validation == true
                                ? color.primary
                                : color.Secondary_Text,
                            borderColor: validation == true
                                ? color.primary
                                : color.Secondary_Text,
                            buttontext: "Submit",
                            buttontextStyle: Text_Style.Form600),
                      )
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
