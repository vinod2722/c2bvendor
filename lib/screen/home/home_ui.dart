import 'dart:math';

import 'package:c2b_vendor/common/colors.dart';
import 'package:c2b_vendor/common/widgets.dart';
import 'package:c2b_vendor/screen/account/serviceplan.dart';
import 'package:c2b_vendor/screen/home/normal_orders.dart';
import 'package:c2b_vendor/screen/home/product.dart';
import 'package:c2b_vendor/screen/home/sales_chart.dart';
import 'package:c2b_vendor/screen/home/scheduled_orders.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../account/account_detail.dart';
import 'chart.dart';
import 'order_table.dart';
import 'orders.dart';

class HomePage extends StatefulWidget {
 // final List<PricePoint> points;

  const HomePage({super.key, });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<OrderStatus> orderStatusList = [
    OrderStatus("12:55 PM", "Order is Delivered"),
    OrderStatus("12:45 PM", "Order Transit"),
    OrderStatus("12:10 PM", "Order Processing"),
    OrderStatus("12:05 PM", "Order placed"),
  ];

  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const ProductAddPage(),
    const HomePage(),
    const HomePage(),
    //const HomePage(),
  ];


  final Random random = Random();

bool onTap = false;


  final LocalStorage userToken = LocalStorage('user_token');
  late String token = '';

  Future<void> getData() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProviderVendor>(context, listen: false)
          .getOrders(token);

    });
  }

  @override
  void initState() {
    super.initState();
    token = userToken.getItem('token');
    print(token);
    getData();

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: ClipOval(
        //     child: Image.network(
        //       "https://pixlr.com/images/index/remove-bg.webp",
        //       width: 40,
        //       height: 40,
        //       fit: BoxFit.cover,  // Ensure the image covers the circular area
        //     ),
        //   ),
        // ),
        title: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              // Text("Spice Fusion", style: fontStyle60016(AppColors.bgBlack),),
              // Text("Koramangla", style: fontStyleSentences(),),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>HorizontalScrollingTable()));
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.bgWhite,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(Icons.notifications_outlined, color: AppColors.bgBlack,)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.bgWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search for area",
                      suffixIcon: Icon(Icons.mic),
                      prefixIcon: Icon(Icons.search_outlined)
                    ),
                  ),
                ),
                // const SizedBox(height: 16,),
                // Container(
                //
                //   child:  Card(
                //     elevation: 4,
                //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                //     child: LineChartSample2(),
                //   ),
                // ),
                const SizedBox(height: 16,),

                Consumer<ProviderVendor>(builder: (context, value, child) {
                  if(identical(value.isOrdersLoading, "NOT_STARTED") || identical(value.isOrdersLoading, "LOADING")) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }else if(value.vendOrder.orders.isEmpty){
                    return Text("There is no orders");
                  }else {

                    return Container(
                      child:  Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        color: AppColors.bgWhite,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: min(1, value.vendOrder.orders.length),
                              itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text("New Orders", style: fontStyle70022(),)),
                                const SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("21/08/23-12:15", style: fontStyle40012(AppColors.bgBlack),),
                                    Container(
                                        padding:const  EdgeInsets.only(left: 12, right: 12,top: 8, bottom: 8),
                                        decoration: BoxDecoration(
                                            color: AppColors.bgGreen2,
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: Text("Home Delivery", style: TextStyle(color: AppColors.bgGreen3, fontSize: 12,
                                          fontWeight: FontWeight.w500,),))
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
                                      child: Image.network(
                                        "https://pixlr.com/images/index/remove-bg.webp",
                                        height: MediaQuery.of(context).size.height * 0.08,
                                      ),
                                    ),
                                    const SizedBox(width: 20,),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Mistari Shirt", style: fontStyleSentences(),),
                                          const SizedBox(height: 15,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("\$3,500", style: fontStyle60016(AppColors.bgBlack),),
                                              const Text("\$3,500",  style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),)
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24.0), // Adjust the radius as needed
                                          ),
                                          backgroundColor: AppColors.headerGradient2
                                      ),
                                      onPressed: () {
                                        showDialog(
                                            context: context, builder: (BuildContext context) {
                                          return const OrdersPage();
                                        });
                                      }, child: Text("Accept", style: fontStyle50012(AppColors.bgWhite),)
                                  ),
                                )
                              ],
                            );
                          })
                        ),
                      ),
                    );
                  }
                }),

                //////////////////////Sales/////////////
                // const SizedBox(height: 16,),
                // Container(
                //   height: MediaQuery.of(context).size.height * 0.4,
                //   //child: Text("Sales", style: fontStyle70022(),),
                //   child: Card(
                //     elevation: 4,
                //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                //     child: SalesChart(),
                //   ),
                // ),
                // ////////////////////Subscription//////////////////
                // const SizedBox(height: 16,),
                // InkWell(
                //   onTap: () {
                //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ServicePlansPage()));
                //   },
                //   child: Card(
                //     elevation: 4,
                //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                //     child: Container(
                //       padding: const EdgeInsets.all(24),
                //       child: Column(
                //         children: [
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text("Subscription", style: fontStyle70022(),),
                //               Container(
                //                 decoration: BoxDecoration(
                //                   color: AppColors.greyBorder,
                //                   borderRadius: BorderRadius.circular(20)
                //                 ),
                //                 padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                //                   child: Text("Today", style: fontStyle50012(AppColors.bgBlack),))
                //             ],
                //           ),
                //           const SizedBox(height: 20,),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text("Info", style: fontStyleSentences(),),
                //               Image.asset('assets/images/amico.png',
                //                 height: MediaQuery.of(context).size.height / 7,
                //                 width: MediaQuery.of(context).size.width / 3,)
                //             ],
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(height: 16,),
                /////////////////////Orders(54)
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const NormalOrdersPage()));
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Orders(2)", style: fontStyle70022(),),
                              Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.greyBorder,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                                  child: Text("Today", style: fontStyle50012(AppColors.bgBlack),))
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Text("You have received total 54 orders today", style: fontStyleSentences(),)),
                              Image.asset('assets/images/amico.png',
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width / 3,)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                //////////////////////////////Scheduled Orders///////////////
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ScheduledOrdersPage()));
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Scheduled Orders", style: fontStyle70022(),),
                              Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.greyBorder,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                                  child: Text("Today", style: fontStyle50012(AppColors.bgBlack),))
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("56", style: TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w700,
                                  )),
                                  Text("You have received total 54 Scheduled orders", style: fontStyleSentences(),),
                                ],
                              )),
                              Image.asset('assets/images/amico.png',
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width / 3,)
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(16)
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 8, right: 8,top: 4,bottom: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.bgGreen2
                                      ),
                                        child: Text("12/08/23", style: fontStyle50012(AppColors.bgGreen),)),
                                    const SizedBox(height: 12,),
                                    Text("07 orders", style: fontStyle60016(AppColors.bgBlack),)
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(16)
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.only(left: 8, right: 8,top: 4,bottom: 4),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: AppColors.bgGreen2
                                        ),
                                        child: Text("13/08/23", style: fontStyle50012(AppColors.bgGreen),)),
                                    const SizedBox(height: 12,),
                                    Text("17 orders", style: fontStyle60016(AppColors.bgBlack),)
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(16)
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.only(left: 8, right: 8,top: 4,bottom: 4),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: AppColors.bgGreen2
                                        ),
                                        child: Text("14/08/23", style: fontStyle50012(AppColors.bgGreen),)),
                                    const SizedBox(height: 12,),
                                    Text("15 orders", style: fontStyle60016(AppColors.bgBlack),)
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed, // Use this if you have more than 3 items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Account",
          ),
        ],
        onTap: (index) {
          setState(() {
           switch (index) {
             case 0: Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
             break;
             case 1: Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProductAddPage()));
             break;
             case 2: Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OrdersPage()));
             break;
             case 4: Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AccountPage()));
           }
          });
        },
      ),
    );
  }
}

class OrderStatus {
  final String time;
  final String status;

  OrderStatus(this.time, this.status);
}