// import 'package:c2b_vendor/screen/singn_in/reset_password.dart';
// import 'package:flutter/material.dart';
//
// import '../../common/Colors.dart';
// import '../../common/widgets.dart';
//
// class Forget_Passwoed_Page extends StatefulWidget {
//   const Forget_Passwoed_Page({super.key});
//
//   @override
//   State<Forget_Passwoed_Page> createState() => _Forget_Passwoed_PageState();
// }
//
// class _Forget_Passwoed_PageState extends State<Forget_Passwoed_Page> {
//   TextEditingController email_controller = TextEditingController();
//   bool isResetEmailSubmitted = false;
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.all(16),
//           alignment: Alignment.center,
//           child: Column(
//             children: [
//               Image.asset("assets/images/Group 44.png"),
//               const SizedBox(height: 40,),
//               Text("Forget your password", style: fontStyleSentences(),),
//               const SizedBox(height: 40,),
//               isResetEmailSubmitted
//                   ? Text(
//                 "If there is an account associated with this email address, you will receive a link to reset your password",
//                 style: fontStyleSentences(),
//                 textAlign: TextAlign.center,
//               )
//                   : Text(
//                 "Enter your registered email to reset the password",
//                 style: fontStyleSentences(),
//               ),
//               const SizedBox(height: 40,),
//               textFieldWithHint("Email","Enter your email", email_controller),
//               const SizedBox(height: 40,),
//               isResetEmailSubmitted ?   Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Didn't receive the email?", style: fontStyleSentences(),),
//                   Text(
//                     "Click to resend",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.facebook,
//                     ),
//                   ),
//                 ],
//               ) : Container(),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end, // Aligns the button to the bottom
//                   children: [
//                     elevatedButton(
//                           () {
//                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PasswordResetPage()));
//                         setState(() {
//                           // Set the flag to true when the "Reset Password" button is clicked
//                           isResetEmailSubmitted = true;
//                         });
//                         // Handle the "Reset Password" button click here
//                       },
//                       isResetEmailSubmitted ? "Go back to Sign in" : "Reset Password",
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
