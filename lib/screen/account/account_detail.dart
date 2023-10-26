import 'package:c2b_vendor/screen/account/privacyPolicy.dart';
import 'package:c2b_vendor/screen/account/profile.dart';
import 'package:c2b_vendor/screen/account/serviceplan.dart';
import 'package:c2b_vendor/screen/account/store_info.dart';
import 'package:c2b_vendor/screen/account/terms_and_services.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

import '../../common/Colors.dart';
import '../../common/widgets.dart';
import '../../providers/providers.dart';
import '../dialogs/logout_dialouge.dart';
import 'customer_support.dart';
import 'feedBack.dart';
import 'login&security.dart';

class Account {
  final String title;
  final String? subtitle; // Make it nullable if not all items have subtitles

  Account(this.title, {this.subtitle});
}
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  final LocalStorage userToken = LocalStorage('user_token');

  late String token = '';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    token = userToken.getItem('token');

    print(token);

    Provider.of<ProviderVendor>(context, listen: false)
        .getUserData(token);

  }

  //////////Account details class//////////////


  final List<Account> account = [
  Account("Store info"),
  Account("Login and Security"),
  Account("Terms and Services"),
  Account("Privacy Policy"),
    Account("Service Plans"),
  Account("Feedback"),
  Account("Customer Support"),

  ];

  @override
  Widget build(BuildContext context) {

    ////////////////Profile Card///////////////
    // Widget profileCard() {
    //   return Container(
    //     child: Card(
    //       elevation: 4, // Adjust the elevation as needed
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(24), // Sets the border radius
    //       ),
    //       child: Container(
    //         padding: const EdgeInsets.all(16),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text("Profile", style: fontStyleHeading(AppColors.bgBlack),),
    //             const SizedBox(height: 24,),
    //             Row(
    //               children: [
    //                 const CircleAvatar(
    //                   radius: 30, // Adjust the radius as needed
    //                   backgroundImage: AssetImage('assets/images/frame.png'), // Provide your image asset
    //                 ),
    //                 const SizedBox(width: 20), // Add spacing between the avatar and text
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                         'John Doe', // Replace with the user's name
    //                         style: fontStyleSentences()
    //                     ),
    //                     const SizedBox(height: 8,),
    //                     Text(
    //                         '+1 (123) 456-7890', // Replace with the user's number
    //                         style: fontStyleSentences()
    //                     ),
    //                   ],
    //                 ),
    //                 const Spacer(), // Add flexible space to push the arrow button to the right
    //                 IconButton(
    //                   icon:  Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.bgBlack,),
    //                   onPressed: () {
    //                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfilePage()));
    //
    //                   },
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // }
    Widget profileCard() {
      return
        Consumer<ProviderVendor>(builder: (context, value, child) {
          if(identical(value.isUserData, "NOT_STARTED") || identical(value.isUserData, "LOADING")) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }else {
            return  Container(
              child: Card(
                elevation: 4, // Adjust the elevation as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24), // Sets the border radius
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Profile", style: fontStyleHeading(AppColors.bgBlack),),
                      const SizedBox(height: 24,),
                      Row(
                        children: [
                          // const CircleAvatar(
                          //   radius: 30, // Adjust the radius as needed
                          //   backgroundImage: AssetImage('assets/images/frame.png'), // Provide your image asset
                          // ),
                          const SizedBox(width: 20), // Add spacing between the avatar and text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  value.userDetails.user.fullname, // Replace with the user's name
                                  style: fontStyleSentences()
                              ),
                              const SizedBox(height: 8,),
                              Text(
                                  value.userDetails.user.email, // Replace with the user's number
                                  style: fontStyleSentences()
                              ),
                            ],
                          ),
                          const Spacer(), // Add flexible space to push the arrow button to the right
                          IconButton(
                            icon:  Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.bgBlack,),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfilePage()));

                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        });


    }

    ////////Account detaiuls///////////////////////
    Widget accountSection() {
      return Card(
        elevation: 4, // Adjust the elevation as needed
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24), // Sets the border radius
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: account.length,
          itemBuilder: (context, index) {
            final item = account[index];
            return InkWell(
              onTap: (){
                print(index);
                switch (index) {
                  case 0 : Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StoreinfoPage()));
                  break;
                  case 1 : Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login_Security_Page()));
                  break;
                  case 2 : Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Terms_and_Services_Page()));
                  break;
                  case 3 : Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Privacy_Police_Page()));
                   break;
                   case 4 : Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ServicePlansPage()));
                  break;
                   case 5 : Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FeedbackPage()));
                   break;
                   case 6 : Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HelpDeskHomePage()));
                  //  break;
                  // case 7 : Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ServicePlansPage()));
                }
              },
              child: Container(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.title, style: fontStyle400(),),
                        Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.bgBlack,),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }

    ////////////////////////LogOut//////////////
    Widget logOut() {
      return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Sets the border radius
        ),
        child: InkWell(
          onTap: () {
            showDialog(context: context, builder: (BuildContext context) {
              return LogOutPage();
            });
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Log out", style: fontStyle60016(AppColors.bgBlack),),
                const Icon(Icons.logout)
              ],
            ),
          ),
        ),
      );
    }

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Account Settings", style: fontStyleHeading(AppColors.bgBlack),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 20),
            child: Material(
              elevation: 3,
              shape: const CircleBorder(), // This creates a circular shape
              clipBehavior: Clip.antiAlias, // This ensures smooth anti-aliased edges
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // This also sets the shape to circular
                  color: AppColors.bgWhite,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: AppColors.bgBlack,
                  ),
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                ),
              ),
            ),
          )

        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                profileCard(),
                const SizedBox(height: 20,),
                accountSection(),
                const SizedBox(height: 20,),
                logOut()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
