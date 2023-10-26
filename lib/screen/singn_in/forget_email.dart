import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../common/Colors.dart';
import 'package:http/http.dart' as http;

import '../../common/widgets.dart';
import 'forget_otp.dart';




class ForgetMailPage extends StatefulWidget {
  const ForgetMailPage({super.key});

  @override
  State<ForgetMailPage> createState() => _ForgetMailPageState();
}

class _ForgetMailPageState extends State<ForgetMailPage> {

  bool validatePhoneNumber(String phone) {
    final phoneRegExp = RegExp(r'^\+?[0-9]+$');
    return phoneRegExp.hasMatch(phone);
  }


  Future<String> getOtp() async {

    var client = http.Client();
    final baseUrl = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/sign-in-with-otp');
    final queryParams = {
      'type': "VENDOR",
    };
    if (emailController.text.contains('@')) {
      emailController.text = emailController.text;
      // Email is provided, use it as is
    } else if (emailController.text.length == 10 && validatePhoneNumber(emailController.text)) {
      // 10-digit string starting with '9' is considered a phone number, add +91
      emailController.text = '91' + emailController.text;
    } else {
      // Handle other cases, or you can set a default value if needed
    }

    final Map<String, dynamic> requestBody = {
      "username": emailController.text,

    };
    final jsonBody = jsonEncode(requestBody);
    final apiUrl = baseUrl.replace(queryParameters: queryParams);
    var response = await client.post(apiUrl, headers: <String, String> {
      'Content-Type': 'application/json',
    } , body:jsonBody,
    );
    print(
        "checkdata : ${response.statusCode} :  ${response.request} : ${response.body} ");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);

      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ForgetOtpPage(mail:emailController.text)));
      return response.body;

    } else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);
      return "";
    }
    return "";
  }



  bool isButtonEnabled = false;

  void updateButtonState() {
    setState(() {
      isButtonEnabled = emailController.text.isNotEmpty;
    });
  }

  Color getButtonColor() {
    if (isButtonEnabled) {
      return AppColors.headerGradient2; // Enabled color
    } else if (emailController.text.isEmpty ) {
      return AppColors.headerGradient2WithOpacity; // Color when either field is empty
    } else {
      return Colors.red; // Color when both fields are non-empty but not enabled
    }
  }


  bool isChecked = false;

  TextEditingController emailController = TextEditingController();


  @override
  void initState() {
    super.initState();
    emailController.addListener(updateButtonState);

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/images/Group 44.png"),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Reset Password",
                    style: fontStyle40022(AppColors.bgBlack),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ////////////////////NameField//////////////////
                  Column(
                    children: [
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
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.cvBackground8),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: emailController,
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


                    ],
                  ),
//////////////////////PassWord visible field///////////////////////////////

                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //backgroundColor: isButtonEnabled ?  AppColors.headerGradient2 : AppColors.headerGradient2WithOpacity,
                      backgroundColor: getButtonColor(),
                      padding: const EdgeInsets.only(left: 40, right: 40, top: 12, bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
                      ),
                    ),
                    onPressed: isButtonEnabled
                        ? () {
                      // Perform action when button is enabled
                      getOtp();
                      print("Email: ${emailController.text}");

                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Otp_Page()));
                    }
                        : null,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Reset Password", style: fontStyleHeading(AppColors.bgWhite)),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
