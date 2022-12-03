import 'package:arawinzhilo/Utils/icons.dart';
import 'package:arawinzhilo/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arawinzhilo/Packages/CommonAssets/Colors.dart';
import 'package:arawinzhilo/Packages/CommonAssets/TextStyle.dart';
import 'package:arawinzhilo/Screens/AllAddress/bloc/all_address_bloc.dart';
import 'package:arawinzhilo/Screens/EditAddress/view/editAddress.dart';
import 'package:arawinzhilo/Widgets/Text.dart';
import 'package:arawinzhilo/route.dart' as route;
import '../../EditAddress/Repository/editAddressapi.dart';
import '../Model/allAddressModel.dart';

class AllAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllAddressBloc(
        RepositoryProvider.of(context),
      )..add(LoadAllAddressEvent()),
      child: Scaffold(
        backgroundColor: color.FormColor,
        body: BlocConsumer<AllAddressBloc, AllAddressState>(
          listener: (context, state) {
            if (state is AllAddressLoadingState) {
              BlocProvider.of<AllAddressBloc>(context)
                  .add(LoadAllAddressEvent());
            }
          },
          builder: (context, state) {
            if (state is AllAddressLoadingState) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  Text("Loading....")
                ],
              ));
            }
            if (state is AllAddressLoadedState) {
              List<alladdressmodel> addressList = state.address;
              return Scaffold(
                body: ListView.builder(
                    itemCount: addressList.length,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListTile(
                              onTap: (() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RepositoryProvider(
                                            create: (context) =>
                                                editAddressRepository(),
                                            child: EditAddress(
                                                addId: addressList[index].addId,
                                                userids:
                                                    addressList[index].userids,
                                                addLabel:
                                                    addressList[index].addLabel,
                                                addLine1:
                                                    addressList[index].addLine1,
                                                addLine2:
                                                    addressList[index].addLine2,
                                                city: addressList[index].city,
                                                state: addressList[index].state,
                                                pincode:
                                                    addressList[index].pincode,
                                                contactNo: addressList[index]
                                                    .contactNo,
                                                addStatus: addressList[index]
                                                    .addStatus),
                                          )),
                                );
                              }),
                              tileColor: Colors.transparent,
                              shape: UnderlineInputBorder(
                                  borderSide: BorderSide(color: color.Outline)),
                              leading: CircleAvatar(
                                  backgroundColor:
                                      addressList[index].addStatus == 1
                                          ? color.primary
                                          : color.Main_Text,
                                  child: addressList[index].addLabel == 'Home'
                                      ? Icon(Icons.home)
                                      : addressList[index].addLabel == 'Office'
                                          ? Icon(Icons.home_work)
                                          : addressList[index].addLabel ==
                                                  'Other'
                                              ? Icon(Icons.apartment)
                                              : null),
                              trailing: addressList[index].addStatus == 1
                                  ? Icon(Icons.check_circle,
                                      color: color.secondary)
                                  : Icon(null),
                              title: text(
                                  data: addressList[index].addLine1,
                                  style: Text_Style.Heading600),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    children: [
                                      text(
                                          data: addressList[index].addLine2 +
                                              addressList[index].city +
                                              addressList[index].state +
                                              addressList[index]
                                                  .pincode
                                                  .toString(),
                                          style: Text_Style.Headingnormal),
                                    ],
                                  ),
                                  text(
                                      data: addressList[index].contactNo,
                                      style: Text_Style.Succesfull),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, route.AddNewAddress);
                    },
                    child: button(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width * 90,
                        radius: 12,
                        ContainerColor: color.Main_Text,
                        borderColor: color.Main_Text,
                        buttontext: "Add Address",
                        buttontextStyle: Text_Style.Form600),
                  ),
                ),
              );
            }
            if (state is AllAddressErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: text(
                        data: "No addresses ",
                        style: Text_Style.Error,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                child: Text("Container"),
              );
            }
          },
        ),
      ),
    );
  }
}
