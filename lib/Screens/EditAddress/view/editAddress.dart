import 'package:flutter/material.dart';
import 'package:arawinzhilo/Packages/CommonAssets/Colors.dart';
import 'package:arawinzhilo/Packages/CommonAssets/TextStyle.dart';
import 'package:arawinzhilo/Screens/AddingAddress/repository/addaddressapi.dart';
import 'package:arawinzhilo/Widgets/Text.dart';
import 'package:arawinzhilo/Widgets/button.dart';
import 'package:arawinzhilo/Widgets/textformfield.dart';
import "package:arawinzhilo/route.dart" as route;

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
     required   this.addId,
      required this.userids,
      required  this.addLabel,
      required  this.addLine1,
       required this.addLine2,
       required this.city,
       required this.state,
       required this.pincode,
       required this.contactNo,
       required this.addStatus,   });
  

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  
 
 late TextEditingController addressline1 = TextEditingController( text: widget.addLine1);
 late TextEditingController addressline2 = new TextEditingController(text: widget.addLine2);
 late TextEditingController City = new TextEditingController(text: widget.city);
 late TextEditingController mobilenumber = new TextEditingController(text: widget.contactNo);
 late TextEditingController State = new TextEditingController(text: widget.state);
 late TextEditingController Pincode = new TextEditingController(text: widget.pincode.toString());
  

  final _formKey = GlobalKey<FormState>();
  bool validation = true;
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.primary,
        title: text(data: "Add Address", style: Text_Style.Form600),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                    suffixicon: IconButton(icon: Icon(null), onPressed: () {}),
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
      ),
    );
  }
}
