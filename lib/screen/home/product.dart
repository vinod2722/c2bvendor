import 'package:c2b_vendor/common/Colors.dart';
import 'package:c2b_vendor/common/widgets.dart';
import 'package:c2b_vendor/screen/home/product_upload.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../account/account_detail.dart';
import 'addon.dart';
import 'banner.dart';
import 'home_ui.dart';
import 'orders.dart';

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({super.key});

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return  WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // leading: IconButton(
          //   onPressed: ()=> Navigator.pop(context),
          //   icon: Icon(Icons.arrow_back, color: AppColors.bgBlack,),
          // ),
          title: Text("Product",style: fontStyle60016(AppColors.bgBlack), ),
          centerTitle: true,
          actions: [
            //Image(image: AssetImage("assets/images/FAQ.png"))
            Icon(Icons.add, color: AppColors.bgBlack,)
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  ////////////////////////Banner Card///////////////////////////
                  InkWell(
                    onTap: () {
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const BannerUploadingPage()));
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImageUploadScreen()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0), // Adjust the radius as needed
                      ),
                      color: AppColors.headerGradient2,
                      child: Container(
                        padding: EdgeInsets.all(24),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text("Banner(s)",
                                            style: TextStyle(
                                          fontSize: 34,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.bgWhite
                                        )),
                                      ),
                                      const SizedBox(height: 16,),
                                      Text("Add/edit your Banners here", style: fontStyle40022(AppColors.bgWhite),),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container( padding: EdgeInsets.all(10),
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
                                        ), alignment: Alignment.topRight,
                                        child: Icon(Icons.arrow_forward, color: AppColors.bgBlack,)),
                                  ],
                                ),
                              ],
                            ),





                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     Container( padding: EdgeInsets.all(10),
                            //         decoration: BoxDecoration(
                            //           shape: BoxShape.circle,
                            //           color: AppColors.bgWhite,
                            //           boxShadow: [
                            //             BoxShadow(
                            //               color: Colors.black.withOpacity(0.3),
                            //               spreadRadius: 2,
                            //               blurRadius: 4,
                            //               offset: const Offset(0, 2),
                            //             ),
                            //           ],
                            //         ), alignment: Alignment.topRight,
                            //         child: Icon(Icons.arrow_forward, color: AppColors.bgBlack,)),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ///////////////////////////Product Card////////////////////////////////
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProductUploadPage()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0), // Adjust the radius as needed
                      ),
                      color: AppColors.headerGradient2,
                      child: Container(
                        decoration: BoxDecoration(
                          // gradient: LinearGradient(
                          //   begin: Alignment.topLeft,
                          //   end: Alignment.centerRight,
                          //   colors: [AppColors.headerGradient2WithOpacity, AppColors.bgWhite],
                          // ),
                        ),

                          //#E74C3C, #E74C3C40
                        padding: EdgeInsets.all(24),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Product(s)",
                                    style: TextStyle(
                                      fontSize: 34,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.bgWhite,
                                    ),
                                  ),
                                  const SizedBox(height: 16,),
                                  Text(
                                    "Add/edit your Products here",
                                    style: fontStyle40022(AppColors.bgWhite),
                                  ),
                                  const SizedBox(height: 12,),

                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end, // Align the icon to the right
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
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
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: AppColors.bgBlack,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )

                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  //////Addons Card////
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddOnsPage()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0), // Adjust the radius as needed
                      ),
                      color: AppColors.headerGradient2,
                      child: Container(
                          decoration: BoxDecoration(
                            // gradient: LinearGradient(
                            //   begin: Alignment.topLeft,
                            //   end: Alignment.centerRight,
                            //   colors: [AppColors.headerGradient2WithOpacity, AppColors.bgWhite],
                            // ),
                          ),

                          //#E74C3C, #E74C3C40
                          padding: EdgeInsets.all(24),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Add-on(s)",
                                      style: TextStyle(
                                        fontSize: 34,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.bgWhite,
                                      ),
                                    ),
                                    const SizedBox(height: 16,),
                                    Text(
                                      "Add/edit your Products here",
                                      style: fontStyle40022(AppColors.bgWhite),
                                    ),
                                    const SizedBox(height: 12,),

                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end, // Align the icon to the right
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
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
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: AppColors.bgBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )

                      ),
                    ),
                  ),
                  // const SizedBox(height: 20,),
                  // ////////////////////Category Card./////////////////////////////////////
                  // Card(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(24.0), // Adjust the radius as needed
                  //   ),
                  //   color: AppColors.headerGradient2,
                  //   child: Container(
                  //     padding: EdgeInsets.all(24),
                  //     width: MediaQuery.of(context).size.width,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Expanded(
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //
                  //             children: [
                  //               Text("Category", style: TextStyle(
                  //                   fontSize: 34,
                  //                   fontWeight: FontWeight.w700,
                  //                   color: AppColors.bgWhite
                  //               )),
                  //               const SizedBox(height: 20,),
                  //               Text("Add/edit your Category here", style: fontStyle40022(AppColors.bgWhite),),
                  //               const SizedBox(height: 12,),
                  //
                  //             ],
                  //           ),
                  //         ),
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.end,
                  //           children: [
                  //             Container(
                  //                 padding: EdgeInsets.all(10),
                  //                 decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   color: AppColors.bgWhite,
                  //                   boxShadow: [
                  //                     BoxShadow(
                  //                       color: Colors.black.withOpacity(0.3),
                  //                       spreadRadius: 2,
                  //                       blurRadius: 4,
                  //                       offset: const Offset(0, 2),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 child: Icon(Icons.arrow_forward, color: AppColors.bgBlack,)),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // )
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
      ),
    );

  }
}
