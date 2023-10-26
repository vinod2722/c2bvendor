import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:localstorage/localstorage.dart';

import '../../common/Colors.dart';
import '../../common/widgets.dart';
import 'forget_password.dart';
import 'package:http/http.dart' as http;

import 'otp_login.dart';


class SignInWithOtp extends StatefulWidget {
  const SignInWithOtp({super.key});

  @override
  State<SignInWithOtp> createState() => _SignInWithOtpState();
}

class _SignInWithOtpState extends State<SignInWithOtp> {


  String? _currentAddress;
  Position? _currentPosition;

  final TextEditingController latController = TextEditingController();
  final TextEditingController lngController = TextEditingController();

  final TextEditingController cityController = TextEditingController();
  final TextEditingController areaController = TextEditingController();

  void onGetCurrentLocation() {
    _getCurrentPosition();
  }


  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }
  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      // setState(() => _currentPosition = position);
      setState(() {
        _currentPosition = position;
        latController.text = position.latitude.toString();
        lngController.text = position.longitude.toString();
      });
      _getAddressFromLatLng(_currentPosition!);

      //print(latController.text);
    }).catchError((e) {
      debugPrint(e);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              ' Location permissions are permanently denied, we cannot request permissions.')));
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
      _currentPosition!.latitude,
      _currentPosition!.longitude,

    ).then((List<Placemark> placemarks) {
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];

        cityController.text = place.locality ?? '';
        areaController.text = place.subLocality ?? '';




        // print('Country: $country');
        // print('State: $state');
        // print('City: $city');
        // print('Area: $area');
        // print('Street: $street');
        // print('Postal Code: $postalCode');
        // print('Landmark: $landmark');

        // Now you can use these variables as needed
      } else {
        print('No placemarks found');
      }
    }).catchError((e) {
      debugPrint(e);
    });
  }

  bool validatePhoneNumber(String phone) {
    final phoneRegExp = RegExp(r'^\+?[0-9]+$');
    return phoneRegExp.hasMatch(phone);
  }
  Future<String> getOtp() async {

    await _getCurrentPosition();

    print('Latitude: ${latController.text}');
    print('Longitude: ${lngController.text}');
    print('City: ${cityController.text}');
    print('Area: ${areaController.text}');

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
    if (json.decode(response.body)['code'] == 200 ) {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  OtpLoginPage(mail:emailController.text)));
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
                    "SignIn",
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
                        Text("Get OTP", style: fontStyleHeading(AppColors.bgWhite)),
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
