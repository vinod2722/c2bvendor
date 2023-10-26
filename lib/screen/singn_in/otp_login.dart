import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';


import 'package:http/http.dart' as http;

import '../../common/Colors.dart';
import '../../common/widgets.dart';
import '../home/home_ui.dart';


class OtpLoginPage extends StatefulWidget {
  final String mail;
  const OtpLoginPage({super.key, required this.mail});

  @override
  State<OtpLoginPage> createState() => _OtpLoginPageState();
}

class _OtpLoginPageState extends State<OtpLoginPage> {



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
  TextEditingController otpController = TextEditingController();


  Future<String> getOtp() async {

    var client = http.Client();
    final baseUrl = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/sign-in-with-otp');
    final queryParams = {
      'type': "VENDOR",
    };

    final Map<String, dynamic> requestBody = {
      "email": widget.mail,

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
      return response.body;

    } else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);
      return "";
    }
    return "";
  }
  Future<String> veriftOtp() async {
    await _getCurrentPosition();

    print('Latitude: ${latController.text}');
    print('Longitude: ${lngController.text}');
    print('City: ${cityController.text}');
    print('Area: ${areaController.text}');

    var client = http.Client();
    final baseUrl = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/verify-otp-for-signin');
    final queryParams = {
      'type': "VENDOR",
    };

    final Map<String, dynamic> requestBody = {
      "username": widget.mail,
      "otp": otpController.text,
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
      final token = jsonResponse['token'];
      await storeToken(token);
      await storeAddToken(double.parse(latController.text), double.parse(lngController.text), cityController.text, areaController.text);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  HomePage()));
      return response.body;

    } else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);
      return "";
    }
    return "";
  }

  Future<void> storeToken(String token) async {
    final localStorage = LocalStorage('user_token'); // Replace with your desired storage key
    await localStorage.ready;
    localStorage.setItem('token', token);
  }

  Future<void> storeAddToken(double lat, double lng, String city, String area) async {
    final localStorage = LocalStorage('user_address'); // Replace with your desired storage key
    await localStorage.ready;
    localStorage.setItem('lat', lat);
    localStorage.setItem('lng', lng);
    localStorage.setItem('city', city);
    localStorage.setItem('area', area);
  }

  int _remainingSeconds = 120; // Initial timer value in seconds
  Timer? _timer;

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      if (_remainingSeconds == 0) {
        // Timer has expired
        timer.cancel();
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }
  void _resetTimer() {
    setState(() {
      _remainingSeconds = 120; // Reset the timer to its initial value
    });
    // Start the timer again
    _startTimer();
  }
  @override
  void initState() {
    super.initState();

    // Start the timer when the widget is initialized
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();

    // Cancel the timer when the widget is disposed to avoid memory leaks
    _timer?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    if (_timer == null) {
      _startTimer();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.asset("assets/images/Group 44.png"),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "OTP",
                  style: fontStyle40022(AppColors.bgBlack),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: Text("Enter code", style: fontStyleSentences(),)),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: PinCodeTextField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    pinBoxHeight: MediaQuery.of(context).size.height / 16,
                    pinBoxWidth: MediaQuery.of(context).size.width / 8,
                    pinBoxRadius: 8,
                    pinBoxOuterPadding: EdgeInsets.only(left: 30, right: 20),
                    defaultBorderColor: AppColors.greyBorder,
                    pinBoxBorderWidth: 1,
                    errorBorderColor: Colors.red,
                    onTextChanged: (value) {
                      // Handle OTP input changes here
                      print(value);
                    },
                  ),
                ),
                SizedBox(height: 40),

                if (_remainingSeconds > 0)
                  Text(
                    "Resend OTP in: $_remainingSeconds seconds",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.facebook,
                    ),
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Didn't received?", style: fontStyleSentences()),
                      InkWell(
                        onTap: (){
                          getOtp();
                          _resetTimer();
                        },
                        child: Text(
                          "send again",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.facebook,
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Image.asset("assets/images/otp.png"),
                    SizedBox(height: 40),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            //backgroundColor: isButtonEnabled ?  AppColors.headerGradient2 : AppColors.headerGradient2WithOpacity,
                            backgroundColor: AppColors.borderColor,
                            padding: const EdgeInsets.only(left: 40, right: 40, top: 12, bottom: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
                            ),
                          ),
                          onPressed: () {
                            // Handle OTP verification here
                            String otp = otpController.text;
                            print(otpController.text);
                            veriftOtp();
                            // if (otp.length == 4) {
                            //   // Perform OTP verification
                            //   print(otpController.text);
                            // } else {
                            //   // Display an error message or prompt
                            // }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Verify OTP', style: fontStyleHeading(AppColors.bgWhite),),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
