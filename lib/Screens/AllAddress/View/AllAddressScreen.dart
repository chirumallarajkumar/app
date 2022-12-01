import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hilo_bloc/Packages/CommonAssets/Colors.dart';
import 'package:hilo_bloc/Packages/CommonAssets/TextStyle.dart';
import 'package:hilo_bloc/Screens/AllAddress/bloc/all_address_bloc.dart';
import 'package:hilo_bloc/Screens/EditAddress/view/editAddress.dart';
import 'package:hilo_bloc/Widgets/Text.dart';

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
        body: BlocBuilder<AllAddressBloc, AllAddressState>(
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
              return ListView.builder(
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
                                    builder: (context) => EditAddress(
                                        addId: addressList[index].addId,
                                        userids: addressList[index].userids,
                                        addLabel: addressList[index].addLabel,
                                        addLine1: addressList[index].addLine1,
                                        addLine2: addressList[index].addLine2,
                                        city: addressList[index].city,
                                        state: addressList[index].state,
                                        pincode: addressList[index].pincode,
                                        contactNo: addressList[index].contactNo,
                                        addStatus:
                                            addressList[index].addStatus)),
                              );
                            }),
                            tileColor: addressList[index].addStatus == 0
                                ? Colors.transparent
                                : color.secondary,
                            shape: UnderlineInputBorder(
                                borderSide: BorderSide(color: color.Outline)),
                            leading: CircleAvatar(
                              backgroundColor: color.secondary,
                              child: Icon(
                                Icons.home,
                                color: color.FormColor,
                              ),
                            ),
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
                  });
            }
            if (state is AllAddressErrorState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  // Text(state.error),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListTile(
                      shape: UnderlineInputBorder(
                          borderSide: BorderSide(color: color.Outline)),
                      leading: CircleAvatar(
                        backgroundColor: color.secondary,
                        child: Icon(
                          Icons.home,
                          color: color.FormColor,
                        ),
                      ),
                      title: text(
                          data: "3rd floor, A-BLOCK, Sandil,",
                          style: Text_Style.Heading600),
                      subtitle: Wrap(
                        children: [
                          text(
                              data:
                                  "Jayabheri Enclave, Gachibowli, Hyderabad, Telangana 500032",
                              style: Text_Style.Headingnormal),
                          text(
                              data: "099492 26669",
                              style: Text_Style.Succesfull),
                        ],
                      ),
                    ),
                  )
                ],
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
