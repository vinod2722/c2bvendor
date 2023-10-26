import 'dart:convert';

import 'package:c2b_vendor/screen/singn_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../common/Colors.dart';
import '../../common/widgets.dart';



class ResetPasswordPage extends StatefulWidget {
  final String mail;
  final String otp;
  const ResetPasswordPage({super.key, required this.mail, required this.otp});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

  TextEditingController newPasswordContoller = TextEditingController();
  TextEditingController confirmNewPasswordContoller = TextEditingController();

  Future<String> resetPassword() async {

    var client = http.Client();
    final baseUrl = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/forgot-password-with-otp');
    final queryParams = {
      'type': "VENDOR",
    };

    final Map<String, dynamic> requestBody =
    {
      "username": widget.mail,
      "otp": widget.otp,
      "password": newPasswordContoller.text,
      "c_password": confirmNewPasswordContoller.text
    };
    final jsonBody = jsonEncode(requestBody);
    final apiUrl = baseUrl.replace(queryParameters: queryParams);
    var response = await client.post(apiUrl, headers: <String, String> {
      'Content-Type': 'application/json',
    } , body:jsonBody,
    );
    print(
        "checkdata : ${response.statusCode} :  ${response.request} : ${response.body} ");
    // if (json.decode(response.body)['code'] == 200 ) {
    if (response.statusCode == 200 ) {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);

      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const Sign_In_Page()));
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
      isButtonEnabled = newPasswordContoller.text.isNotEmpty && confirmNewPasswordContoller.text.isNotEmpty;
    });
  }

  Color getButtonColor() {
    if (isButtonEnabled) {
      return AppColors.headerGradient2; // Enabled color
    } else if (newPasswordContoller.text.isEmpty || confirmNewPasswordContoller.text.isEmpty) {
      return AppColors.headerGradient2WithOpacity; // Color when either field is empty
    } else {
      return Colors.red; // Color when both fields are non-empty but not enabled
    }
  }


  bool isChecked = false;



  @override
  void initState() {
    super.initState();
    newPasswordContoller.addListener(updateButtonState);
    confirmNewPasswordContoller.addListener(updateButtonState);

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
                      ///////////New Password//////////////
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text("New Password",
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
                          controller: newPasswordContoller,
                          decoration: InputDecoration(
                            hintText: "New Password",
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
                      ///////////confirm new password//////////////
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text("Confirm New Password",
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
                          controller: confirmNewPasswordContoller,
                          decoration: InputDecoration(
                            hintText: "Confirm New Password",
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
                      resetPassword();


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
