// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../common/Colors.dart';
// import '../../common/widgets.dart';
// import '../../providers/providers.dart';
//
// class BankRegistration extends StatefulWidget {
//   const BankRegistration({super.key});
//
//   @override
//   State<BankRegistration> createState() => _BankRegistrationState();
// }
//
// class _BankRegistrationState extends State<BankRegistration> {
//
//   final TextEditingController accountHolderName = TextEditingController();
//   final TextEditingController accountNumber = TextEditingController();
//   final TextEditingController bankName = TextEditingController();
//   final TextEditingController bankCityName = TextEditingController();
//   final TextEditingController branchName = TextEditingController();
//   final TextEditingController ifscCodeController = TextEditingController();
//
//
//   bool isBank = false;
//
//   @override
//   Widget build(BuildContext context) {
//
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<ProviderVendor>(context, listen: false)
//           .getBanks();
//     });
//       return Consumer<ProviderVendor>(builder: (context, value, child) {
//         if(identical(value, "ERROR") || identical(value, "LOADING")) {
//         return CircularProgressIndicator();
//       }
//       return  Container(
//         padding: EdgeInsets.all(16),
//         child:   Column(
//           children: [
//             textFormField("Account Holder Name  *", "Enter Account Holder Number",accountHolderName),
//             textFormField("Account Number  *", "Enter your Account Number",accountNumber),
//             //Container(child: textFormField("Bank Name number *", "Enter Bank Name",bankName)),
//             Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 16),
//                     child: Text("Bank Name *", style: fontStyle50012(AppColors.bgBlack),),
//                   ),
//                   const SizedBox(height: 4,),
//                   Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                             border: Border.all(),
//                             borderRadius: BorderRadius.circular(8)
//                         ),
//                         child: TextFormField(
//                           controller: bankName,
//                           decoration: InputDecoration(
//                               hintText: "Enter Bank Name",
//                               border: InputBorder.none,
//                               contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//                               suffixIcon: IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(Icons.expand_more),
//                               )
//                           ),
//                         ),
//                       ),
//                       Visibility(
//                         visible: isBank,
//                         child: Container(
//                           child: ListView.builder(
//                               shrinkWrap: true,
//                               //itemCount: products.length,
//                               itemCount: value.bankData.bankList.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 var banks = value.bankData.bankList[index];
//                                // final isSelected = selectedProducts.contains(banks.bankName);
//
//
//                                 return InkWell(
//                                   onTap: () {
//                                     print("jhdvsbfcjkadn--->...$index");
//                                     setState(() {
//                                       bankName.text = banks.bankName;
//                                       isBank = false;
//                                       // if (isSelected) {
//                                       //   selectedProducts.remove(banks.bankName);
//                                       // } else {
//                                       //   selectedProducts.add(banks.bankName);
//                                       // }
//                                     });
//                                     // print(selectedProducts[index]);
//                                     // print(selectedProducts.length);
//                                   },
//                                   child: Column(
//                                     children: [
//                                       Container(
//                                         padding: const EdgeInsets.all(16),
//                                         alignment: Alignment.topLeft,
//                                         decoration: BoxDecoration(
//                                             border: Border.all(),
//                                             borderRadius: BorderRadius.circular(8)
//                                         ),
//                                         //child: Text(products[index]))
//                                         child: Row(
//                                           children: [
//                                             Expanded(
//                                               child: Text(
//                                                 banks.bankName,
//                                                 style: TextStyle(
//                                                   //fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                                                 ),
//                                               ),
//                                             ),
//                                             //if (isSelected)
//                                               const Icon(
//                                                 Icons.check,
//                                                 color: Colors.green,
//                                               ),
//                                           ],
//                                         ),)
//                                     ],
//                                   ),
//                                 );
//                               }),
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             textFormField("City *", "Enter here",bankCityName),
//             textFormField("Branch *", "Enter Branch here",branchName),
//             textFormField("IFSC Code *", "Enter IFSC Code here",ifscCodeController),
//
//             const SizedBox(height: 24,),
//             ////////////Elevated Submit Button///////////////////////
//             Container(
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                     padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12)
//                 ),
//                 onPressed: () {
//                   //printValues();
//                   //goToNextStep();
//                 },
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Submit", style: fontStyle60016(AppColors.bgWhite),),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//     ;
//   }
// }
