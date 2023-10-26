// // // import 'package:flutter/material.dart';
// // //
// // // import '../../common/Colors.dart';
// // // import '../../common/widgets.dart';
// // //
// // // class OrdersPage extends StatefulWidget {
// // //   //const MyOrdersPage({super.key});
// // //   const OrdersPage();
// // //
// // //   @override
// // //   State<OrdersPage> createState() => _OrdersPageState();
// // // }
// // //
// // // class _OrdersPageState extends State<OrdersPage> with TickerProviderStateMixin {
// // //   final List<OrderStatus> orderStatusList = [
// // //     OrderStatus("12:55 PM", "Order is Delivered"),
// // //     OrderStatus("12:45 PM", "Order Transit"),
// // //     OrderStatus("12:10 PM", "Order Processing"),
// // //     OrderStatus("12:05 PM", "Order placed"),
// // //   ];
// // //
// // //
// // //   late TabController _tabController;
// // //   late TabController _tabController1;
// // //
// // //   late  bool onTap = false;
// // //   bool isAccept = false;
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _tabController = TabController(
// // //       length: 2, // Number of tabs
// // //       vsync: this,
// // //     );
// // //     _tabController1 = TabController(
// // //       length: 3, // Number of tabs
// // //       vsync: this,
// // //     );
// // //   }
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return   Scaffold(
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.transparent,
// // //         elevation: 0,
// // //         title: Text("My Orders", style: fontStyleHeading(AppColors.bgBlack),),
// // //         centerTitle: true,
// // //         leading: IconButton(
// // //           onPressed: () {
// // //             Navigator.pop(context);
// // //           },
// // //           icon: Icon(Icons.arrow_back, color: AppColors.bgBlack,),
// // //         ),
// // //         actions: [
// // //           Image.asset("assets/images/FAQ.png")
// // //           //Icon(Icons.add, color: AppColors.cvPink,)
// // //         ],
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           children: [
// // //             Container(
// // //               padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
// // //               height: 60,
// // //               decoration: BoxDecoration(
// // //                 color:AppColors.cvPink,
// // //                 borderRadius: BorderRadius.circular(
// // //                   30.0,
// // //                 ),
// // //               ),
// // //               child: TabBar(
// // //                 controller: _tabController,
// // //                 // give the indicator a decoration (color and border radius)
// // //                 indicator: BoxDecoration(
// // //                   borderRadius: BorderRadius.circular(
// // //                     30.0,
// // //                   ),
// // //                   boxShadow: const [
// // //                     BoxShadow(
// // //                       blurRadius: 12,
// // //                       spreadRadius: 0,
// // //                       color: Color.fromRGBO(0, 0, 0, 0.12),
// // //                       offset: Offset(0, 0),
// // //
// // //                     )
// // //                   ],
// // //                   color: AppColors.bgWhite,
// // //                 ),
// // //                 labelColor: AppColors.bgBlack,
// // //                 unselectedLabelColor: Colors.black,
// // //                 labelStyle: fontStyle60016(AppColors.bgBlack),
// // //                 tabs: const [
// // //
// // //                   Tab(
// // //                     text: 'Current orders(04)',
// // //                   ),
// // //
// // //
// // //                   Tab(
// // //                     text: 'Delivered orders',
// // //                   ),
// // //
// // //
// // //                 ],
// // //               ),
// // //             ),
// // //             //////////seconf tabbbar///////////////
// // //             Container(
// // //               padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
// // //               height: 60,
// // //               decoration: BoxDecoration(
// // //                 color:AppColors.cvPink,
// // //                 borderRadius: BorderRadius.circular(
// // //                   30.0,
// // //                 ),
// // //               ),
// // //               child: TabBar(
// // //                 controller: _tabController1,
// // //                 // give the indicator a decoration (color and border radius)
// // //                 indicator: BoxDecoration(
// // //                   borderRadius: BorderRadius.circular(
// // //                     30.0,
// // //                   ),
// // //                   boxShadow: const [
// // //                     BoxShadow(
// // //                       blurRadius: 12,
// // //                       spreadRadius: 0,
// // //                       color: Color.fromRGBO(0, 0, 0, 0.12),
// // //                       offset: Offset(0, 0),
// // //
// // //                     )
// // //                   ],
// // //                   color: AppColors.bgWhite,
// // //                 ),
// // //                 labelColor: AppColors.bgBlack,
// // //                 unselectedLabelColor: Colors.black,
// // //                 labelStyle: fontStyle60016(AppColors.bgBlack),
// // //                 tabs: const [
// // //
// // //                   Tab(
// // //                     text: 'Current orders(04)',
// // //                   ),
// // //
// // //
// // //                   Tab(
// // //                     text: 'Current unaccepted Orders',
// // //                   ),
// // //
// // //
// // //                 ],
// // //               ),
// // //             ),
// // //             // tab bar view here
// // //             Expanded(
// // //               child: TabBarView(
// // //                 controller: _tabController,
// // //                 children:  [
// // //                   // first tab bar view widget
// // //                   ListView.builder(
// // //                       itemCount: orderStatusList.length,
// // //                       itemBuilder: (BuildContext context, int index) {
// // //                         return   Column(
// // //                           children: [
// // //                             const SizedBox(height: 20,),
// // //                             InkWell(
// // //                               onTap: (){
// // //                                 setState(() {
// // //                                   onTap = !onTap;
// // //                                 });
// // //                               },
// // //                               child: Container(
// // //                                 padding: const EdgeInsets.only(left: 16, top: 16,right: 16),
// // //                                 decoration: BoxDecoration(
// // //                                     border: Border.all(color: AppColors.greyBorder),
// // //                                     borderRadius: BorderRadius.circular(24)
// // //                                 ),
// // //                                 child:  Column(
// // //                                   children: [
// // //                                     Row(
// // //                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                                       children: [
// // //                                         Text("21/08/23-12:15", style: fontStyle40012(AppColors.bgBlack),),
// // //                                         Container(
// // //                                             padding:const  EdgeInsets.only(left: 12, right: 12,top: 8, bottom: 8),
// // //                                             decoration: BoxDecoration(
// // //                                                 color: AppColors.bgGreen2,
// // //                                                 borderRadius: BorderRadius.circular(20)
// // //                                             ),
// // //                                             child: Text("Delivery in progress", style: TextStyle(color: AppColors.bgGreen3, fontSize: 12,
// // //                                               fontWeight: FontWeight.w500,),))
// // //                                       ],
// // //                                     ),
// // //                                     Row(
// // //                                       children: [
// // //                                         ClipRRect(
// // //                                           borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
// // //                                           child: Image.network(
// // //                                             "https://pixlr.com/images/index/remove-bg.webp",
// // //                                             height: MediaQuery.of(context).size.height * 0.08,
// // //                                           ),
// // //                                         ),
// // //                                         const SizedBox(width: 20,),
// // //                                         Expanded(
// // //                                           child: Column(
// // //                                             crossAxisAlignment: CrossAxisAlignment.start,
// // //                                             children: [
// // //                                               Text("Mistari Shirt", style: fontStyleSentences(),),
// // //                                               const SizedBox(height: 15,),
// // //                                               Row(
// // //                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                                                 children: [
// // //                                                   Text("\$3,500", style: fontStyle60016(AppColors.bgBlack),),
// // //                                                   Text("\$3,500",  style: TextStyle(
// // //                                                     fontSize: 15,
// // //                                                     fontWeight: FontWeight.w400,
// // //                                                   ),)
// // //                                                 ],
// // //                                               )
// // //                                             ],
// // //                                           ),
// // //                                         ),
// // //
// // //                                       ],
// // //                                     ),
// // //
// // //
// // //                                     ///////////////Invisible Data///////////////////
// // //                                     Visibility(
// // //                                       visible: onTap,
// // //                                       child: Column(
// // //                                         children: [
// // //                                           const SizedBox(height: 15,),
// // //                                           Container(
// // //                                               padding: EdgeInsets.only(top: 5, bottom: 5),
// // //                                               alignment: Alignment.topLeft,
// // //                                               child: Text("Delivery time taken : 2hr 30 min", style: fontStyleSentences(),)),
// // //                                           Container(
// // //                                               padding: EdgeInsets.only(top: 5, bottom: 5),
// // //                                               alignment: Alignment.topLeft,
// // //                                               child: Text("Order ID : 2672736776777j678", style: fontStyleSentences(),)),
// // //
// // //                                           Container(
// // //                                               padding: EdgeInsets.only(top: 5, bottom: 5),
// // //                                               alignment: Alignment.topLeft,
// // //                                               child: Text("Monday, 15 July ", style: fontStyleSentences(),)),
// // //
// // //                                           Container(
// // //                                               padding: EdgeInsets.only(top: 5, bottom: 5),
// // //                                               alignment: Alignment.topLeft,
// // //                                               child: Expanded(child: Text("Delivery Address : Plot no: 477, Jawaharlal Nehru Road, Beml Layout 3rd stage, RR Nagar Land Mart, Above LP Showroom, opposite to sub Register office, Rajarajjeshwari nagar, Bengaluru, Karnataka 5600098", style: fontStyleSentences(),))),
// // //
// // //                                           const SizedBox(height: 20,),
// // //                                           Container(
// // //                                             alignment: Alignment.topLeft,
// // //                                             child: ListView.builder(
// // //                                               shrinkWrap: true,
// // //                                               itemCount: orderStatusList.length,
// // //                                               itemBuilder: (context, index) {
// // //                                                 final orderStatus = orderStatusList[index];
// // //                                                 return Container(
// // //                                                   padding: EdgeInsets.only(top: 5, bottom: 5),
// // //                                                   child: Row(
// // //                                                     mainAxisAlignment: MainAxisAlignment.start,
// // //                                                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                                                     children: [
// // //                                                       Text(orderStatus.time, style: fontStyleSentences(),),
// // //                                                       SizedBox(width: 10), // Add spacing between time and status
// // //                                                       Flexible(
// // //                                                         child: Text(orderStatus.status, style: fontStyleSentences(),),
// // //
// // //                                                       ),
// // //                                                     ],
// // //                                                   ),
// // //                                                 );
// // //                                               },
// // //                                             ),),
// // //
// // //                                         ],
// // //                                       ),
// // //                                     ),
// // //                                     const SizedBox(height: 20,),
// // //                                     Container(
// // //                                       width: MediaQuery.of(context).size.width,
// // //                                       child: ElevatedButton(
// // //                                           style: ElevatedButton.styleFrom(
// // //                                               padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
// // //                                               shape: RoundedRectangleBorder(
// // //                                                 borderRadius: BorderRadius.circular(24.0), // Adjust the radius as needed
// // //                                               ),
// // //                                               backgroundColor: isAccept ?  AppColors.bgGreen : AppColors.headerGradient2
// // //                                           ),
// // //                                           onPressed: () {
// // //                                             setState(() {
// // //                                               isAccept =!isAccept;
// // //                                             });
// // //                                           }, child: Text( isAccept ? "Accepted" : "Accept", style: fontStyle50012(AppColors.bgWhite),)
// // //                                       ),
// // //                                     )
// // //                                   ],
// // //                                 ),
// // //                               ),
// // //                             ),
// // //
// // //                           ],
// // //                         );
// // //                       }),
// // //
// // //                   // second tab bar view widget
// // //                   Container(
// // //                     child:  ListView.builder(
// // //                         itemCount: orderStatusList.length,
// // //                         itemBuilder: (BuildContext context, int index) {
// // //                           return   Column(
// // //                             children: [
// // //                               const SizedBox(height: 20,),
// // //                               InkWell(
// // //                                 onTap: (){
// // //                                   setState(() {
// // //                                     onTap = !onTap;
// // //                                   });
// // //                                 },
// // //                                 child: Container(
// // //                                   padding: const EdgeInsets.only(left: 16, top: 16,right: 16, bottom: 16),
// // //                                   decoration: BoxDecoration(
// // //                                       border: Border.all(color: AppColors.greyBorder),
// // //                                       borderRadius: BorderRadius.circular(24)
// // //                                   ),
// // //                                   child:  Column(
// // //                                     children: [
// // //                                       Row(
// // //                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                                         children: [
// // //                                           Text("21/08/23-12:15", style: fontStyle40012(AppColors.bgBlack),),
// // //                                           Container(
// // //                                               padding:const  EdgeInsets.only(left: 12, right: 12,top: 8, bottom: 8),
// // //                                               decoration: BoxDecoration(
// // //                                                   color: AppColors.bgGreen2,
// // //                                                   borderRadius: BorderRadius.circular(20)
// // //                                               ),
// // //                                               child: Text("Delivered", style: TextStyle(color: AppColors.bgGreen3, fontSize: 12,
// // //                                                 fontWeight: FontWeight.w500,),))
// // //                                         ],
// // //                                       ),
// // //                                       Row(
// // //                                         children: [
// // //                                           ClipRRect(
// // //                                             borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
// // //                                             child: Image.network(
// // //                                               "https://pixlr.com/images/index/remove-bg.webp",
// // //                                               height: MediaQuery.of(context).size.height * 0.08,
// // //                                             ),
// // //                                           ),
// // //                                           const SizedBox(width: 20,),
// // //                                           Expanded(
// // //                                             child: Column(
// // //                                               crossAxisAlignment: CrossAxisAlignment.start,
// // //                                               children: [
// // //                                                 Text("Mistari Shirt", style: fontStyleSentences(),),
// // //                                                 const SizedBox(height: 15,),
// // //                                                 Row(
// // //                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                                                   children: [
// // //                                                     Text("\$3,500", style: fontStyle60016(AppColors.bgBlack),),
// // //                                                     Text("\$3,500",  style: TextStyle(
// // //                                                       fontSize: 15,
// // //                                                       fontWeight: FontWeight.w400,
// // //                                                     ),)
// // //                                                   ],
// // //                                                 )
// // //                                               ],
// // //                                             ),
// // //                                           ),
// // //
// // //                                         ],
// // //                                       ),
// // //
// // //
// // //                                       ///////////////Invisible Data///////////////////
// // //                                       Visibility(
// // //                                         visible: onTap,
// // //                                         child: Column(
// // //                                           children: [
// // //                                             const SizedBox(height: 15,),
// // //                                             Container(
// // //                                                 padding: EdgeInsets.only(top: 5, bottom: 5),
// // //                                                 alignment: Alignment.topLeft,
// // //                                                 child: Text("Delivery time taken : 2hr 30 min", style: fontStyleSentences(),)),
// // //                                             Container(
// // //                                                 padding: EdgeInsets.only(top: 5, bottom: 5),
// // //                                                 alignment: Alignment.topLeft,
// // //                                                 child: Text("Order ID : 2672736776777j678", style: fontStyleSentences(),)),
// // //
// // //                                             Container(
// // //                                                 padding: EdgeInsets.only(top: 5, bottom: 5),
// // //                                                 alignment: Alignment.topLeft,
// // //                                                 child: Text("Monday, 15 July ", style: fontStyleSentences(),)),
// // //
// // //                                             Container(
// // //                                                 padding: EdgeInsets.only(top: 5, bottom: 5),
// // //                                                 alignment: Alignment.topLeft,
// // //                                                 child: Expanded(child: Text("Delivery Address : Plot no: 477, Jawaharlal Nehru Road, Beml Layout 3rd stage, RR Nagar Land Mart, Above LP Showroom, opposite to sub Register office, Rajarajjeshwari nagar, Bengaluru, Karnataka 5600098", style: fontStyleSentences(),))),
// // //
// // //                                             const SizedBox(height: 20,),
// // //                                             Container(
// // //                                               alignment: Alignment.topLeft,
// // //                                               child: ListView.builder(
// // //                                                 shrinkWrap: true,
// // //                                                 itemCount: orderStatusList.length,
// // //                                                 itemBuilder: (context, index) {
// // //                                                   final orderStatus = orderStatusList[index];
// // //                                                   return Container(
// // //                                                     padding: EdgeInsets.only(top: 5, bottom: 5),
// // //                                                     child: Row(
// // //                                                       mainAxisAlignment: MainAxisAlignment.start,
// // //                                                       crossAxisAlignment: CrossAxisAlignment.start,
// // //                                                       children: [
// // //                                                         Text(orderStatus.time, style: fontStyleSentences(),),
// // //                                                         SizedBox(width: 10), // Add spacing between time and status
// // //                                                         Flexible(
// // //                                                           child: Text(orderStatus.status, style: fontStyleSentences(),),
// // //
// // //                                                         ),
// // //                                                       ],
// // //                                                     ),
// // //                                                   );
// // //                                                 },
// // //                                               ),),
// // //
// // //                                           ],
// // //                                         ),
// // //                                       ),
// // //                                       const SizedBox(height: 20,),
// // //                                       Container(
// // //                                         width: MediaQuery.of(context).size.width,
// // //                                         child: ElevatedButton(
// // //                                             style: ElevatedButton.styleFrom(
// // //                                                 padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
// // //                                                 shape: RoundedRectangleBorder(
// // //                                                   borderRadius: BorderRadius.circular(24.0), // Adjust the radius as needed
// // //                                                 ),
// // //                                                 backgroundColor: AppColors.bgGreen
// // //                                             ),
// // //                                             onPressed: () {
// // //                                               setState(() {
// // //                                                 isAccept =!isAccept;
// // //                                               });
// // //                                             }, child: Text( "Accepted & Delivered" , style: fontStyle50012(AppColors.bgWhite),)
// // //                                         ),
// // //                                       )
// // //                                     ],
// // //                                   ),
// // //                                 ),
// // //                               ),
// // //
// // //                             ],
// // //                           );
// // //                         }),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //
// // //
// // //
// // //
// // //           ],
// // //         ),
// // //       ),
// // //
// // //
// // //     );
// // //   }
// // // }
// // //
// // // class OrderStatus {
// // //   final String time;
// // //   final String status;
// // //
// // //   OrderStatus(this.time, this.status);
// // // }
// //
// //
// // import 'package:flutter/material.dart';
// //
// // ////////////////////////Orderpage.//////////
// //
// // class bankDropdown extends StatefulWidget {
// //   const bankDropdown({super.key});
// //
// //   @override
// //   State<bankDropdown> createState() => _bankDropdownState();
// // }
// //
// // class _bankDropdownState extends State<bankDropdown> {
// //
// //   bool isBankVisible = false;
// //   TextEditingController bankNameController = TextEditingController();
// //
// //    List<String> dank = [
// //     "alahabad",
// //     "garuda",
// //     "badami",
// //     "gonam",
// //   ];
// //   @override
// //   Widget build(BuildContext context) {
// //     return  Scaffold(
// //       appBar: AppBar(),
// //       body: Container(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             TextFormField(
// //               decoration: InputDecoration(
// //                 hintText: "HEllo",
// //               ),
// //             ),
// //             TextFormField(
// //               decoration: InputDecoration(
// //                 hintText: "HEllo",
// //               ),
// //             ),
// //             TextFormField(
// //               decoration: InputDecoration(
// //                   hintText: "HEllo",
// //               ),
// //             ),
// //             TextFormField(
// //               controller: bankNameController,
// //               decoration: InputDecoration(
// //                 hintText: "HEllo",
// //                 suffixIcon: InkWell(
// //                     onTap: () {
// //                       setState(() {
// //                         isBankVisible = !isBankVisible;
// //                       });
// //                     },
// //                     child: Icon(Icons.expand_more))
// //               ),
// //             ),
// //             Visibility(
// //               visible: isBankVisible,
// //               child: Column(
// //                 children: [
// //                   ListView.builder(
// //                     shrinkWrap: true,
// //               itemCount: dank.length,
// //               itemBuilder: (BuildContext context, int index) {
// //                     return   InkWell(
// //                       onTap: (){
// //                         setState(() {
// //                           bankNameController.text = dank[index];
// //                         });
// //                       },
// //                         child: Text(dank[index]));
// //                   }),
// //                   Text("Hello"),
// //                   Text("Hello"),
// //                   Text("Hello"),
// //                   Text("Hello"),
// //                   Text("Hello"),
// //                   Container(
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Padding(
// //                           padding: const EdgeInsets.only(top: 16),
// //                           child: Text("Bank Name *", style: fontStyle50012(AppColors.bgBlack),),
// //                         ),
// //                         const SizedBox(height: 4,),
// //                         Column(
// //                           children: [
// //                             Container(
// //                               decoration: BoxDecoration(
// //                                   border: Border.all(),
// //                                   borderRadius: BorderRadius.circular(8)
// //                               ),
// //                               child:
// //                               TextFormField(
// //                                 controller: bankNameController,
// //                                 decoration: InputDecoration(
// //                                     hintText: "Enter Bank Name",
// //                                     border: InputBorder.none,
// //                                     contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
// //                                     suffixIcon: InkWell(
// //                                       onTap: () {
// //                                         print(isBankVisible);
// //                                         setState(() {
// //                                           isBankVisible = !isBankVisible;
// //                                         });
// //                                       },
// //                                       child: Icon(
// //                                         Icons.expand_more,
// //                                       ),
// //                                     )
// //                                 ),
// //                               ),
// //                             ),
// //                             Visibility(
// //                               visible: isBankVisible,
// //                               child: Container(
// //                                 child: ListView.builder(
// //                                     shrinkWrap: true,
// //                                     //itemCount: products.length,
// //                                     physics: ClampingScrollPhysics(),
// //                                     itemCount: value.bankData.bankList.length,
// //                                     itemBuilder: (BuildContext context, int index) {
// //                                       var banks = value.bankData.bankList[index];
// //                                       // final isSelected = selectedProducts.contains(banks.bankName);
// //                                       return InkWell(
// //                                         onTap: () {
// //                                           print("jhdvsbfcjkadn--->...$index");
// //                                           setState(() {
// //                                             bankNameController.text = banks.bankName;
// //                                             //isBank = false;
// //                                             // if (isSelected) {
// //                                             //   selectedProducts.remove(banks.bankName);
// //                                             // } else {
// //                                             //   selectedProducts.add(banks.bankName);
// //                                             // }
// //                                           });
// //                                           print(selectedProducts[index]);
// //                                           print(selectedProducts.length);
// //                                         },
// //                                         child: Column(
// //                                           children: [
// //                                             Container(
// //                                               padding: const EdgeInsets.all(16),
// //                                               alignment: Alignment.topLeft,
// //                                               decoration: BoxDecoration(
// //                                                   border: Border.all(),
// //                                                   borderRadius: BorderRadius.circular(8)
// //                                               ),
// //                                               //child: Text(products[index]))
// //                                               child: Row(
// //                                                 children: [
// //                                                   Expanded(
// //                                                     child: Text(
// //                                                       banks.bankName,
// //                                                     ),
// //                                                   ),
// //                                                 ],
// //                                               ),)
// //                                           ],
// //                                         ),
// //                                       );
// //                                     }),
// //                               ),
// //                             )
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// /////////////BANK LIST VISIBILITY/////////////
//
// // Widget bankList() {
// //   return Consumer<ProviderVendor>(builder: (context, value, child) {
// //     if(identical(value.isBanksLoading, "LOADING") || identical(value.isBanksLoading, "ERROR")) {
// //       return CircularProgressIndicator();
// //     }
// //     return  Container(
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.only(top: 16),
// //             child: Text("Bank Name *", style: fontStyle50012(AppColors.bgBlack),),
// //           ),
// //           const SizedBox(height: 4,),
// //           Column(
// //             children: [
// //               Container(
// //                 decoration: BoxDecoration(
// //                     border: Border.all(),
// //                     borderRadius: BorderRadius.circular(8)
// //                 ),
// //                 child:
// //                 TextFormField(
// //                   controller: bankNameController,
// //                   decoration: InputDecoration(
// //                       hintText: "Enter Bank Name",
// //                       border: InputBorder.none,
// //                       contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
// //                       suffixIcon: InkWell(
// //                         onTap: () {
// //                           print(isBankVisible);
// //                           setState(() {
// //                             isBankVisible = !isBankVisible;
// //                           });
// //                         },
// //                         child: Icon(
// //                           Icons.expand_more,
// //                         ),
// //                       )
// //                   ),
// //                 ),
// //               ),
// //               Visibility(
// //                 visible: isBankVisible,
// //                 child: Container(
// //                   child: ListView.builder(
// //                       shrinkWrap: true,
// //                       //itemCount: products.length,
// //                       physics: ClampingScrollPhysics(),
// //                       itemCount: value.bankData.bankList.length,
// //                       itemBuilder: (BuildContext context, int index) {
// //                         var banks = value.bankData.bankList[index];
// //                         // final isSelected = selectedProducts.contains(banks.bankName);
// //                         return InkWell(
// //                           onTap: () {
// //                             print("jhdvsbfcjkadn--->...$index");
// //                             setState(() {
// //                               bankNameController.text = banks.bankName;
// //                               isBankVisible = false;
// //                               // if (isSelected) {
// //                               //   selectedProducts.remove(banks.bankName);
// //                               // } else {
// //                               //   selectedProducts.add(banks.bankName);
// //                               // }
// //                             });
// //                             print(selectedProducts[index]);
// //                             print(selectedProducts.length);
// //                           },
// //                           child: Column(
// //                             children: [
// //                               Container(
// //                                 padding: const EdgeInsets.all(16),
// //                                 alignment: Alignment.topLeft,
// //                                 decoration: BoxDecoration(
// //                                     border: Border.all(),
// //                                     borderRadius: BorderRadius.circular(8)
// //                                 ),
// //                                 //child: Text(products[index]))
// //                                 child: Row(
// //                                   children: [
// //                                     Expanded(
// //                                       child: Text(
// //                                         banks.bankName,
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),)
// //                             ],
// //                           ),
// //                         );
// //                       }),
// //                 ),
// //               )
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   });
// // }
//
//
// /////////////////////////Image picker working////////////
// // Column(
// // mainAxisAlignment: MainAxisAlignment.start,
// // children: <Widget>[
// // if (_imageFile1 != null)
// // Image.file(
// // _imageFile1!,
// // height: 200,
// // width: 200,
// // ),
// // ElevatedButton(
// // onPressed: () => _pickImage(1),
// // child: Text('Pick Image 1'),
// // ),
// // if (_imageFile2 != null)
// // Image.file(
// // _imageFile2!,
// // height: 200,
// // width: 200,
// // ),
// // ElevatedButton(
// // onPressed: () => _pickImage(2),
// // child: Text('Pick Image 2'),
// // ),
// // SizedBox(height: 20),
// // ElevatedButton(
// // onPressed: () => _uploadImage(_imageFile1, _fileName1),
// // child: Text('Upload Image 1'),
// // ),
// // ElevatedButton(
// // onPressed: () => _uploadImage(_imageFile2, _fileName2),
// // child: Text('Upload Image 2'),
// // ),
// // ],
// // ),
//
//
//
//
// //////////////////////////ImageUpload Process/////////////////////////////
// // Future<void> _uploadImages() async {
// //   if (_imageFile1 == null || _imageFile2 == null) {
// //     // Handle case when one or both images are not selected
// //     return;
// //   }
// //
// //   final url = Uri.parse('YOUR_API_ENDPOINT_HERE'); // Replace with your API endpoint
// //   final request = http.MultipartRequest('POST', url);
// //
// //   // Create MultipartFile objects from your image files
// //   final imageFile1 = http.MultipartFile(
// //     'app_image',
// //     _imageFile1!.readAsBytes().asStream(),
// //     _imageFile1!.lengthSync(),
// //     filename: _fileName1,
// //   );
// //
// //   final imageFile2 = http.MultipartFile(
// //     'web_image',
// //     _imageFile2!.readAsBytes().asStream(),
// //     _imageFile2!.lengthSync(),
// //     filename: _fileName2,
// //   );
// //
// //   // Add MultipartFile objects to the request
// //   request.files.add(imageFile1);
// //   request.files.add(imageFile2);
// //
// //   // Add other data to the request body
// //   request.fields['active'] = 'true';
// //   //request.fields['bank_id'] = bankId; // Assuming bankId is a variable with the value you want to include
// //
// //
// //   // Print the request headers and body
// //   print('Request Headers: ${request.headers}');
// //   print('Request Body: ${await request.finalize().bytesToString()}');
// //
// //   // Send the request
// //   // final response = await http.Response.fromStream(await request.send());
// //   //
// //   //
// //   // if (response.statusCode == 200) {
// //   //   // Handle a successful response from your API
// //   //   print('Images uploaded successfully');
// //   // } else {
// //   //   // Handle errors
// //   //   print('Image upload failed with status code: ${response.statusCode}');
// //   // }
// //
// // }
//
//
// ////////////////////Backup of Orders table pageee working code of 19-10-2023///////////////////////////
// import 'package:c2b_vendor/screen/home/scheduled_orders.dart';
// import 'package:flutter/material.dart';
//
// import '../../common/Colors.dart';
// import '../../common/widgets.dart';
// import 'home_ui.dart';
//
//
// //////////////////////Accepted Orders////////////////
// class RowData {
//   final String customerName;
//   final String address;
//   final String date;
//   final String time;
//   final String orderId;
//   final String products;
//   final String itemsCount;
//   final String items;
//   final String deliveryMode;
//   final String status;
//   final String deliveryType;
//   final List<String> drivers;
//   final String acceptedTime;
//   final String view;
//
//   RowData({
//     required this.customerName,
//     required this.address,
//     required this.date,
//     required this.time,
//     required this.orderId,
//     required this.products,
//     required this.itemsCount,
//     required this.items,
//     required this.deliveryMode,
//     required this.status,
//     required this.deliveryType,
//     required this.drivers,
//     required this.acceptedTime,
//     required this.view,
//   });
// }
//
// ////////////////UnAccepted Orders////////////////////////
//
// class RowDataUnaccepted {
//   final String customerName;
//   final String address;
//   final String date;
//   final String orderId;
//   final String products;
//   final String itemsCount;
//   final String items;
//   final String deliveryMode;
//   final String status1;
//   final String status;
//   final String deliveryType;
//   final String view;
//
//   RowDataUnaccepted({
//     required this.customerName,
//     required this.address,
//     required this.date,
//     required this.orderId,
//     required this.products,
//     required this.itemsCount,
//     required this.items,
//     required this.deliveryMode,
//     required this.status1,
//     required this.status,
//     required this.deliveryType,
//     required this.view,
//   });
// }
//
// ///////////////////////////////Delivered Orders//////////////////
// class RowDataDeliveried {
//   final String customerName;
//   final String address;
//   final String date;
//   final String time;
//   final String orderId;
//   final String products;
//   final String itemsCount;
//   final String items;
//   final String deliveryMode;
//   final String status;
//   final String deliveryDate;
//   final String deliveryTime;
//   final String deliveryType;
//   final String driver;
//   final String view;
//
//   RowDataDeliveried({
//     required this.customerName,
//     required this.address,
//     required this.date,
//     required this.time,
//     required this.orderId,
//     required this.products,
//     required this.itemsCount,
//     required this.items,
//     required this.deliveryMode,
//     required this.status,
//     required this.deliveryDate,
//     required this.deliveryTime,
//     required this.deliveryType,
//     required this.driver,
//     required this.view,
//   });
// }
//
//
// class NormalOrdersPage extends StatefulWidget {
//   const NormalOrdersPage({super.key});
//
//   @override
//   State<NormalOrdersPage> createState() => _NormalOrdersPageState();
// }
//
// class _NormalOrdersPageState extends State<NormalOrdersPage> with SingleTickerProviderStateMixin  {
//   final List<OrderStatus> orderStatusList = [
//     OrderStatus("12:55 PM", "Order is Delivered"),
//     OrderStatus("12:45 PM", "Order Transit"),
//     OrderStatus("12:10 PM", "Order Processing"),
//     OrderStatus("12:05 PM", "Order placed"),
//   ];
//
//   bool isExpanded = false;
//   String selectedDriver = '';
//   List<String> selectedStatusList = [];
//   String status = '';
//
//   //////Accpted Orders//////////////////
//   List<RowData> tableData = [
//     RowData(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '10:00 AM',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: '',
//       deliveryType: "Dunzo",
//       drivers: ['Driver 1', 'Driver 2'],
//       acceptedTime: "20-9-2024",
//       view: "View",
//
//     ),
//     RowData(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '10:00 AM',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: '',
//       deliveryType: "Dunzo",
//       drivers: ['Driver 1', 'Driver 2'],
//       acceptedTime: "20-9-2024",
//       view: "View",
//
//     ),
//     RowData(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '10:00 AM',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: '',
//       deliveryType: "Dunzo",
//       drivers: ['Driver 1', 'Driver 2'],
//       acceptedTime: "20-9-2024",
//       view: "View",
//
//     ),
//     RowData(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '10:00 AM',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: '',
//       deliveryType: "Dunzo",
//       drivers: ['Driver 1', 'Driver 2'],
//       acceptedTime: "20-9-2024",
//       view: "View",
//
//     ),
//     RowData(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '10:00 AM',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: '',
//       deliveryType: "Dunzo",
//       drivers: ['Driver 1', 'Driver 2'],
//       acceptedTime: "20-9-2024",
//       view: "View",
//
//     ),
//     RowData(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '10:00 AM',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: '',
//       deliveryType: "Dunzo",
//       drivers: ['Driver 1', 'Driver 2'],
//       acceptedTime: "20-9-2024",
//       view: "View",
//
//     ),
//     RowData(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '10:00 AM',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: '',
//       deliveryType: "Dunzo",
//       drivers: ['Driver 1', 'Driver 2'],
//       acceptedTime: "20-9-2024",
//       view: "View",
//
//     ),
//     RowData(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '10:00 AM',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: '',
//       deliveryType: "Dunzo",
//       drivers: ['Driver 1', 'Driver 2'],
//       acceptedTime: "20-9-2024",
//       view: "View",
//
//     ),
//     RowData(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '10:00 AM',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: '',
//       deliveryType: "Dunzo",
//       drivers: ['Driver 1', 'Driver 2'],
//       acceptedTime: "20-9-2024",
//       view: "View",
//
//     ),
//     RowData(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '10:00 AM',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: '',
//       deliveryType: "Dunzo",
//       drivers: ['Driver 1', 'Driver 2'],
//       acceptedTime: "20-9-2024",
//       view: "View",
//
//     ),
//     RowData(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '10:00 AM',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: '',
//       deliveryType: "Dunzo",
//       drivers: ['Driver 1', 'Driver 2'],
//       acceptedTime: "20-9-2024",
//       view: "View",
//
//     ),
//     RowData(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '10:00 AM',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: '',
//       deliveryType: "Dunzo",
//       drivers: ['Driver 1', 'Driver 2'],
//       acceptedTime: "20-9-2024",
//       view: "View",
//
//     ),
//     RowData(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '10:00 AM',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: '',
//       deliveryType: "Dunzo",
//       drivers: ['Driver 1', 'Driver 2'],
//       acceptedTime: "20-9-2024",
//       view: "View",
//
//     ),
//     // Add more rows as needed
//   ];
//
//   final List<String> columnNames = [
//     'Customer Name',
//     'Address',
//     'Date',
//     'Time',
//     'Order ID',
//     'Products',
//     'Items Count',
//     //'Items',
//     'Delivery Mode',
//     'Status',
//     'Delivery type',
//     "Driver",
//     "Accepted Time",
//     "View",
//   ];
//
//   // Define the number of rows and columns per page
//   final int rowsPerPage = 10;
//   final int totalColumns = 13;
//   int currentPage = 0;
//   // Calculate the total number of pages
//   int get totalPages => (tableData.length / rowsPerPage).ceil();
//
//
//
//   ////////////////Unaccepted Orders/////////////////////////
//   List<RowDataUnaccepted> tableDataUnaccepted = [
//     RowDataUnaccepted(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status1: 'Accepted',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//     ),
//     RowDataUnaccepted(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status1: 'Accepted',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//     ),
//     RowDataUnaccepted(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status1: 'Accepted',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//     ),
//     RowDataUnaccepted(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status1: 'Accepted',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//     ),
//     RowDataUnaccepted(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status1: 'Accepted',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//     ),
//     RowDataUnaccepted(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status1: 'Accepted',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//     ),
//     RowDataUnaccepted(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status1: 'Accepted',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//     ),
//     RowDataUnaccepted(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status1: 'Accepted',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//     ),
//     RowDataUnaccepted(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status1: 'Accepted',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//     ),
//
//     // Add more rows as needed
//   ];
//
//   final List<String> columnNamesUnaccepted = [
//     'Customer Name',
//     'Address',
//     'Date',
//     'Order ID',
//     'Products',
//     'Items Count',
//     'Delivery Mode',
//     "Status",
//     'Status',
//     'Delivery type',
//     'View',
//   ];
//
//   ///////////////////////////////Deliveried Orderss///////////////////////////////////
//
//   List<RowDataDeliveried> tableDataDelioveried = [
//     RowDataDeliveried(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: 'Deivered',
//       deliveryType: "Dunzo",
//       view: "View",
//       deliveryDate: '37893',
//       deliveryTime: '34',
//       driver: 'Siddhu',
//     ),
//     RowDataDeliveried(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//       deliveryDate: '37893',
//       deliveryTime: '34',
//       driver: 'Siddhu',
//     ),
//     RowDataDeliveried(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//       deliveryDate: '37893',
//       deliveryTime: '34',
//       driver: 'Siddhu',
//     ),
//     RowDataDeliveried(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//       deliveryDate: '37893',
//       deliveryTime: '34',
//       driver: 'Siddhu',
//     ),
//     RowDataDeliveried(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//       deliveryDate: '37893',
//       deliveryTime: '34',
//       driver: 'Siddhu',
//     ),
//     RowDataDeliveried(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//       deliveryDate: '37893',
//       deliveryTime: '34',
//       driver: 'Siddhu',
//     ),
//     RowDataDeliveried(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//       deliveryDate: '37893',
//       deliveryTime: '34',
//       driver: 'Siddhu',
//     ),
//     RowDataDeliveried(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//       deliveryDate: '37893',
//       deliveryTime: '34',
//       driver: 'Siddhu',
//     ),
//     RowDataDeliveried(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//       deliveryDate: '37893',
//       deliveryTime: '34',
//       driver: 'Siddhu',
//     ),
//     RowDataDeliveried(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//       deliveryDate: '37893',
//       deliveryTime: '34',
//       driver: 'Siddhu',
//     ),
//     RowDataDeliveried(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//       deliveryDate: '37893',
//       deliveryTime: '34',
//       driver: 'Siddhu',
//     ),
//     RowDataDeliveried(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//       deliveryDate: '37893',
//       deliveryTime: '34',
//       driver: 'Siddhu',
//     ),
//     RowDataDeliveried(
//       customerName: 'John Doe',
//       address: '123 Main St',
//       date: '2023-09-21',
//       time: '2023-09-21',
//       orderId: '12345',
//       products: 'Product A, Product B',
//       itemsCount: '5',
//       items: "assets/images/amico.png",
//       deliveryMode: 'Express',
//       status: 'Cancel',
//       deliveryType: "Dunzo",
//       view: "View",
//       deliveryDate: '37893',
//       deliveryTime: '34',
//       driver: 'Siddhu',
//     ),
//
//
//     // Add more rows as needed
//   ];
//   final List<String> columnNamesDeliveried = [
//     'Customer Name',
//     'Address',
//     'Date',
//     'time',
//     'Order ID',
//     'Products',
//     'Items Count',
//     'Delivery Mode',
//     "Status",
//     "delivery Date",
//     "delivery Time",
//     'Delivery type',
//     'driver name',
//     'View',
//   ];
//
//
//
//   void _showDriverSlecetionDialog (List<String> drivers) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//             child:
//             Container(
//               //height: 100, // Set a fixed height for the cell
//               width: 100,
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: drivers.length,
//                 itemBuilder: (context, driverIndex) {
//                   return Column(
//                     children: [
//                       const Row(
//                         children: [
//                           Expanded(child: Text("Choose Driver")),
//                           //Text(rowData.drivers[driverIndex]),
//                           Expanded(child: Icon(Icons.expand_more))
//                         ],
//                       ),
//                       Text(drivers[driverIndex].toString()),
//                       // if (driverIndex < rowData.drivers.length - 1)
//                       //   SizedBox(width: 5),
//                     ],
//                   );
//                 },
//
//               ),
//             ),
//           );
//         });
//   }
//
//   void _showProductDetailsDialog () {
//
//     final List<String> specifications = [
//       "Material: High-quality cotton blend ",
//       "Fit: Regular fit ",
//       "Pattern: Multi-color vertical stripes",
//       " Collar: Classic button-down collar ",
//       "Sleeve: Full sleeves with button cuffs ",
//       "Closure: Front button closure ",
//       "Pocket: Single chest pocket ",
//       "Care Instructions: Machine wash cold, gentle cycle; do not bleach; tumble dry low; iron on low heat",
//     ];
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           Widget specification() {
//             return ListView.builder(
//               shrinkWrap: true,
//               physics: const ClampingScrollPhysics(),
//               itemCount: specifications.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   padding: const EdgeInsets.only(left: 18),
//                   child: Row(
//                     children: [
//                       const Icon(
//                         Icons.brightness_1,
//                         size: 5,
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                           child: Text(
//                             specifications[index],
//                             style: fontStyleSentences(),
//                           )),
//                     ],
//                   ),
//                 );
//               },
//             );
//           }
//           return StatefulBuilder(builder: (context, setState) {
//             return Container(
//               width: MediaQuery.of(context).size.width * 0.2,
//               height: MediaQuery.of(context).size.height * 0.7,
//               child: Dialog(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0), // Set your desired border radius
//                 ),
//                 child:
//                 SingleChildScrollView(
//                   child: Container(
//                     padding: const EdgeInsets.all(16),
//                     child:Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Mistari Shirt - MultiColor", style: fontStyle60016(AppColors.bgBlack),),
//                             IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Icons.close))
//                           ],
//                         ),
//                         const SizedBox(height: 12,),
//                         Text("\u20B9 3,500", style: fontStyle60016(AppColors.bgBlack),),
//                         const SizedBox(height: 12,),
//                         Text("Summer in the Cambodian flower market - thats the vibe this print channels", style: fontStyleSentences(),),
//                         const SizedBox(height: 16,),
//                         Divider(
//                           height: 10,
//                           thickness: 2,
//                           color: AppColors.bgBlack,
//                         ),
//                         const SizedBox(height: 16,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Product ID", style: fontStyle60016(AppColors.bgBlack),),
//                             Text("dhcbye783", style: fontStyleSentences(),)
//                           ],
//                         ),
//                         const SizedBox(height: 16,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Order ID" ,style: fontStyle60016(AppColors.bgBlack),),
//                             Text("dhcbye783", style: fontStyleSentences(),)
//                           ],
//                         ),
//                         const SizedBox(height: 16,),
//                         Divider(
//                           height: 10,
//                           thickness: 2,
//                           color: AppColors.bgBlack,
//                         ),
//                         const SizedBox(height: 16,),
//                         Row(
//                           children: [
//                             const Text("Color",
//                                 style: TextStyle(
//                                   fontSize:16,
//                                   fontWeight: FontWeight.w600,
//                                 )),
//                             const SizedBox(width: 20,),
//                             Container(
//                               height: 30,
//                               child:  Container(
//                                 alignment: Alignment.center,
//                                 margin: const EdgeInsets.all(2),
//                                 decoration: BoxDecoration(
//                                     color: AppColors.headerGradient2,
//                                     borderRadius: BorderRadius.circular(25),
//                                     border: Border.all()),
//
//                                 width: 40,
//                                 child: const Text("",
//                                     style: TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w600,
//                                     )),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 12,),
//                         Row(
//                           children: [
//                             const Text("Size",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                 )),
//                             const SizedBox(width: 30,),
//                             Container(
//                               height: 30,
//                               child:  Container(
//                                 alignment: Alignment.center,
//                                 margin: const EdgeInsets.all(2),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(25),
//                                     border: Border.all()),
//                                 width: 40,
//                                 child: const Text("s",
//                                     style: TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w600,
//                                     )),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 16,),
//                         Divider(
//                           height: 10,
//                           thickness: 2,
//                           color: AppColors.bgBlack,
//                         ),
//                         const SizedBox(height: 16,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Order date and time", style: fontStyle60016(AppColors.bgBlack),),
//                             Container(
//                                 padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
//                                 decoration: BoxDecoration(
//                                     color: AppColors.bgGreen2,
//                                     borderRadius: BorderRadius.circular(8)
//                                 ),
//                                 child: Text("23/08/23")),
//                             Container(
//                                 padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
//                                 decoration: BoxDecoration(
//                                     color: AppColors.bgGreen2,
//                                     borderRadius: BorderRadius.circular(8)
//                                 ),
//                                 child: Text("12:56")),
//                           ],
//                         ),
//                         const SizedBox(height: 16,),
//                         Divider(
//                           height: 10,
//                           thickness: 2,
//                           color: AppColors.bgBlack,
//                         ),
//                         const SizedBox(height: 16,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Order date and time" ,style: fontStyle60016(AppColors.bgBlack),),
//                             Container(
//                                 padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
//                                 decoration: BoxDecoration(
//                                     color: AppColors.bgGreen2,
//                                     borderRadius: BorderRadius.circular(8)
//                                 ),
//                                 child: Text("23/08/23")),
//                             Container(
//                                 padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
//                                 decoration: BoxDecoration(
//                                     color: AppColors.bgGreen2,
//                                     borderRadius: BorderRadius.circular(8)
//                                 ),
//                                 child: Text("12:56")),
//                           ],
//                         ),
//                         const SizedBox(height: 16,),
//                         Container(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text("Specification",
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w600,
//                                   )),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               specification()
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 16,),
//                         Divider(
//                           height: 10,
//                           thickness: 2,
//                           color: AppColors.bgBlack,
//                         ),
//                         const SizedBox(height: 16,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Delivery mode", style: fontStyleHeading(AppColors.bgBlack),),
//                             Text("Self Delivery", style: fontStyleSentences(),)
//                           ],
//                         ),
//                         const SizedBox(height: 16,),
//                         Text("Delivery Address :"),
//                         const SizedBox(height: 16,),
//                         Text("Plot no: 477, Jawaharlal Nehru Road, BEML Layout 3rd Stage, RR Nagar Land Mark: Above Louis Philippe Showroom, opposite to Sub Register Office, Rajarajeshwari Nagar, Bengaluru, Karnataka 560098", style: fontStyleSentences(),)
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           });
//         });
//   }
//
//   // void _deliveryStatus () {
//   //
//   //   final List<String> statusData = [
//   //     "Packed",
//   //     "Ready for delivery"
//   //   ];
//   //    showDialog(
//   //        context: context,
//   //        builder: (BuildContext context) {
//   //     return Dialog(
//   //       child: Container(
//   //         height: MediaQuery.of(context).size.height * 0.1,
//   //         width: MediaQuery.of(context).size.width * 0.1,
//   //         child: ListView.builder(
//   //           itemCount: statusData.length,
//   //             itemBuilder: (BuildContext context, int index) {
//   //
//   //           return InkWell(
//   //             onTap: () {
//   //              setState(() {
//   //                selectedStatus = statusData[index];
//   //                Navigator.of(context);
//   //              });
//   //             },
//   //             child: Container(
//   //               padding: EdgeInsets.all(5),
//   //               margin: EdgeInsets.all(5),
//   //               decoration: BoxDecoration(
//   //                 color: Colors.red
//   //               ),
//   //               alignment: Alignment.center,
//   //               child: Text(statusData[index]),
//   //             ),
//   //           );
//   //         }),
//   //       ),
//   //     );
//   //   });
//   // }
//   void _deliveryStatus(RowData rowData, int rowIndex) {
//     final List<String> statusData = [
//       "Packed",
//       "Ready for delivery",
//     ];
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           child: Container(
//             height: MediaQuery.of(context).size.height * 0.1,
//             width: MediaQuery.of(context).size.width * 0.1,
//             child: ListView.builder(
//               itemCount: statusData.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return InkWell(
//                   onTap: () {
//                     setState(() {
//                       selectedStatusList[rowIndex] = statusData[index];
//                       Navigator.of(context).pop();
//                     });
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(5),
//                     margin: EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                     ),
//                     alignment: Alignment.center,
//                     child: Text(statusData[index]),
//                   ),
//                 );
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//
//
//
//   /////////////////Accepted Orders///////////////////////////
//   // final List<String> columnNames = [
//   //   'Customer Name',
//   //   'Address',
//   //   'Date',
//   //   'Time',
//   //   'Order ID',
//   //   'Products',
//   //   'Items Count',
//   //   //'Items',
//   //   'Delivery Mode',
//   //   'Status',
//   //   'Delivery type',
//   //   "Driver",
//   //   "Accepted Time",
//   //   "View",
//   // ];
//
//   ////////////////Unaccepted Orders////////////////////////////
//   // final List<String> columnNamesUnaccepted = [
//   //   'Customer Name',
//   //   'Address',
//   //   'Date',
//   //   'Order ID',
//   //   'Products',
//   //   'Items Count',
//   //   'Delivery Mode',
//   //   "Status",
//   //   'Status',
//   //   'Delivery type',
//   //   'View',
//   // ];
//
//   /////////////////Deliveried orders/////////////////
//   // final List<String> columnNamesDeliveried = [
//   //   'Customer Name',
//   //   'Address',
//   //   'Date',
//   //   'time',
//   //   'Order ID',
//   //   'Products',
//   //   'Items Count',
//   //   'Delivery Mode',
//   //   "Status",
//   //   "delivery Date",
//   //   "delivery Time",
//   //   'Delivery type',
//   //   'driver name',
//   //   'View',
//   // ];
//
//   /////////////Accepted Orders////////////////////////////////
//   // // Define the number of rows and columns per page
//   // final int rowsPerPage = 10;
//   // final int totalColumns = 13;
//   // int currentPage = 0;
//   // // Calculate the total number of pages
//   // int get totalPages => (tableData.length / rowsPerPage).ceil();
//
// //////////////////Unaccepted Orders/////////////////////
//   final int rowsPerPageUnaccept = 5;
//   final int totalColumnsUnaccept = 11;
//   int currentPageUnaccepted = 0;
//   // Calculate the total number of pages
//   int get totalPagesUnaccepted => (tableDataUnaccepted.length / rowsPerPageUnaccept).ceil();
//
//   /////////////////////////Delivered Orders//////////////////////////////////////
//
//   final int rowsPerPageDeliveried = 5;
//   final int totalColumnsDelivered = 14;
//   int currentPageDelivered = 0;
//   // Calculate the total number of pages
//   int get currentPageDelivere => (tableDataDelioveried.length / rowsPerPageDeliveried).ceil();
//
//
//
//   late TabController _tabController;
//
//
//   late  bool onTap = false;
//   bool isAccept = false;
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     selectedStatusList = List.filled(tableData.length, "placed");
//     _tabController = TabController(
//       length: 3, // Number of tabs
//       vsync: this,
//     );
//
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     int startIndex = currentPage * rowsPerPage;
//     int endIndex = (currentPage + 1) * rowsPerPage;
//     endIndex = endIndex > tableData.length ? tableData.length : endIndex;
//
//     // Create the table headers
//     List<DataColumn> columns = List.generate(
//       totalColumns,
//           (index) => DataColumn(label: Text(columnNames[index])),
//     );
//
//     // Create the table rows for the current page
//     List<DataRow> rows = List.generate(
//       endIndex - startIndex,
//           (index) {
//         final rowData = tableData[startIndex + index];
//         return DataRow(
//           cells: [
//             DataCell(
//                 Container(
//                     child: Text(rowData.customerName))),
//             DataCell(
//                 Container(
//                     child: Text(rowData.address))),
//             DataCell(
//                 Container(
//                     padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
//                     decoration: BoxDecoration(
//                         color: AppColors.bgGreen2,
//                         borderRadius: BorderRadius.circular(8)
//                     ),
//                     child: Text(rowData.date, style: fontStyle50012(AppColors.bgGreen3)))),
//             DataCell(
//                 Container(
//                     padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
//                     decoration: BoxDecoration(
//                         color: AppColors.bgGreen2,
//                         borderRadius: BorderRadius.circular(8)
//                     ),
//                     child: Text(rowData.time))),
//             DataCell(
//                 Container(child: Text(rowData.orderId))),
//             DataCell(
//                 Container(child: Text(rowData.products))),
//             DataCell(
//                 Container(
//                     child: Text(rowData.itemsCount))),
//             // DataCell(
//             //   // Display an image in the "Items" column
//             //   Container(
//             //     child: Image.asset(
//             //       rowData.items, // Assuming that 'items' contains the image path
//             //       width: 50,    // Adjust the image size as needed
//             //       height: 50,
//             //     ),
//             //   ),
//             // ),
//             DataCell(
//                 Container(
//                     padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
//                     decoration: BoxDecoration(
//                         color: AppColors.bgGreen2,
//                         borderRadius: BorderRadius.circular(8)
//                     ),
//                     child: Text(rowData.deliveryMode))),
//             // DataCell(
//             //     Container(
//             //         padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
//             //         decoration: BoxDecoration(
//             //             color: AppColors.bgGreen2,
//             //             borderRadius: BorderRadius.circular(8)
//             //         ),
//             //         child: InkWell(
//             //           onTap: () {
//             //             _deliveryStatus();
//             //           },
//             //           child: Row(
//             //             children: [
//             //               Text(selectedStatus),
//             //               Icon(Icons.expand_more)
//             //             ],
//             //           ),
//             //         ))),
//             DataCell(
//               Container(
//                 padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
//                 decoration: BoxDecoration(
//                   color: AppColors.bgGreen2,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: InkWell(
//                   onTap: () {
//                     _deliveryStatus(rowData, startIndex + index);
//                   },
//                   child: Row(
//                     children: [
//                       Text(selectedStatusList[startIndex + index]),
//                       Icon(Icons.expand_more),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//
//             DataCell(Text(rowData.deliveryType)),
//             DataCell(
//               // Container(
//               //   //height: 100, // Set a fixed height for the cell
//               //   width: 100,
//               //   child: ListView.builder(
//               //     shrinkWrap: true,
//               //     itemCount: rowData.drivers.length,
//               //     itemBuilder: (context, driverIndex) {
//               //       return Column(
//               //         children: [
//               //           Row(
//               //             children: [
//               //               Expanded(child: Text("Choose Driver")),
//               //               //Text(rowData.drivers[driverIndex]),
//               //               Expanded(child: Icon(Icons.expand_more))
//               //             ],
//               //           ),
//               //           Text(rowData.drivers[driverIndex]),
//               //           // if (driverIndex < rowData.drivers.length - 1)
//               //           //   SizedBox(width: 5),
//               //         ],
//               //       );
//               //     },
//               //
//               //   ),
//               // ),
//
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.3,
//                 child:  Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       children: [
//                         InkWell(
//                             onTap: () {
//                               _showDriverSlecetionDialog(rowData.drivers);
//                             },
//                             child: const Expanded(child: Text("Choose Driver"))),
//                       ],
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//             DataCell(Text(rowData.acceptedTime)),
//             DataCell(ElevatedButton(
//                 style: ElevatedButton.styleFrom(),
//                 onPressed: (){
//                   _showProductDetailsDialog();
//                 },
//                 child: Text(rowData.view)))
//           ],
//         );
//       },
//     );
//
//
//     // Create the DataTable
//     DataTable dataTable = DataTable(
//       columns: columns,
//       rows: rows,
//     );
//
//     // Create pagination buttons
//     // List<Widget> paginationButtons = [
//     //   ElevatedButton(
//     //     onPressed: () {
//     //       if (currentPage > 0) {
//     //         setState(() {
//     //           currentPage--;
//     //         });
//     //       }
//     //     },
//     //     child: Text('Previous'),
//     //   ),
//     //   Text('Page ${currentPage + 1}'),
//     //   ElevatedButton(
//     //     onPressed: () {
//     //       if (currentPage < (tableData.length / rowsPerPage).ceil() - 1) {
//     //         setState(() {
//     //           currentPage++;
//     //         });
//     //       }
//     //     },
//     //     child: Text('Next'),
//     //   ),
//     // ];
//
//     // Create the overall layout
//     List<Widget> paginationButtons = List.generate(
//       totalPages,
//           (page) => ElevatedButton(
//         onPressed: () {
//           setState(() {
//             currentPage = page;
//           });
//         },
//         child: Text('${page + 1}'),
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all(
//             page == currentPage ? Colors.blue : Colors.grey,
//           ),
//         ),
//       ),
//     );
//
//     /////////Unaccepted //////////////////////////////////////////
//
//     int startIndexUnaccepted = currentPageUnaccepted * rowsPerPageUnaccept;
//     int endIndexUnaccepted = (currentPageUnaccepted + 1) * rowsPerPageUnaccept;
//     endIndexUnaccepted = endIndexUnaccepted > tableDataUnaccepted.length ? tableDataUnaccepted.length : endIndexUnaccepted;
//
//     // Create the table headers
//     List<DataColumn> columnsUnaccepted = List.generate(
//       //totalColumns,
//       totalColumnsUnaccept,
//           (index) => DataColumn(label: Text(columnNamesUnaccepted[index])),
//     );
//
//     // Create the table rows for the current page
//     List<DataRow> rowsUnaccepted = List.generate(
//       endIndexUnaccepted - startIndexUnaccepted,
//           (index) {
//         final rowDataUnaccepted = tableDataUnaccepted[startIndexUnaccepted + index];
//         return DataRow(
//           cells: [
//             DataCell(
//                 Container(
//                     child: Text(rowDataUnaccepted.customerName))),
//             DataCell(
//                 Container(
//                     child: Text(rowDataUnaccepted.address))),
//             DataCell(
//                 Container(
//                     padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
//                     decoration: BoxDecoration(
//                         color: AppColors.bgGreen2,
//                         borderRadius: BorderRadius.circular(8)
//                     ),
//                     child: Text(rowDataUnaccepted.date, style: fontStyle50012(AppColors.bgGreen3)))),
//
//             DataCell(
//                 Container(child: Text(rowDataUnaccepted.orderId))),
//             DataCell(
//                 Container(child: Text(rowDataUnaccepted.products))),
//             DataCell(
//                 Container(
//                     child: Text(rowDataUnaccepted.itemsCount))),
//             // DataCell(
//             //   // Display an image in the "Items" column
//             //   Container(
//             //     child: Image.asset(
//             //       rowData.items, // Assuming that 'items' contains the image path
//             //       width: 50,    // Adjust the image size as needed
//             //       height: 50,
//             //     ),
//             //   ),
//             // ),
//             DataCell(
//                 Container(
//                     padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
//                     decoration: BoxDecoration(
//                         color: AppColors.bgGreen2,
//                         borderRadius: BorderRadius.circular(8)
//                     ),
//                     child: Text(rowDataUnaccepted.deliveryMode))),
//
//             DataCell(
//               Container(
//                 padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
//                 decoration: BoxDecoration(
//                   color: AppColors.bgGreen2,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: InkWell(
//                   onTap: () {
//                     ///_deliveryStatus(rowData, startIndex + index);
//                   },
//                   child: Row(
//                     children: [
//                       Text("Accept"),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             DataCell(
//               Container(
//                 padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
//                 decoration: BoxDecoration(
//                   color: AppColors.cancelButtonBackground,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: InkWell(
//                   onTap: () {
//                     //_deliveryStatus(rowData, startIndex + index);
//                   },
//                   child: Text("Cancel", style: fontStyle50012(AppColors.closedText),),
//                 ),
//               ),
//             ),
//
//             DataCell(Text(rowDataUnaccepted.deliveryType)),
//             DataCell(ElevatedButton(
//                 style: ElevatedButton.styleFrom(),
//                 onPressed: (){
//                   _showProductDetailsDialog();
//                 },
//                 child: Text(rowDataUnaccepted.view)))
//
//           ],
//         );
//       },
//     );
//
//
//     // Create the DataTable
//     DataTable dataTableUnaccepted = DataTable(
//       columns: columnsUnaccepted,
//       rows: rowsUnaccepted,
//     );
//
//     // Create pagination buttons
//     // List<Widget> paginationButtons = [
//     //   ElevatedButton(
//     //     onPressed: () {
//     //       if (currentPage > 0) {
//     //         setState(() {
//     //           currentPage--;
//     //         });
//     //       }
//     //     },
//     //     child: Text('Previous'),
//     //   ),
//     //   Text('Page ${currentPage + 1}'),
//     //   ElevatedButton(
//     //     onPressed: () {
//     //       if (currentPage < (tableData.length / rowsPerPage).ceil() - 1) {
//     //         setState(() {
//     //           currentPage++;
//     //         });
//     //       }
//     //     },
//     //     child: Text('Next'),
//     //   ),
//     // ];
//
//     // Create the overall layout
//     List<Widget> paginationButtonsUnaccepted = List.generate(
//       totalPagesUnaccepted,
//           (page) => ElevatedButton(
//         onPressed: () {
//           setState(() {
//             currentPageUnaccepted = page;
//           });
//         },
//         child: Text('${page + 1}'),
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all(
//             page == currentPageUnaccepted ? Colors.blue : Colors.grey,
//           ),
//         ),
//       ),
//     );
//
//     /////////////////?Deliveried orders//////////////////////////////
//     int startIndexDelivered = currentPageDelivered * rowsPerPageDeliveried;
//     int endIndexDelivered = (currentPageDelivered + 1) * rowsPerPageDeliveried;
//     endIndexDelivered = endIndexDelivered > tableDataDelioveried.length ? tableDataDelioveried.length : endIndexDelivered;
//
//     // Create the table headers
//     List<DataColumn> columnsDelivered = List.generate(
//       //totalColumns,
//       totalColumnsDelivered,
//           (index) => DataColumn(label: Text(columnNamesDeliveried[index])),
//     );
//
//     // Create the table rows for the current page
//     List<DataRow> rowsDelivered = List.generate(
//       endIndexDelivered - startIndexDelivered,
//           (index) {
//         final rowDataDelivered = tableDataDelioveried[startIndexDelivered + index];
//         return DataRow(
//           cells: [
//             DataCell(
//                 Container(
//                     child: Text(rowDataDelivered.customerName))),
//             DataCell(
//                 Container(
//                     child: Text(rowDataDelivered.address))),
//             DataCell(
//                 Container(
//                     padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
//                     decoration: BoxDecoration(
//                         color: AppColors.bgGreen2,
//                         borderRadius: BorderRadius.circular(8)
//                     ),
//                     child: Text(rowDataDelivered.date, style: fontStyle50012(AppColors.bgGreen3)))),
//             DataCell(
//                 Container(
//                     padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
//                     decoration: BoxDecoration(
//                         color: AppColors.bgGreen2,
//                         borderRadius: BorderRadius.circular(8)
//                     ),
//                     child: Text(rowDataDelivered.time, style: fontStyle50012(AppColors.bgGreen3)))),
//             DataCell(
//                 Container(child: Text(rowDataDelivered.orderId))),
//             DataCell(
//                 Container(child: Text(rowDataDelivered.products))),
//             DataCell(
//                 Container(
//                     child: Text(rowDataDelivered.itemsCount))),
//             // DataCell(
//             //   // Display an image in the "Items" column
//             //   Container(
//             //     child: Image.asset(
//             //       rowData.items, // Assuming that 'items' contains the image path
//             //       width: 50,    // Adjust the image size as needed
//             //       height: 50,
//             //     ),
//             //   ),
//             // ),
//             DataCell(
//                 Container(
//                     padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
//                     decoration: BoxDecoration(
//                         color: AppColors.bgGreen2,
//                         borderRadius: BorderRadius.circular(8)
//                     ),
//                     child: Text(rowDataDelivered.deliveryMode))),
//
//             DataCell(
//               Container(
//                 padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
//                 decoration: BoxDecoration(
//                   color: AppColors.bgGreen2,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: InkWell(
//                   onTap: () {
//                     ///_deliveryStatus(rowData, startIndex + index);
//                   },
//                   child: Row(
//                     children: [
//                       Text("Delivered"),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             DataCell(Text(rowDataDelivered.deliveryDate)),
//             DataCell(Text(rowDataDelivered.deliveryTime)),
//             DataCell(Text(rowDataDelivered.deliveryType)),
//             DataCell(Text(rowDataDelivered.driver)),
//             DataCell(ElevatedButton(
//                 style: ElevatedButton.styleFrom(),
//                 onPressed: (){
//                   _showProductDetailsDialog();
//                 },
//                 child: Text(rowDataDelivered.view)))
//
//           ],
//         );
//       },
//     );
//
//
//     // Create the DataTable
//     DataTable dataTableDelivered = DataTable(
//       columns: columnsDelivered,
//       rows: rowsDelivered,
//     );
//
//     // Create pagination buttons
//     // List<Widget> paginationButtons = [
//     //   ElevatedButton(
//     //     onPressed: () {
//     //       if (currentPage > 0) {
//     //         setState(() {
//     //           currentPage--;
//     //         });
//     //       }
//     //     },
//     //     child: Text('Previous'),
//     //   ),
//     //   Text('Page ${currentPage + 1}'),
//     //   ElevatedButton(
//     //     onPressed: () {
//     //       if (currentPage < (tableData.length / rowsPerPage).ceil() - 1) {
//     //         setState(() {
//     //           currentPage++;
//     //         });
//     //       }
//     //     },
//     //     child: Text('Next'),
//     //   ),
//     // ];
//
//     // Create the overall layout
//     List<Widget> paginationButtonsDelivered = List.generate(
//       currentPageDelivere,
//           (page) => ElevatedButton(
//         onPressed: () {
//           setState(() {
//             currentPageDelivered = page;
//           });
//         },
//         child: Text('${page + 1}'),
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all(
//             page == currentPageUnaccepted ? Colors.blue : Colors.grey,
//           ),
//         ),
//       ),
//     );
//
//
//
//     return  Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(" My Orders", style: fontStyleHeading(AppColors.bgBlack),),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             //Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
//           },
//           icon: Icon(Icons.arrow_back, color: AppColors.bgBlack,),
//         ),
//         actions: [
//           Image.asset("assets/images/FAQ.png")
//           //Icon(Icons.add, color: AppColors.cvPink,)
//         ],
//       ),
//       body:  Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//
//             Container(
//               padding: EdgeInsets.all(16),
//               child: Row(
//                 //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InkWell(
//                       onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>NormalOrdersPage())),
//                       child: Text("Normal Orders(04)", style: fontStyle60016(AppColors.bgBlack),)),
//                   // InkWell(
//                   //     onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ScheduledOrdersPage())),
//                   //     child: Text("Scheduled Orders",  style: fontStyle60016(AppColors.grey),))
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24,),
//             Container(
//               padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
//
//               decoration: BoxDecoration(
//                 color:AppColors.cvPink,
//                 borderRadius: BorderRadius.circular(
//                   30.0,
//                 ),
//               ),
//               child: TabBar(
//                 controller: _tabController,
//                 // give the indicator a decoration (color and border radius)
//                 indicator: BoxDecoration(
//                   borderRadius: BorderRadius.circular(
//                     30.0,
//                   ),
//                   boxShadow: const [
//                     BoxShadow(
//                       blurRadius: 12,
//                       spreadRadius: 0,
//                       color: Color.fromRGBO(0, 0, 0, 0.12),
//                       offset: Offset(0, 0),
//
//                     )
//                   ],
//                   color: AppColors.bgWhite,
//                 ),
//                 labelColor: AppColors.bgBlack,
//                 unselectedLabelColor: Colors.black,
//                 labelStyle: fontStyle60016(AppColors.bgBlack),
//                 tabs: const [
//
//                   Tab(
//                     child: Align(
//                         alignment: Alignment.center,
//                         child: Text("Accepted orders")),
//                   ),
//
//
//                   Tab(
//                     child: Align(
//                         alignment: Alignment.center,
//                         child: Text("Unaccepted  orders")),
//
//                   ),
//                   Tab(
//                     child: Align(
//                         alignment: Alignment.center,
//                         child: Text("Delivered  orders")),
//                   ),
//
//
//                 ],
//               ),
//             ),
//
//             // tab bar view here
//             Expanded(
//               child: TabBarView(
//                 controller: _tabController,
//                 children:  [
//                   // first tab bar view widget
//                   Column(
//                     children: [
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             dataTable,
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: paginationButtons,
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   // second tab bar view widget
//                   Column(
//                     children: [
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             dataTableUnaccepted,
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: paginationButtonsUnaccepted,
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   // Third tab bar view widget
//
//                   Column(
//                     children: [
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             dataTableDelivered,
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: paginationButtonsDelivered,
//                         ),
//                       ),
//                     ],
//                   ),
//
//
//                 ],
//               ),
//             ),
//
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class OrderStatus {
//   final String time;
//   final String status;
//
//   OrderStatus(this.time, this.status);
// }





