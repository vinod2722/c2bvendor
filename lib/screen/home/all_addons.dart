import 'package:c2b_vendor/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

class AllAddons extends StatefulWidget {
  const AllAddons({super.key});

  @override
  State<AllAddons> createState() => _AllAddonsState();
}

class _AllAddonsState extends State<AllAddons> {

  // List<bool> value= [];
  List<bool> showFields = [];

  final LocalStorage userToken = LocalStorage('user_token');
  late String token = '';

  Future<void> getData() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProviderVendor>(context, listen: false)
          .getAddonList(token);

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    token = userToken.getItem('token');
    getData();

  }
  @override
  Widget build(BuildContext context) {

    // Widget buildSwitch () => Transform.scale(
    //   scale: 1,
    //   child: Switch.adaptive(
    //     activeColor: AppColors.bgGreen,
    //       activeTrackColor: AppColors.bgGreen,
    //       inactiveThumbColor: AppColors.cvPink,
    //       value: value,
    //       onChanged: (value) => setState(() => this.value  = value)),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text("Add-ons"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Consumer<ProviderVendor>(builder: (context, value, child) {
          if(identical(value.isAddonLoading, "NOT_STARTED") || identical(value.isAddonLoading, "LOADING")) {
            return Center(child: CircularProgressIndicator());
          }else {
          //showFields =  List.generate(value.addonList.addOns.length, (index) => false);
            showFields = List.generate(value.addonList.addOns.length, (index) => value.addonList.addOns[index].available == 1);

            return Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: value.addonList.addOns.length,
                    itemBuilder: (BuildContext context, int index) {
                      var addon = value.addonList;
                      return Container(
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(addon.addOns[index].name),
                                    Transform.scale(
                                      scale: 1,
                                      child: Switch.adaptive(
                                          activeColor: AppColors.bgGreen,
                                          activeTrackColor: AppColors.bgGreen,
                                          inactiveThumbColor: AppColors.cvPink,
                                          value: showFields[index],
                                          onChanged: (value) async  {
                                            setState(() {
                                              showFields[index] = value;
                                              getData();
                                            });
                                          var ad = addon.addOns[index];
                                            await Provider.of<ProviderVendor>(context, listen: false).updateAddonAvailability(token, ad.id, ad.name, ad.price, ad.comparedPrice, value);

                                          }
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text("Price : ${addon.addOns[index].price.toString()}")),
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text("Available:  ${addon.addOns[index].available == 1 ? "Available" : "Unavailable"}")),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
              ],
            );
          }

        })



      ),
    );
  }
}
