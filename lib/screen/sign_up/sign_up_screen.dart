// import 'dart:convert';
//
// import 'package:c2b_vendor/screen/sign_up/terms&conditions.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../../common/Colors.dart';
// import '../../common/widgets.dart';
// import '../home/backup.dart';
// import '../home/home_ui.dart';
// import '../otp_screen.dart';
// import '../profile_screen.dart';
// import '../singn_in/sign_in.dart';
//
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   bool isEntered = false;
//   bool isClosed = true;
//   bool isChecked = false;
//   bool isEmailValid = true;
//   bool isEmailEmpty = true;
//
//
//   bool validateEmail(String email) {
//     // Regular expression to validate email format
//     RegExp emailRegex = RegExp(
//       r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
//       caseSensitive: false,
//     );
//     return emailRegex.hasMatch(email);
//   }
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController consfirmPasswordController = TextEditingController();
//
//
//   Future<void> registerUser() async {
//     // Define the base API endpoint URL
//     final baseUrl = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/register-customer-vendor');
//
//     // Define the query parameters as a Map
//     final queryParams = {
//       'type': "VENDOR",
//     };
//
//     // Merge the base URL and query parameters to create the final URL
//     final apiUrl = baseUrl.replace(queryParameters: queryParams);
//
//     final requestBody = {
//       'fullname': nameController.text,
//       'email': emailController.text,
//       'password': passwordController.text,
//       'confirm_password': consfirmPasswordController.text,
//     };
//
//     // Encode the request body as JSON
//     final jsonBody = jsonEncode(requestBody);
//
//     print(jsonBody);
//
//     // Define the headers for the request
//     final headers = {
//       'Content-Type': 'application/json',
//     };
//     try {
//       final response = await http.post(
//         apiUrl,
//         headers: headers,
//         body: jsonBody,
//       );
//       if (response.statusCode == 200) {
//         // Registration was successful
//         final jsonResponse = json.decode(response.body);
//         final id = jsonResponse['created_user']['id'];
//         print("response------------- ${id}");
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Otp_Page(id: id)));
//
//         print('Response: ${response.body}');
//       } else {
//         print('Registration failed with status code ${response.statusCode}');
//         print('Response: ${response.body}');
//       }
//     } catch (error) {
//       print('Error: $error');
//     }
//   }
//
//
//   @override
//   void dispose() {
//     emailController.dispose();
//     super.dispose();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   Image.asset("assets/images/Group 44.png"),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Text(
//                     "SignUp",
//                     style: fontStyle40022(AppColors.bgBlack),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   ////////////////////NameField//////////////////
//                   Visibility(
//                     visible: isClosed,
//                     child: Column(
//                       children: [
//                         Container(
//                             alignment: Alignment.topLeft,
//                             child: Text("Full Name",
//                                 style:
//                                 fontStyle40012(AppColors.cvBackground8))),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             border: Border.all(color: AppColors.cvBackground8),
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           child: TextFormField(
//                             controller: nameController,
//                             decoration: InputDecoration(
//                               hintText: "Enter your full name here",
//                               border: InputBorder.none,
//                               contentPadding: const EdgeInsets.only(left: 15),
//                               enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                       color: AppColors.cvBackground8),
//                                   // Color of the border
//                                   borderRadius: BorderRadius.circular(10.0)),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 12,
//                         ),
//                         ///////////Email COntainer//////////////
//                         Container(
//                           alignment: Alignment.topLeft,
//                           child: Text("Email",
//                               style: fontStyle40012(AppColors.cvBackground8)),
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             border: Border.all(color: AppColors.cvBackground8),
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           child: TextFormField(
//                             controller: emailController,
//                             onChanged: (value) {
//                               setState(() {
//                                 isEmailValid = validateEmail(value);
//                                 isEmailEmpty = value.isEmpty;
//                               });
//                             },
//                             decoration: InputDecoration(
//                               hintText: "Enter your e-mail here",
//                               //errorText: isEmailValid ? null : 'Invalid email format',
//                               errorText: isEmailValid ? null : 'Invalid email format',
//                               border: InputBorder.none,
//                               contentPadding: const EdgeInsets.only(left: 15),
//                               enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                       color: AppColors.cvBackground8),
//                                   // Color of the border
//                                   borderRadius: BorderRadius.circular(10.0)),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 24,
//                         ),
//                       ],
//                     ),
//                   ),
// //////////////////////PassWord visible field///////////////////////////////
//                   Visibility(
//                     visible: isEntered,
//                     child: Column(
//                       children: [
//                         textFieldWithHint("Password", "Enter your password", passwordController),
//                         textFieldWithHint(
//                             "Confirm password", "Re-enter your password", consfirmPasswordController),
//                         Row(
//                           children: <Widget>[
//                             Checkbox(
//                               value: isChecked,
//                               onChanged: (value) {
//                                 setState(() {
//                                   isChecked = value!;
//                                 });
//                               },
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 InkWell(
//                                   onTap: () {
//                                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => TermsAndConditions()));
//                                   },
//                                   child: Text(
//                                       " I agree to the Terms and Conditions &",
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w400,
//                                           letterSpacing: -0.4,
//                                           color: AppColors.facebook,
//                                         decoration: TextDecoration.underline
//                                       )),
//                                 ),
//
//                                 Text(
//                                     " Privacy Policy",
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w400,
//                                         letterSpacing: -0.4,
//                                         color: AppColors.facebook,
//                                         decoration: TextDecoration.underline
//                                     )),
//                               ],
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   ////////////////Continue Button////////////////////
//                   elevatedButton(() {
//                     setState(() {
//                       isEntered = true;
//                       isClosed = false;
//                     });
//                     if (!isChecked) {
//                       // Show an error message if the checkbox is not checked
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('Please accept the terms and conditions.'),
//                         ),
//                       );
//                       return; // Do not proceed further
//                     }
//
//                     registerUser();
//                     //Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyProfilePage()));
//                     //Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
//                     //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const bankDropdown()));
//
//                     if (nameController != null) {
//                       if (emailController != null) {
//
//                         print(nameController.text);
//                         print(emailController.text);
//                         print(passwordController.text);
//                         print(consfirmPasswordController.text);
//                         setState(() {
//                           isEntered = true;
//                           isClosed = false;
//                         });
//                       } else {
//                         print("Enter email");
//                       }
//                     }
//                   }, "Continue"),
//                   const SizedBox(
//                     height: 32,
//                   ),
//                   Row(
//                     children: [
//                       const Expanded(
//                         child: Divider(
//                           thickness: 2,
//                           height: 20,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10, right: 10),
//                         child: Text(
//                           "Or",
//                           style: fontStyleSentences(),
//                         ),
//                       ),
//                       const Expanded(
//                         child: Divider(
//                           thickness: 2,
//                           height: 20,
//                         ),
//                       ),
//                     ],
//                   ),
//                   /////////////////////Sign With Google///////////////////
//                   const SizedBox(
//                     height: 32,
//                   ),
//                   elevatedButtonWithBorderandImage(context, AppColors.bgBlack,
//                           () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => const SignUpScreen()));
//                       }, "assets/images/google.png", "Sign in with Google"),
//                   const SizedBox(
//                     height: 14,
//                   ),
//                   elevatedButtonWithOutBorderandImage(
//                       AppColors.facebook, AppColors.bgWhite, context, () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => const SignUpScreen()));
//                   }, "assets/images/facebook.png", "Sign in with Facebook"),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   elevatedButtonWithOutBorderandImage(
//                       AppColors.bgBlack, AppColors.bgWhite, context, () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => const SignUpScreen()));
//                   }, "assets/images/apple.png", "Sign in with Apple"),
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Already have an account?",
//                         style: fontStyleSentences(),
//                       ),
//                       InkWell(
//                         onTap: () =>  Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => const Sign_In_Page())),
//                         child: Text("SignIn",
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColors.facebook,
//                                 decoration: TextDecoration.underline)),
//                       )
//                     ],
//                   )
//                 ],
//               )),
//         ),
//       ),
//     );
//   }
// }
//
//

import 'dart:convert';

import 'package:c2b_vendor/screen/sign_up/terms_conditions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../common/Colors.dart';
import '../../common/widgets.dart';
import '../otp_screen.dart';
import '../singn_in/sign_in.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _passwordVisible = false;
  bool _passwordVisible1 = false;

  bool isEntered = false;
  bool isClosed = true;
  bool isChecked = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController consfirmPasswordController = TextEditingController();

  String? emailErrorText;
  bool validatePhoneNumber(String phone) {
    final phoneRegExp = RegExp(r'^\+?[0-9]+$');
    return phoneRegExp.hasMatch(phone);
  }
  void validateEmailOrPhoneNumber(String input) {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    final phoneRegExp = RegExp(r'^\+?[0-9]+$');

    if (emailRegExp.hasMatch(input) || (input.length == 10 && phoneRegExp.hasMatch(input))) {
      setState(() {
        emailErrorText = null; // Reset error message
      });
    } else {
      setState(() {
        emailErrorText = 'Invalid email or phone number';
      });
    }
  }
  Future<void> registerUser() async {
    if (passwordController.text != consfirmPasswordController.text) {
      Fluttertoast.showToast(msg: "Password and Confirm Password do not match");
      return;
    }

    if (emailController.text.contains('@')) {
      emailController.text = emailController.text;
      // Email is provided, use it as is
    } else if (emailController.text.length == 10 && validatePhoneNumber(emailController.text)) {
      // 10-digit string starting with '9' is considered a phone number, add +91
      emailController.text = '91' + emailController.text;
    } else {
      // Handle other cases, or you can set a default value if needed
    }
    // Define the base API endpoint URL
    final baseUrl = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/register-customer-vendor');

    // Define the query parameters as a Map
    final queryParams = {
      'type': "VENDOR",
    };

    // Merge the base URL and query parameters to create the final URL
    final apiUrl = baseUrl.replace(queryParameters: queryParams);

    final requestBody = {
      'fullname': nameController.text,
      //'username': emailController.text.characters.contains("@") ? emailController.text : emailController.text.characters.length == 10,
      'username': emailController.text,
      'password': passwordController.text,
      'confirm_password': consfirmPasswordController.text,
    };


    // Encode the request body as JSON
    final jsonBody = jsonEncode(requestBody);

    print(jsonBody);

    // Define the headers for the request
    final headers = {
      'Content-Type': 'application/json',
    };
    try {
      final response = await http.post(
        apiUrl,
        headers: headers,
        body: jsonBody,
      );
      if (json.decode(response.body)['code'] == 200 ) {
        // Registration was successful
        print("response---${response.body}");
        final jsonResponse = json.decode(response.body);
        final errorMessage = jsonResponse['message'];
        final id = jsonResponse['created_user']['id'];
        print("response------------- ${id}");
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Otp_Page(id: id,email: emailController.text)));
        Fluttertoast.showToast(msg: errorMessage);

        print('Response: ${response.body}');
      } else {
        final jsonResponse = json.decode(response.body);
        final errorMessage = jsonResponse['message'];
        Fluttertoast.showToast(msg: errorMessage);
        print('Registration failed with status code ${response.statusCode} : ${response.body}');
        print('Response: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          // leading: Visibility(
          //   visible: isEntered,
          //   child: IconButton(
          //     onPressed: () {
          //       setState(() {
          //         isClosed = true;
          //         isEntered = false;
          //       });
          //     },
          //     icon: Icon(Icons.arrow_back, color: AppColors.bgBlack,),
          //   ),
          // ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Image.asset("assets/images/Group 44.png"),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "SignUp",
                      style: fontStyle40022(AppColors.bgBlack),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ////////////////////NameField//////////////////
                    Visibility(
                      visible: isClosed,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              child: Text("Full Name",
                                  style:
                                  fontStyle40012(AppColors.cvBackground8))),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.cvBackground8),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                hintText: "Full Name",
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(left: 15),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.cvBackground8),
                                    // Color of the border
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ///////////Email COntainer//////////////
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text("Email/Number",
                                style: fontStyle40012(AppColors.cvBackground8)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.cvBackground8),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: TextFormField(
                                  controller: emailController,
                                  onChanged: (value){
                                    validateEmailOrPhoneNumber(value);
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Email/Number",
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.only(left: 15),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.cvBackground8),
                                        // Color of the border
                                        borderRadius: BorderRadius.circular(10.0)),
                                  ),
                                ),
                              ),
                              if (emailErrorText != null)
                                Text(
                                  emailErrorText!,
                                  style: TextStyle(color: Colors.red),
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
//////////////////////PassWord visible field///////////////////////////////
                    Column(
                      children: [
                        // textFieldWithHint("Password", "Enter your password", passwordController),
                        // textFieldWithHint(
                        //     "Confirm password", "Re-enter your password", consfirmPasswordController),
                        Column(
                          children: [
                            Container(
                                alignment: Alignment.topLeft,
                                child:  Text("Password", style: fontStyle40012(AppColors.cvBackground8))),
                            const SizedBox(height: 8,),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.cvBackground8),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: !_passwordVisible,
                                decoration:  InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                    child:_passwordVisible ?  Icon(Icons.visibility, color: AppColors.headerGradient2,) : const Icon(Icons.visibility_off),
                                  ),
                                  hintText: "password",
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(left: 15, top: 15),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color:AppColors.cvBackground8), // Color of the border
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12,),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                alignment: Alignment.topLeft,
                                child:  Text("Confirm password", style: fontStyle40012(AppColors.cvBackground8))),
                            const SizedBox(height: 8,),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.cvBackground8),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: consfirmPasswordController,
                                obscureText: !_passwordVisible1,
                                decoration:  InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        _passwordVisible1 = !_passwordVisible1;
                                      });
                                    },
                                    child:_passwordVisible1 ?  Icon(Icons.visibility, color: AppColors.headerGradient2,) : const Icon(Icons.visibility_off),
                                  ),
                                  hintText: "Confirm password",
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(left: 15, top: 15),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color:AppColors.cvBackground8), // Color of the border
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12,),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            // Expanded(
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       InkWell(
                            //         onTap: () {
                            //           showDialog(
                            //               context: context, builder: (BuildContext context) {
                            //             return TermsAndCondition();
                            //           });
                            //         },
                            //         child: Text(
                            //             "I agree to the Terms and Conditions &",
                            //             style: TextStyle(
                            //                 fontSize: 16,
                            //                 fontWeight: FontWeight.w400,
                            //                 letterSpacing: -0.4,
                            //                 color: AppColors.facebook,
                            //                 decoration: TextDecoration.underline
                            //             )),
                            //       ),
                            //       Text("Privacy Policy", style: TextStyle(
                            //           fontSize: 16,
                            //           fontWeight: FontWeight.w400,
                            //           letterSpacing: -0.4,
                            //           color: AppColors.facebook,
                            //           decoration: TextDecoration.underline
                            //       )),
                            //     ],
                            //   ),
                            // )
                            RichText(
                              text:  TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'I agree to the. ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'Terms and Conditions.',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = (){
                                        showDialog(
                                                          context: context, builder: (BuildContext context) {
                                                        return TermsAndCondition();
                                                      });
                                      }
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ////////////////Continue Button////////////////////
                    elevatedButton(() {
                      if (nameController.text.isNotEmpty && emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty && consfirmPasswordController.text.isNotEmpty &&
                          isChecked) {
                        // All conditions are met, proceed with registration
                        registerUser();
                      } else {
                        if (nameController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter name");
                        } else if (emailController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter your email/Numberbun.com");
                        } else if (passwordController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter password");
                        } else if (consfirmPasswordController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter confirm password");
                        } else if (!isChecked) {
                          Fluttertoast.showToast(msg: "Please accept terms and conditions");
                        }
                      }
                    }, "Register"),

                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            thickness: 2,
                            height: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "Or",
                            style: fontStyleSentences(),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            thickness: 2,
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                    /////////////////////Sign With Google///////////////////
                    const SizedBox(
                      height: 32,
                    ),
                    elevatedButtonWithBorderandImage(context, AppColors.bgBlack,
                            () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>  const SignUpScreen()));
                        }, "assets/images/google.png", "Sign in with Google"),
                    const SizedBox(
                      height: 40,
                    ),
                    // elevatedButtonWithOutBorderandImage(
                    //     AppColors.facebook, AppColors.bgWhite, context, () {
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //       builder: (context) => const SignUpScreen()));
                    // }, "assets/images/facebook.png", "Sign in with Facebook"),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // elevatedButtonWithOutBorderandImage(
                    //     AppColors.bgBlack, AppColors.bgWhite, context, () {
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //       builder: (context) => const SignUpScreen()));
                    // }, "assets/images/apple.png", "Sign in with Apple"),
                    // const SizedBox(
                    //   height: 40,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: fontStyleSentences(),
                        ),
                        InkWell(
                          onTap: () =>  Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Sign_In_Page())),
                          child: Text("SignIn",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.facebook,
                                  decoration: TextDecoration.underline)),
                        )
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

