import 'dart:convert';

import 'package:c2b_vendor/screen/singn_in/sign_in_otp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:localstorage/localstorage.dart';

import '../../common/Colors.dart';
import '../../common/widgets.dart';
import '../home/home_ui.dart';
import '../home/product.dart';
import '../sign_up/sign_up_screen.dart';
import '../sign_up/terms_conditions.dart';
import 'forget_email.dart';
import 'forget_password.dart';
import 'package:http/http.dart' as http;


class Sign_In_Page extends StatefulWidget {
  const Sign_In_Page({super.key});

  @override
  State<Sign_In_Page> createState() => _Sign_In_PageState();
}

class _Sign_In_PageState extends State<Sign_In_Page> {


  String? _currentAddress;
  Position? _currentPosition;

  bool _passwordVisible = false;


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

      } else {
        print('No placemarks found');
      }
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<String> login() async {

    await _getCurrentPosition();

    print('Latitude: ${latController.text}');
    print('Longitude: ${lngController.text}');
    print('City: ${cityController.text}');
    print('Area: ${areaController.text}');

    var client = http.Client();
    final baseUrl = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/login-user');
    final queryParams = {
      'type': "VENDOR",
    };

    if(emailController.text.length == 10) {
      emailController.text = "91" + emailController.text;
    }

    final Map<String, dynamic> requestBody = {
      "username": emailController.text,
      "password": passwordController.text
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
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ProductAddPage()));

      return response.body;

    } else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);
      return "";
    }
    return "";
  }


  // Function to store the token in local storage
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

  bool isButtonEnabled = false;

  void updateButtonState() {
    setState(() {
      isButtonEnabled = emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  Color getButtonColor() {
    if (isButtonEnabled) {
      return AppColors.headerGradient2; // Enabled color
    } else if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return AppColors.headerGradient2WithOpacity; // Color when either field is empty
    } else {
      return Colors.red; // Color when both fields are non-empty but not enabled
    }
  }


  bool isChecked = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController consfirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(updateButtonState);
    passwordController.addListener(updateButtonState);
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                        const SizedBox(
                          height: 24,
                        ),
                        //textFieldPasswordWithHintAndIcon("Password", "Enter your password", passwordController,Icon(Icons.remove_red_eye), _passwordVisible),
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
                                    child:_passwordVisible ?  Icon(Icons.visibility, color: AppColors.headerGradient2,) : Icon(Icons.visibility_off),
                                  ),
                                  hintText: "Enter your password",
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

                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignInWithOtp()));
                          },
                          child: Container(
                              alignment: Alignment.topLeft,
                              child:  Text("Sign in with OTP", style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.facebook
                              ))),
                        )
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
                    const SizedBox(
                      height: 20,
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
                        if(isChecked) {
                          login();
                        }else {
                          Fluttertoast.showToast(msg: "Please accept terms and conditions");
                        }
                        print("Email: ${emailController.text}");
                        print("Password: ${passwordController.text}");
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Otp_Page()));
                      }
                          : null,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Continue", style: fontStyleHeading(AppColors.bgWhite)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ForgetMailPage()));
                        },
                        child: Text("Forgot password", style: fontStyle50012(AppColors.facebook),)),
                    const SizedBox(
                      height: 20,
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
                      height: 20,
                    ),
                    elevatedButtonWithBorderandImage(context, AppColors.bgBlack,
                            () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                        }, "assets/images/google.png", "Sign in with Google"),
                    const SizedBox(
                      height: 20,
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a user? ",
                          style: fontStyleSentences(),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const  SignUpScreen())),
                          child: Text("Register",
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
