import 'package:arawinzhilo/Screens/EditAddress/bloc/edit_address_bloc.dart';
import 'package:flutter/material.dart';
import 'package:arawinzhilo/Packages/CommonAssets/Colors.dart';
import 'package:arawinzhilo/Packages/CommonAssets/TextStyle.dart';
import 'package:arawinzhilo/Widgets/Text.dart';
import 'package:arawinzhilo/Widgets/button.dart';
import 'package:arawinzhilo/Widgets/textformfield.dart';
import "package:arawinzhilo/route.dart" as route;
import 'package:flutter_bloc/flutter_bloc.dart';
class typelabel {
  String label;
  Icon icon;
  typelabel(this.label, this.icon);
}

class EditAddress extends StatefulWidget {
  int addId;
  int userids;
  String addLabel;
  String addLine1;
  String addLine2;
  String city;
  String state;
  int pincode;
  String contactNo;
  int addStatus;
  EditAddress({
    required this.addId,
    required this.userids,
    required this.addLabel,
    required this.addLine1,
    required this.addLine2,
    required this.city,
    required this.state,
    required this.pincode,
    required this.contactNo,
    required this.addStatus,
  });

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  late TextEditingController addressline1 =
      TextEditingController(text: widget.addLine1);
  late TextEditingController addressline2 =
      new TextEditingController(text: widget.addLine2);
  late TextEditingController City =
      new TextEditingController(text: widget.city);
  late TextEditingController mobilenumber =
      new TextEditingController(text: widget.contactNo);
  late TextEditingController State =
      new TextEditingController(text: widget.state);
  late TextEditingController Pincode =
      new TextEditingController(text: widget.pincode.toString());

  final _formKey = GlobalKey<FormState>();
  bool validation = true;
  var label;
  var selectedIndex;
   bool light = false;
  final List<typelabel> _chipsList = [
    typelabel("Home", Icon(Icons.home)),
    typelabel("Office", Icon(Icons.home_work)),
    typelabel("Other", Icon(Icons.other_houses))
  ];
  List<Widget> techChips() {
    List<Widget> chips = [];
    for (int i = 0; i < _chipsList.length; i++) {
      if (selectedIndex == null) {
        if(widget.addLabel=='Home'){
           selectedIndex = 0;
        label = _chipsList[selectedIndex].label;
        }
        if(widget.addLabel=='Office'){
           selectedIndex = 1;
        label = _chipsList[selectedIndex].label;
        }
         if(widget.addLabel=='Other'){
           selectedIndex = 1;
        label = _chipsList[selectedIndex].label;
        }
       
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
      create: (context) => EditAddressBloc(
        RepositoryProvider.of(context),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: color.primary,
          title: text(data: "Add Address", style: Text_Style.Form600),
        ),
        body: BlocConsumer<EditAddressBloc, EditAddressState>(
          listener: (context, state) {
            // TODO: implement listener
             if (state is AddAddressErrorState) {
              final snackBar = SnackBar(
                content: text(data: state.error, style: Text_Style.Error),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is AddAddressLoadedState) {
              if (state.editAddress.status == 1) {
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
            } else{
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
                            suffixicon:
                                IconButton(icon: Icon(null), onPressed: () {}),
                            radius: 15),
                        textformfield(
                            obscuretext: false,
                            maxlength: 20,
                            textInputType: TextInputType.emailAddress,
                            controller: City,
                            HintText: "City",
                            prefixicon: Icon(null),
                            suffixicon:
                                IconButton(icon: Icon(null), onPressed: () {}),
                            radius: 15),
                        textformfield(
                            obscuretext: false,
                            maxlength: 20,
                            textInputType: TextInputType.emailAddress,
                            controller: State,
                            HintText: "State",
                            prefixicon: Icon(null),
                            suffixicon:
                                IconButton(icon: Icon(null), onPressed: () {}),
                            radius: 15),
                        textformfield(
                            obscuretext: false,
                            maxlength: 6,
                            textInputType: TextInputType.number,
                            controller: Pincode,
                            HintText: "Pincode",
                            prefixicon: Icon(null),
                            suffixicon:
                                IconButton(icon: Icon(null), onPressed: () {}),
                            radius: 15),
                        textformfield(
                            obscuretext: false,
                            maxlength: 10,
                            textInputType: TextInputType.number,
                            controller: mobilenumber,
                            HintText: "Mobile",
                            prefixicon: Icon(null),
                            suffixicon:
                                IconButton(icon: Icon(null), onPressed: () {}),
                            radius: 15)
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        print(addressline1.text);
                        var priority = light ? 1 : 0;
                          BlocProvider.of<EditAddressBloc>(context).add(LoadEditAddressEvent(  mobilenumber.text,
                                    label,
                                    addressline1.text,
                                    addressline2.text,
                                    City.text,
                                    State.text,
                                    priority.toString(),
                                    Pincode.text, widget.addId.toString()));

                        // Navigator.pushNamed(context, route.AddNewAddress);
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
