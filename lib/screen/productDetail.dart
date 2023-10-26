// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
//
//
// import '../common/Colors.dart';
// import '../common/widgets.dart';
//
// class ProductDetailPage extends StatefulWidget {
//   const ProductDetailPage({super.key});
//
//   @override
//   State<ProductDetailPage> createState() => _ProductDetailPageState();
// }
//
// class _ProductDetailPageState extends State<ProductDetailPage> {
//   final List<String> imagePath = [
//     "https://i.etsystatic.com/28937259/r/il/9337a9/4262769337/il_fullxfull.4262769337_jq6d.jpg",
//     "https://i.etsystatic.com/28937259/r/il/9337a9/4262769337/il_fullxfull.4262769337_jq6d.jpg",
//     "https://i.etsystatic.com/28937259/r/il/9337a9/4262769337/il_fullxfull.4262769337_jq6d.jpg",
//     "https://i.etsystatic.com/28937259/r/il/9337a9/4262769337/il_fullxfull.4262769337_jq6d.jpg",
//     "https://i.etsystatic.com/28937259/r/il/9337a9/4262769337/il_fullxfull.4262769337_jq6d.jpg",
//     "https://i.etsystatic.com/28937259/r/il/9337a9/4262769337/il_fullxfull.4262769337_jq6d.jpg",
//     // "assets/images/frame.png",
//     // "assets/images/frame.png",
//     // "assets/images/frame.png",
//     // "assets/images/frame.png",
//     // "assets/images/frame.png",
//     // "assets/images/frame.png",
//   ];
//   final List<Color> tabColors = [
//     Colors.red,
//     Colors.blue,
//     Colors.green,
//     Colors.blue,
//     Colors.green,
//   ];
//   final List<String> tabSizes = [
//     "S",
//     "M",
//     "L",
//     "XL",
//     "XXL",
//   ];
//   final List<String> specifications = [
//     "Material: High-quality cotton blend ",
//     "Fit: Regular fit ",
//     "Pattern: Multi-color vertical stripes",
//     " Collar: Classic button-down collar ",
//     "Sleeve: Full sleeves with button cuffs ",
//     "Closure: Front button closure ",
//     "Pocket: Single chest pocket ",
//     "Care Instructions: Machine wash cold, gentle cycle; do not bleach; tumble dry low; iron on low heat",
//   ];
//   final List<String> DeliveryInformation = [
//     "Estimated Delivery: 45Min ",
//     "Shipping Fee: Free (Free shipping on orders above ₹ 1,000) ",
//     "Delivery address: Plot no: 477, Jawaharlal Nehru Road, BEML Layout 3rd Stage, RR Nagar Land Mark: Above Louis Philippe Showroom, opposite to Sub Register Office, Rajarajeshwari Nagar, Bengaluru, Karnataka 560098",
//   ];
//
//   final List<Map<String, String>> paymentMethods = [
//     {
//       "imagePath": "assets/images/amico.png",
//       "text": "Mastercard",
//     },
//     {
//       "imagePath": "assets/images/amico.png",
//       "text": "Mastercard",
//     },
//     {
//       "imagePath": "assets/images/amico.png",
//       "text": "Mastercard",
//     },
//     {
//       "imagePath": "assets/images/amico.png",
//       "text": "Visa",
//     },
//     {
//       "imagePath": "assets/images/amico.png",
//       "text": "Visa",
//     },
//     {
//       "imagePath": "assets/images/amico.png",
//       "text": "Visa",
//     },
//   ];
//   int currentIndex = 0;
//   int _currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     Widget specification() {
//       return ListView.builder(
//         shrinkWrap: true,
//         physics: const ClampingScrollPhysics(),
//         itemCount: specifications.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             padding: const EdgeInsets.only(left: 18),
//             child: Row(
//               children: [
//                 const Icon(
//                   Icons.brightness_1,
//                   size: 5,
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(
//                     child: Text(
//                       specifications[index],
//                       style: fontStyleSentences(),
//                     )),
//               ],
//             ),
//           );
//         },
//       );
//     }
//
//     Widget DeliveryInstructions() {
//       return ListView.builder(
//         shrinkWrap: true,
//         physics: const ClampingScrollPhysics(),
//         itemCount: DeliveryInformation.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             padding: const EdgeInsets.only(left: 18),
//             child: Row(
//               children: [
//                 const Icon(
//                   Icons.brightness_1,
//                   size: 5,
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(
//                     child: Text(
//                       DeliveryInformation[index],
//                       style: fontStyleSentences(),
//                     )),
//               ],
//             ),
//           );
//         },
//       );
//     }
//
//     Widget productDescription() {
//       return Container(
//         padding: const EdgeInsets.only(left: 16, right: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text("Mistari Shirt - Multi Color",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w700,
//                 )),
//             const SizedBox(
//               height: 8,
//             ),
//             const Text(
//                 "Spice Fusion - #23, Brigade Road Kormangala, Bangalore-560034",
//                 style: TextStyle(
//                   fontSize: 13,
//                   fontWeight: FontWeight.w600,
//                 )),
//             const SizedBox(
//               height: 8,
//             ),
//             const Text(
//                 "Summer in the Cambodian flower market-thats the vibe this print channels",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                 )),
//             const SizedBox(
//               height: 8,
//             ),
//             Row(
//               children: [
//                 const Icon(
//                   Icons.star,
//                   size: 14,
//                 ),
//                 const Text("4.8"),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     width: 5,
//                     height: 5,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 const Text("28 Review",
//                     style: TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w600,
//                     ))
//               ],
//             )
//           ],
//         ),
//       );
//     }
//
//     Widget colorTab() {
//       return Container(
//         padding: const EdgeInsets.only(left: 16, right: 16),
//         child: Row(
//           children: [
//             const Expanded(
//                 flex: 2000,
//                 child: Text("Colour",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                     ))),
//             Expanded(
//               flex: 8000,
//               child: Container(
//                 height: 30,
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: tabColors.length,
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: () {
//                         setState(() {
//                           currentIndex = index;
//                         });
//                       },
//                       child: Container(
//                         margin: const EdgeInsets.all(2),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(25),
//                           color: tabColors[index],
//                         ),
//                         width: 40,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//
//     Widget returnPolicy() {
//       return Container(
//         padding: const EdgeInsets.only(left: 16, right: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "ReturnPolicy",
//               style: fontStyleHeading(AppColors.bgBlack),
//             ),
//             Row(
//               children: [
//                 Container(
//                   height: 5,
//                   width: 5,
//                   decoration: const BoxDecoration(color: Colors.grey),
//                 ),
//                 Text(
//                   "Easy 30-day returns",
//                   style: fontStyleSentences(),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Container(
//                   height: 5,
//                   width: 5,
//                   decoration: const BoxDecoration(color: Colors.grey),
//                 ),
//                 const Text("Easy 30-day returns"),
//               ],
//             )
//           ],
//         ),
//       );
//     }
//
//
//     return Scaffold(
//       appBar: appbarWithImageCoursel(
//           imagePath,  context, currentIndex),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             // padding: const EdgeInsets.only(left: 16, right: 16),
//             child: Column(
//               children: [
//                 productDescription(),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Divider(
//                   height: 5,
//                   thickness: 1,
//                   color: Colors.grey,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 colorTab(),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(left: 16, right: 16),
//                   child: Row(
//                     children: [
//                       const Expanded(
//                           flex: 2000,
//                           child: Text("Size",
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                               ))),
//                       Expanded(
//                         flex: 8000,
//                         child: Container(
//                           height: 30,
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             itemCount: tabSizes.length,
//                             itemBuilder: (context, index) {
//                               return InkWell(
//                                 onTap: () {
//                                   setState(() {
//                                     currentIndex = index;
//                                     print(tabSizes[index]);
//                                   });
//                                 },
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   margin: const EdgeInsets.all(2),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(25),
//                                       border: Border.all()),
//                                   width: 40,
//                                   child: Text(tabSizes[index],
//                                       style: const TextStyle(
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w600,
//                                       )),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Divider(
//                   height: 5,
//                   thickness: 1,
//                   color: Colors.grey,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ///////Specification content
//                 Container(
//                   padding: const EdgeInsets.only(left: 16, right: 16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text("Specification",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                           )),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       specification()
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(left: 12, right: 12),
//                   decoration: BoxDecoration(
//                       border: Border.all(),
//                       borderRadius:
//                       const BorderRadius.all(Radius.circular(20))),
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(16),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Negotiable",
//                               style: fontStyleHeading(AppColors.bgBlack),
//                             ),
//                             const Icon(Icons.chat)
//                           ],
//                         ),
//                       ),
//
//                       //const SizedBox(height: 8,),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             left: 16, right: 16, bottom: 16),
//                         child: Text(
//                           "Negotiate for the best deal! Chat with the seller to discuss offers, discounts, and customizations before making your purchase.",
//                           style: fontStyleSentences(),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Divider(
//                   height: 5,
//                   thickness: 1,
//                   color: Colors.grey,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(left: 16, right: 16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text("Delivery Information",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                           )),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       DeliveryInstructions(),
//                       const SizedBox(
//                         height: 12,
//                       ),
//                       ////////Schedule order date and time
//                       Container(
//                         padding: const EdgeInsets.only(
//                             left: 16, right: 24, top: 10, bottom: 10),
//                         decoration: BoxDecoration(
//                             border: Border.all(),
//                             borderRadius:
//                             const BorderRadius.all(Radius.circular(30))),
//                         child: InkWell(
//                           onTap: () {
//                             // DatePicker.showDatePicker(context,
//                             //     showTitleActions: true,
//                             //     //minTime: DateTime(2018, 3, 5),
//                             //     maxTime: DateTime(2040, 6, 7),
//                             //     onChanged: (date) {
//                             //       print('change $date');
//                             //     }, onConfirm: (date) {
//                             //       print('confirm $date');
//                             //     },
//                             //     currentTime: DateTime.now(),
//                             //     locale: LocaleType.en);
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Schedule order date and time",
//                                 style: fontStyleHeading(AppColors.bgBlack),
//                               ),
//                               const Icon(Icons.arrow_forward)
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 12,
//                       ),
//                       /////////////////////Select Delivery option
//                       Container(
//                         padding: const EdgeInsets.only(
//                             left: 16, right: 24, top: 10, bottom: 10),
//                         decoration: BoxDecoration(
//                             border: Border.all(),
//                             color: AppColors.headerGradient2,
//                             borderRadius:
//                             const BorderRadius.all(Radius.circular(30))),
//                         child: InkWell(
//                           onTap: () {
//                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CartPage()));
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Select Delivery address",
//                                 style: fontStyleHeading(AppColors.bgWhite),
//                               ),
//                               Icon(Icons.arrow_forward, color: AppColors.bgWhite,)
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Divider(
//                         height: 5,
//                         thickness: 1,
//                         color: Colors.grey,
//                       ),
//                       ///////////Payments We accept/////////////////////////////
//                       Text("Payments : We Accept", style: fontStyle50012(AppColors.bgBlack),),
//                       Container(
//                           child: GridView.builder(
//                               shrinkWrap: true,
//                               physics: const ClampingScrollPhysics(),
//                               itemCount: paymentMethods.length,
//                               gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 3,
//                                 //crossAxisSpacing: 10.0,
//                                 //mainAxisSpacing: 10.0,
//                               ),
//                               itemBuilder: (BuildContext context, int index) {
//                                 final imagePath =
//                                 paymentMethods[index]["imagePath"];
//                                 final text = paymentMethods[index]["text"];
//                                 return Container(
//                                   child: Column(
//                                     children: [
//
//                                       Image.asset(
//                                         imagePath!,
//                                         width: 80,
//                                         height: 80,
//                                       ),
//                                       const SizedBox(height: 8),
//                                       Text(text!),
//                                     ],
//                                   ),
//                                 );
//                               })),
//                       const Divider(
//                         height: 5,
//                         thickness: 1,
//                         color: Colors.grey,
//                       ),
//                       ////////////Return Policy/////////////////////////////////
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       returnPolicy(),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Divider(
//                         height: 5,
//                         thickness: 1,
//                         color: Colors.grey,
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       ////////////////////////Edit///////////////////////////
//                       Container(
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.headerGradient2,
//                             padding: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(24.0),
//                             ),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text("Edit", style: fontStyleHeading(AppColors.bgWhite),),
//                               Icon(Icons.edit)
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//
//   }
// }









//////////////////////Above one is working code///////////////////


import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../common/Colors.dart';
import '../common/widgets.dart';

class ProductDetailsPage extends StatefulWidget {
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  final List<Color> tabColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.blue,
    Colors.green,
  ];
  final List<String> tabSizes = [
    "S",
    "M",
    "L",
    "XL",
    "XXL",
  ];
  final List<String> specifications = [
    "Material: High-quality cotton blend ",
    "Fit: Regular fit ",
    "Pattern: Multi-color vertical stripes",
    " Collar: Classic button-down collar ",
    "Sleeve: Full sleeves with button cuffs ",
    "Closure: Front button closure ",
    "Pocket: Single chest pocket ",
    "Care Instructions: Machine wash cold, gentle cycle; do not bleach; tumble dry low; iron on low heat",
  ];
  final List<String> DeliveryInformation = [
    "Estimated Delivery: 45Min ",
    "Shipping Fee: Free (Free shipping on orders above ₹ 1,000) ",
    "Delivery address: Plot no: 477, Jawaharlal Nehru Road, BEML Layout 3rd Stage, RR Nagar Land Mark: Above Louis Philippe Showroom, opposite to Sub Register Office, Rajarajeshwari Nagar, Bengaluru, Karnataka 560098",
  ];

  final List<Map<String, String>> paymentMethods = [
    {
      "imagePath": "assets/images/amico.png",
      "text": "Mastercard",
    },
    {
      "imagePath": "assets/images/amico.png",
      "text": "Mastercard",
    },
    {
      "imagePath": "assets/images/amico.png",
      "text": "Mastercard",
    },
    {
      "imagePath": "assets/images/amico.png",
      "text": "Visa",
    },
    {
      "imagePath": "assets/images/amico.png",
      "text": "Visa",
    },
    {
      "imagePath": "assets/images/amico.png",
      "text": "Visa",
    },
  ];
  int currentIndex = 0;
  int _currentIndex = 0;


  double appBarHeight = 300.0; // Initial height of the app bar
  double expandedAppBarHeight = 500.0; // Expanded height of the app bar
  bool isExpanded = false;

  List<String> imageUrls = [
    // Add your list of product image URLs here
    "https://i.etsystatic.com/28937259/r/il/9337a9/4262769337/il_fullxfull.4262769337_jq6d.jpg",
    "https://i.etsystatic.com/28937259/r/il/9337a9/4262769337/il_fullxfull.4262769337_jq6d.jpg",
    "https://i.etsystatic.com/28937259/r/il/9337a9/4262769337/il_fullxfull.4262769337_jq6d.jpg",
    "https://i.etsystatic.com/28937259/r/il/9337a9/4262769337/il_fullxfull.4262769337_jq6d.jpg",
    "https://i.etsystatic.com/28937259/r/il/9337a9/4262769337/il_fullxfull.4262769337_jq6d.jpg",
  ];

  @override
  Widget build(BuildContext context) {


    Widget specification() {
      return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: specifications.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.only(left: 18),
            child: Row(
              children: [
                const Icon(
                  Icons.brightness_1,
                  size: 5,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                      specifications[index],
                      style: fontStyleSentences(),
                    )),
              ],
            ),
          );
        },
      );
    }

    Widget DeliveryInstructions() {
      return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: DeliveryInformation.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.only(left: 18),
            child: Row(
              children: [
                const Icon(
                  Icons.brightness_1,
                  size: 5,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                      DeliveryInformation[index],
                      style: fontStyleSentences(),
                    )),
              ],
            ),
          );
        },
      );
    }

    Widget productDescription() {
      return Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Mistari Shirt - Multi Color",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                )),
            const SizedBox(
              height: 8,
            ),
            const Text(
                "Spice Fusion - #23, Brigade Road Kormangala, Bangalore-560034",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(
              height: 8,
            ),
            const Text(
                "Summer in the Cambodian flower market-thats the vibe this print channels",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  size: 14,
                ),
                const Text("4.8"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Text("28 Review",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ))
              ],
            )
          ],
        ),
      );
    }

    Widget colorTab() {
      return Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          children: [
            const Expanded(
                flex: 2000,
                child: Text("Colour",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ))),
            Expanded(
              flex: 8000,
              child: Container(
                height: 30,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: tabColors.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: tabColors[index],
                        ),
                        width: 40,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget returnPolicy() {
      return Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ReturnPolicy",
              style: fontStyleHeading(AppColors.bgBlack),
            ),
            Row(
              children: [
                Container(
                  height: 5,
                  width: 5,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
                Text(
                  "Easy 30-day returns",
                  style: fontStyleSentences(),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 5,
                  width: 5,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
                const Text("Easy 30-day returns"),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: isExpanded ? expandedAppBarHeight : appBarHeight,
            child: Container(
              width: MediaQuery.of(context).size.width, // Full screen width
              child: CarouselSlider(
                items: imageUrls.map((imageUrl) {
                  return Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width, // Full screen width
                  );
                }).toList(),
                options: CarouselOptions(
                  height: expandedAppBarHeight,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Other product details go here
                productDescription(),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 5,
                  thickness: 1,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                colorTab(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: [
                      const Expanded(
                          flex: 2000,
                          child: Text("Size",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ))),
                      Expanded(
                        flex: 8000,
                        child: Container(
                          height: 30,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: tabSizes.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    currentIndex = index;
                                    print(tabSizes[index]);
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all()),
                                  width: 40,
                                  child: Text(tabSizes[index],
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 5,
                  thickness: 1,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                ///////Specification content
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Specification",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      specification()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12, right: 12),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Negotiable",
                              style: fontStyleHeading(AppColors.bgBlack),
                            ),
                            const Icon(Icons.chat)
                          ],
                        ),
                      ),

                      //const SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 16),
                        child: Text(
                          "Negotiate for the best deal! Chat with the seller to discuss offers, discounts, and customizations before making your purchase.",
                          style: fontStyleSentences(),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 5,
                  thickness: 1,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Delivery Information",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      DeliveryInstructions(),
                      const SizedBox(
                        height: 12,
                      ),
                      ////////Schedule order date and time
                      Container(
                        padding: const EdgeInsets.only(
                            left: 16, right: 24, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                        child: InkWell(
                          onTap: () {
                            // DatePicker.showDatePicker(context,
                            //     showTitleActions: true,
                            //     //minTime: DateTime(2018, 3, 5),
                            //     maxTime: DateTime(2040, 6, 7),
                            //     onChanged: (date) {
                            //       print('change $date');
                            //     }, onConfirm: (date) {
                            //       print('confirm $date');
                            //     },
                            //     currentTime: DateTime.now(),
                            //     locale: LocaleType.en);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Schedule order date and time",
                                style: fontStyleHeading(AppColors.bgBlack),
                              ),
                              const Icon(Icons.arrow_forward)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      /////////////////////Select Delivery option
                      Container(
                        padding: const EdgeInsets.only(
                            left: 16, right: 24, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: AppColors.headerGradient2,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                        child: InkWell(
                          onTap: () {
                           // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CartPage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Select Delivery address",
                                style: fontStyleHeading(AppColors.bgWhite),
                              ),
                              Icon(Icons.arrow_forward, color: AppColors.bgWhite,)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      ///////////Payments We accept/////////////////////////////
                      Text("Payments : We Accept", style: fontStyle50012(AppColors.bgBlack),),
                      Container(
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount: paymentMethods.length,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                //crossAxisSpacing: 10.0,
                                //mainAxisSpacing: 10.0,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                final imagePath =
                                paymentMethods[index]["imagePath"];
                                final text = paymentMethods[index]["text"];
                                return Container(
                                  child: Column(
                                    children: [

                                      Image.asset(
                                        imagePath!,
                                        width: 80,
                                        height: 80,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(text!),
                                    ],
                                  ),
                                );
                              })),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      ////////////Return Policy/////////////////////////////////
                      const SizedBox(
                        height: 20,
                      ),
                      returnPolicy(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ////////////////////////Edit///////////////////////////
                      Container(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.headerGradient2,
                            padding: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Edit", style: fontStyleHeading(AppColors.bgWhite),),
                              Icon(Icons.edit)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


















































// return Scaffold(
//   body: CustomScrollView(
//     slivers: <Widget>[
//       SliverAppBar(
//         expandedHeight: 500.0, // Set the initial expanded height
//         floating: false,
//         pinned: true,
//         flexibleSpace: FlexibleSpaceBar(
//           //title: Text("App Bar Title"),
//           background: CarouselSlider(
//             items: imagePath.map((image) {
//               return Container(
//                 height: 500.0, // Adjust the required height
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage(image), // Replace with your image path
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               );
//             }).toList(),
//             options: CarouselOptions(
//               autoPlay: false,
//               //enlargeCenterPage: true,
//               aspectRatio: 0.1,
//               viewportFraction: 1.0,
//             ),
//
//           ),
//
//         ),
//       ),
//       SliverList(
//         delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//             return Container(
//               // padding: const EdgeInsets.only(left: 16, right: 16),
//               child: Column(
//                 children: [
//                   DotsIndicator(
//                     dotsCount: imagePath.length,
//                     position: _currentIndex,
//                     decorator: DotsDecorator(
//                       activeColor: const Color(0xFFE74c3c),
//                       size: const Size.square(9.0),
//                       activeSize: const Size(18.0, 9.0),
//                       activeShape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(5.0),
//                       ),
//                     ),
//                   ),
//                   productDescription(),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Divider(
//                     height: 5,
//                     thickness: 1,
//                     color: Colors.grey,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   colorTab(),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     padding: const EdgeInsets.only(left: 16, right: 16),
//                     child: Row(
//                       children: [
//                         const Expanded(
//                             flex: 2000,
//                             child: Text("Size",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600,
//                                 ))),
//                         Expanded(
//                           flex: 8000,
//                           child: Container(
//                             height: 30,
//                             child: ListView.builder(
//                               shrinkWrap: true,
//                               scrollDirection: Axis.horizontal,
//                               itemCount: tabSizes.length,
//                               itemBuilder: (context, index) {
//                                 return InkWell(
//                                   onTap: () {
//                                     setState(() {
//                                       currentIndex = index;
//                                       print(tabSizes[index]);
//                                     });
//                                   },
//                                   child: Container(
//                                     alignment: Alignment.center,
//                                     margin: const EdgeInsets.all(2),
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(25),
//                                         border: Border.all()),
//                                     width: 40,
//                                     child: Text(tabSizes[index],
//                                         style: const TextStyle(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w600,
//                                         )),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Divider(
//                     height: 5,
//                     thickness: 1,
//                     color: Colors.grey,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   ///////Specification content
//                   Container(
//                     padding: const EdgeInsets.only(left: 16, right: 16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text("Specification",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                             )),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         specification()
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(left: 12, right: 12),
//                     decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius:
//                         const BorderRadius.all(Radius.circular(20))),
//                     child: Column(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(16),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Negotiable",
//                                 style: fontStyleHeading(AppColors.bgBlack),
//                               ),
//                               const Icon(Icons.chat)
//                             ],
//                           ),
//                         ),
//
//                         //const SizedBox(height: 8,),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               left: 16, right: 16, bottom: 16),
//                           child: Text(
//                             "Negotiate for the best deal! Chat with the seller to discuss offers, discounts, and customizations before making your purchase.",
//                             style: fontStyleSentences(),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Divider(
//                     height: 5,
//                     thickness: 1,
//                     color: Colors.grey,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     padding: const EdgeInsets.only(left: 16, right: 16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text("Delivery Information",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                             )),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         DeliveryInstructions(),
//                         const SizedBox(
//                           height: 12,
//                         ),
//                         ////////Schedule order date and time
//                         Container(
//                           padding: const EdgeInsets.only(
//                               left: 16, right: 24, top: 10, bottom: 10),
//                           decoration: BoxDecoration(
//                               border: Border.all(),
//                               borderRadius:
//                               const BorderRadius.all(Radius.circular(30))),
//                           child: InkWell(
//                             onTap: () {
//                               // DatePicker.showDatePicker(context,
//                               //     showTitleActions: true,
//                               //     //minTime: DateTime(2018, 3, 5),
//                               //     maxTime: DateTime(2040, 6, 7),
//                               //     onChanged: (date) {
//                               //       print('change $date');
//                               //     }, onConfirm: (date) {
//                               //       print('confirm $date');
//                               //     },
//                               //     currentTime: DateTime.now(),
//                               //     locale: LocaleType.en);
//                             },
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "Schedule order date and time",
//                                   style: fontStyleHeading(AppColors.bgBlack),
//                                 ),
//                                 const Icon(Icons.arrow_forward)
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 12,
//                         ),
//                         /////////////////////Select Delivery option
//                         Container(
//                           padding: const EdgeInsets.only(
//                               left: 16, right: 24, top: 10, bottom: 10),
//                           decoration: BoxDecoration(
//                               border: Border.all(),
//                               color: AppColors.headerGradient2,
//                               borderRadius:
//                               const BorderRadius.all(Radius.circular(30))),
//                           child: InkWell(
//                             onTap: () {
//                               // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CartPage()));
//                             },
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "Select Delivery option",
//                                   style: fontStyleHeading(AppColors.bgWhite),
//                                 ),
//                                 Icon(Icons.arrow_forward, color: AppColors.bgWhite,)
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Divider(
//                           height: 5,
//                           thickness: 1,
//                           color: Colors.grey,
//                         ),
//                         ///////////Payments We accept/////////////////////////////
//                         Container(
//                             child: GridView.builder(
//                                 shrinkWrap: true,
//                                 physics: const ClampingScrollPhysics(),
//                                 itemCount: paymentMethods.length,
//                                 gridDelegate:
//                                 const SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 3,
//                                   //crossAxisSpacing: 10.0,
//                                   //mainAxisSpacing: 10.0,
//                                 ),
//                                 itemBuilder: (BuildContext context, int index) {
//                                   final imagePath =
//                                   paymentMethods[index]["imagePath"];
//                                   final text = paymentMethods[index]["text"];
//                                   return Container(
//                                     child: Column(
//                                       children: [
//                                         Image.asset(
//                                           imagePath!,
//                                           width: 80,
//                                           height: 80,
//                                         ),
//                                         const SizedBox(height: 8),
//                                         Text(text!),
//                                       ],
//                                     ),
//                                   );
//                                 })),
//                         const Divider(
//                           height: 5,
//                           thickness: 1,
//                           color: Colors.grey,
//                         ),
//                         ////////////Return Policy/////////////////////////////////
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         returnPolicy(),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Divider(
//                           height: 5,
//                           thickness: 1,
//                           color: Colors.grey,
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         ////////////////////////Reviews///////////////////////////
//                         Container(
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   const Icon(
//                                     Icons.star,
//                                     size: 14,
//                                   ),
//                                   Text("4.8",
//                                       style: fontStyleHeading(AppColors.bgBlack)),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Container(
//                                       width: 5,
//                                       height: 5,
//                                       decoration: const BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ),
//                                   Text("Review(28)",
//                                       style: fontStyleHeading(AppColors.bgBlack))
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 12,
//                               ),
//                               //reviewList()
//                             ],
//                           ),
//                         ),
//
//                         const SizedBox(
//                           height: 20,
//                         ),
//
//                         ////////////////?Show All Reviews/////////////////
//                         Container(
//                           padding: const EdgeInsets.only(
//                               left: 16, right: 24, top: 10, bottom: 10),
//                           decoration: BoxDecoration(
//                               border: Border.all(),
//                               borderRadius:
//                               const BorderRadius.all(Radius.circular(30))),
//                           child: InkWell(
//                             onTap: () {
//                               //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AllReviewsPage()));
//                             },
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "Show all 28 Reviews",
//                                   style: fontStyleHeading(AppColors.bgBlack),
//                                 ),
//                                 const Icon(Icons.arrow_forward)
//                               ],
//                             ),
//                           ),
//                         ),
//
//
//                         const SizedBox(
//                           height: 20,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//           childCount: 50, // Replace with the number of items in your list
//         ),
//       ),
//     ],
//   ),
// );
