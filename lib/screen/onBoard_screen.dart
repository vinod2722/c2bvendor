//
//
//
// import 'package:c2b_vendor/screen/sign_up/sign_up_screen.dart';
// import 'package:flutter/material.dart';
//
// import '../common/Colors.dart';
// import '../common/widgets.dart';
//
//
// class OnBoardingScreenPage extends StatefulWidget {
//   const OnBoardingScreenPage({Key? key}) : super(key: key);
//
//   @override
//   _OnBoardingScreenPageState createState() => _OnBoardingScreenPageState();
// }
//
// class _OnBoardingScreenPageState extends State<OnBoardingScreenPage> {
//   PageController pageController = PageController();
//   int currentPage = 0;
//
//   List<Map<String, String>> onBoardingData = [
//     {
//       "image": "assets/images/1.png",
//       "title": "Welcome to C2B",
//       "description": "Discover Endless Possibilities in Products & Food & Services",
//     },
//     {
//       "image": "assets/images/amico.png",
//       "title": "Transform your space with ease",
//       "description": "Elplore High-Quality Products & Services for Every Project",
//     },
//     {
//       "image": "assets/images/3.png",
//       "title": "Information",
//       "description": "Get Inspired by Expert Designs & Create your Dreams Spaces, Get Inspired by Expert Designs & Create your Dreams Spaces",
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           PageView.builder(
//             itemCount: onBoardingData.length,
//             scrollDirection: Axis.horizontal,
//             controller: pageController,
//             onPageChanged: onChanged,
//             itemBuilder: (BuildContext context, int index) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Image.asset(onBoardingData[index]['image']!),
//                   const SizedBox(height: 90),
//                   Text(onBoardingData[index]['title']!, style: fontStyleHeading(AppColors.bgBlack),textAlign: TextAlign.center,),
//                   const SizedBox(height: 24,),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(onBoardingData[index]['description']!, style: fontStyleSentences(),textAlign: TextAlign.center,),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(
//                       onBoardingData.length,
//                           (index) => buildIndicator(index),
//                     ),
//                   ),
//
//                 ],
//               );
//             },
//           ),
//           Positioned(
//             bottom: 20.0,
//             left: 20.0,
//             right: 20.0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 if (currentPage == 0 || currentPage == 1)
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.transparent,
//                         elevation: 0
//                     ),
//                     onPressed: () {
//                       pageController.previousPage(
//                         duration: const Duration(milliseconds: 500),
//                         curve: Curves.ease,
//                       );
//                     },
//                     child:  InkWell(
//                       onTap: (){
//                         //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpScreen()));
//                       },
//                       child: Row(
//                         children: [
//                           Text("Skip", style: fontStyleSentences(),),
//                           const SizedBox(width: 8,),
//                           Icon(Icons.arrow_forward_ios, color: AppColors.bgBlack, size: 15,)
//                         ],
//                       ),
//                     ),
//                   ),
//                 if (currentPage != onBoardingData.length - 1)
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.headerGradient2,
//                       padding: EdgeInsets.only(left: 40, right: 40, top: 12, bottom: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
//                       ),
//                     ),
//                     onPressed: () {
//                       pageController.nextPage(
//                         duration: const Duration(milliseconds: 500),
//                         curve: Curves.ease,
//                       );
//                     },
//                     child:  Row(
//                       children: [
//                         Text("Next", style: fontStyleHeading(AppColors.bgWhite),),
//                         const SizedBox(width: 8,),
//                         Icon(Icons.arrow_forward, size: 20,)
//                       ],
//                     ),
//                   ),
//                 if (currentPage == onBoardingData.length - 1)
//                   Expanded(
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.headerGradient2,
//                         padding: EdgeInsets.only(left: 40, right: 40, top: 12, bottom: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
//                         ),
//                       ),
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpScreen()));
//                       },
//                       child:  Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("Get Started", style: fontStyleHeading(AppColors.bgWhite),),
//                           const SizedBox(width: 8,),
//                           Icon(Icons.arrow_forward)
//                         ],
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildIndicator(int index) {
//     return Container(
//       width: 8.0,
//       height: 8.0,
//       margin: const EdgeInsets.symmetric(horizontal: 4.0),
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: currentPage == index ? Colors.blue : Colors.grey,
//       ),
//     );
//   }
//
//   void onChanged(int index) {
//     setState(() {
//       currentPage = index;
//     });
//   }
// }
//
// void main() {
//   runApp(const MaterialApp(
//     home: OnBoardingScreenPage(),
//   ));
// }
//
//




//  import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class OnBoarding_Screen_Page extends StatefulWidget {
//    const OnBoarding_Screen_Page({super.key});
//
//    @override
//    State<OnBoarding_Screen_Page> createState() => _OnBoarding_Screen_PageState();
//  }
//
//  class _OnBoarding_Screen_PageState extends State<OnBoarding_Screen_Page> {
//
//   PageController pageController = PageController();
//  int  currentPage = 0;
//   onChanged(int index) {
//     setState(() {
//       currentPage = index;
//     });
//   }
//
//   List onBoardingData = [
//     {
//       "image" : "assets/images/frame.png",
//       "title" : "Care your family",
//       "description" : "hsdvcjkdbhjcbdsjhxvbdjb"
//     },
//     {
//       "image" : "assets/images/frame.png",
//       "title" : "Care your family",
//       "description" : "hsdvcjkdbhjcbdsjhxvbdjb"
//     },
//     {
//       "image" : "assets/images/frame.png",
//       "title" : "Care your family",
//       "description" : "hsdvcjkdbhjcbdsjhxvbdjb"
//     }
//   ];
//    @override
//    Widget build(BuildContext context) {
//     //  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: ))
//      return  Scaffold(
//        body: Stack(
//          children: [
//
//            PageView.builder(
//              itemCount: onBoardingData.length,
//                scrollDirection: Axis.horizontal,
//                controller: pageController,
//                onPageChanged: onChanged,
//                itemBuilder: (BuildContext context, int index) {
//                return Column(
//                  children: [
//                    const SizedBox(height: 100,),
//                    Image.asset(onBoardingData[index]['image']),
//                    Text(onBoardingData[index]['title']),
//                    Text(onBoardingData[index]['description']),
//                  ],
//                );
//                }
//            )
//          ],
//        ),
//      );
//    }
//  }



import 'package:c2b_vendor/screen/singn_in/sign_in.dart';
import 'package:flutter/material.dart';


import '../common/Colors.dart';
import '../common/widgets.dart';

class OnBoardingScreenPage extends StatefulWidget {
  const OnBoardingScreenPage({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenPageState createState() => _OnBoardingScreenPageState();
}

class _OnBoardingScreenPageState extends State<OnBoardingScreenPage> {
  PageController pageController = PageController();
  int currentPage = 0;

  List<Map<String, String>> onBoardingData = [
    {
      "image": "assets/images/2.png",
      "title": "Welcome to C2B",
      "description": "Discover Endless Possibilities in Products & Food & Services",
    },
    {
      "image": "assets/images/2.png",
      "title": "Transform your space with ease",
      "description": "Elplore High-Quality Products & Services for Every Project",
    },
    {
      "image": "assets/images/2.png",
      "title": "Information",
      "description": "Get Inspired by Expert Designs & Create your Dreams Spaces, Get Inspired by Expert Designs & Create your Dreams Spaces",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              itemCount: onBoardingData.length,
              scrollDirection: Axis.horizontal,
              controller: pageController,
              onPageChanged: onChanged,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(onBoardingData[index]['image']!),
                    const SizedBox(height: 90),
                    Text(onBoardingData[index]['title']!, style: fontStyleHeading(AppColors.bgBlack),textAlign: TextAlign.center,),
                    const SizedBox(height: 24,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(onBoardingData[index]['description']!, style: fontStyleSentences(),textAlign: TextAlign.center,),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onBoardingData.length,
                            (index) => buildIndicator(index),
                      ),
                    ),

                  ],
                );
              },
            ),
            Positioned(
              bottom: 20.0,
              left: 20.0,
              right: 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentPage == 0 || currentPage == 1)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0
                      ),
                      onPressed: () {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child:  InkWell(
                        onTap: (){
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpScreen()));
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Sign_In_Page()));
                        },
                        child: Row(
                          children: [
                            Text("Skip", style: fontStyleSentences(),),
                            const SizedBox(width: 8,),
                            Icon(Icons.arrow_forward_ios, color: AppColors.bgBlack, size: 15,)
                          ],
                        ),
                      ),
                    ),
                  if (currentPage != onBoardingData.length - 1)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.headerGradient2,
                        padding: EdgeInsets.only(left: 40, right: 40, top: 12, bottom: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
                        ),
                      ),
                      onPressed: () {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child:  Row(
                        children: [
                          Text("Next", style: fontStyleHeading(AppColors.bgWhite),),
                          const SizedBox(width: 8,),
                          Icon(Icons.arrow_forward, size: 20,)
                        ],
                      ),
                    ),
                  if (currentPage == onBoardingData.length - 1)
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.headerGradient2,
                          padding: EdgeInsets.only(left: 40, right: 40, top: 12, bottom: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Sign_In_Page()));
                        },
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Get Started", style: fontStyleHeading(AppColors.bgWhite),),
                            const SizedBox(width: 8,),
                            Icon(Icons.arrow_forward)
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentPage == index ? Colors.blue : Colors.grey,
      ),
    );
  }

  void onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }
}

void main() {
  runApp(const MaterialApp(
    home: OnBoardingScreenPage(),
  ));
}


