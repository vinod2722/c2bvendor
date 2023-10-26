import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/Colors.dart';
import '../../common/widgets.dart';
import '../../providers/providers.dart';

class BankPage extends StatefulWidget {
  const BankPage({super.key});

  @override
  State<BankPage> createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  bool isBankVisible = false;
  TextEditingController bankNameController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProviderVendor>(context, listen: false)
          .getBanks();
    });
    return  Consumer<ProviderVendor>(builder: (context, value, child) {
      if(identical(value.isBanksLoading, "LOADING") || identical(value.isBanksLoading, "ERROR")) {
        return CircularProgressIndicator();
      }
      return  Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text("Bank Name *", style: fontStyle50012(AppColors.bgBlack),),
            ),
            const SizedBox(height: 4,),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child:
                  TextFormField(
                    controller: bankNameController,
                    decoration: InputDecoration(
                        hintText: "Enter Bank Name",
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        suffixIcon: InkWell(
                          onTap: () {
                            print(isBankVisible);
                            setState(() {
                              isBankVisible = !isBankVisible;
                            });
                          },
                          child: Icon(
                            Icons.expand_more,
                          ),
                        )
                    ),
                  ),
                ),
                Visibility(
                  visible: isBankVisible,
                  child: Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        //itemCount: products.length,
                        physics: ClampingScrollPhysics(),
                        itemCount: value.bankData.bankList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var banks = value.bankData.bankList[index];
                          // final isSelected = selectedProducts.contains(banks.bankName);
                          return InkWell(
                            onTap: () {
                              print("jhdvsbfcjkadn--->...$index");
                              setState(() {
                                bankNameController.text = banks.bankName;
                                //isBank = false;
                                // if (isSelected) {
                                //   selectedProducts.remove(banks.bankName);
                                // } else {
                                //   selectedProducts.add(banks.bankName);
                                // }
                              });
                              // print(selectedProducts[index]);
                              // print(selectedProducts.length);
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  //child: Text(products[index]))
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          banks.bankName,
                                        ),
                                      ),
                                    ],
                                  ),)
                              ],
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
