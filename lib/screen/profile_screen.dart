
import 'dart:convert';
import 'dart:io';

import 'package:c2b_vendor/common/Colors.dart';
import 'package:c2b_vendor/common/widgets.dart';
import 'package:c2b_vendor/providers/providers.dart';
import 'package:c2b_vendor/screen/home/home_ui.dart';
import 'package:c2b_vendor/screen/singn_in/sign_in.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:stepper_flutter_form/stepper_flutter_form.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


import '../model/bank_model.dart';
import 'home/bankListPage.dart';



class Driver {
  String name = '';
  String lastName = '';
}

class MyProfilePage extends StatefulWidget {
  final int id;

  MyProfilePage({
    super.key, required this.id,
  });


  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {


  // final LocalStorage userToken = LocalStorage('user_token');
  // late String token = '';
////////////////////SubmitApi call for vendor deatils personal registration////////////////////
  Future<String> veriftPersonalDetails() async {
    var client = http.Client();
    final baseUrl = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/vendor-personal-details');


    final Map<String, dynamic> requestBody =
    {
      "vendor_id":widget.id,
      "first_name": firstController.text,
      //"last_name": lastNameController.text,
      "dob": dobController.text,
      "gender": gender,
      "language": languageController.text,
      "personal_email": emailController.text,
      "personal_mobile": mobileController.text,
      "personal_alt_mobile": altMobileController.text,
      "add1": areaController.text,
      "add2": landmarkController.text,
      "area": areaController.text,
      "city": cityController.text,
      "state": stateController.text,
      "pincode": postalCodeController.text,
      "landmark": landmarkController.text,
    };

    if (lastNameController.text.isNotEmpty) {
      requestBody['last_name'] = lastNameController.text;

      }

    final jsonBody = jsonEncode(requestBody);

    var response = await client.post(baseUrl, headers: <String, String> {
      'Content-Type': 'application/json',
    } , body:jsonBody,
    );

    print(jsonBody);
    print(
        "checkdata : ${response.statusCode} :  ${response.request} : ${response.body} ");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MyProfilePage(id : widget.id)));
      _uploadImage(
        _imageFile1,
        _fileName1,
        widget.id
      );
      goToNextStep();
      return response.body;

    } else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);
      return "";
    }
    return "";
  }

  /////////////////////////Submit api call for the store details registration/////////////


  // Future<String> getDummyImagePath() async {
  //   final dummyImageFileName = 'images/shop11.jpg'; // Remove "assets/"
  //
  //   final dummyImageDir = await getTemporaryDirectory();
  //   final dummyImagePath = '${dummyImageDir.path}/$dummyImageFileName';
  //
  //   final ByteData dummyImageByteData = await rootBundle.load(dummyImageFileName); // Remove "assets/"
  //   final Uint8List dummyImageBytes = dummyImageByteData.buffer.asUint8List();
  //
  //   final dummyImageFile = File(dummyImagePath);
  //   await dummyImageFile.writeAsBytes(dummyImageBytes);
  //
  //   return dummyImagePath;
  // }

  String mall_name = '';
  int mall_id = 0;
////////Send mall details if user select food court/////
  Future<String> sendMallDetails(int str_id) async {
    var client = http.Client();
    final url = Uri.parse("https://close2buy-dev.jurysoftprojects.com/api/add-store-as-food-court");
    final Map<String, dynamic> requestBody =
    {
      "store_id": str_id,
      "mall_id": mall_id,
      "mall_name": mall_name
    };
    final jsonBody = jsonEncode(requestBody);

    var response = await client.post(url, headers: <String, String> {
      'Content-Type': 'application/json',
    } , body:jsonBody,
    );

    print(jsonBody);
    print(
        "checkdata : ${response.statusCode} :  ${response.request} : ${response.body} ");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MyProfilePage(id : widget.id)));
      goToNextStep();
      return response.body;

    } else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);
      return "";
    }

  }
  /////////With out mall details
  Future<String> veriftStoreDetails() async {
    var client = http.Client();
    final baseUrl = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/vendor-store-details');

    final typesOfProd = jsonEncode(selectedProducts);
    final typesOfServ = jsonEncode(selectedServices);

    List<Map<String, String>> driverList = drivers.map((driver) {
      return {
        "first_name": driver.name,
        "last_name": driver.lastName,
      };
    }).toList();
    final driversJson = jsonEncode(driverList);

    List<Map<String, dynamic>> combinedDataList = [];
    for (int i = 0; i < times.length; i++) {
      combinedDataList.add({
        "distance": distances[i],
        "time": times[i],
        "price": prices[i],
      });
    }

    final combinedDataJson = jsonEncode(combinedDataList);

    final Map<String, dynamic> requestBody =
    {
      "vendor_id":widget.id,
      "name": storeNameController.text,
      "gst_number": getNumberController.text,
      "fssai_number": fssaiController.text,
      "mobile": storemobileController.text,
      "alt_mobile": "",
      "email": storeEmailController.text,
      "add1": streetController.text,
      "add2": cityController.text,
      "area": areaController.text,
      "city": cityController.text,
      "state": streetController.text,
      "pincode": postalCodeController.text,
      "landmark": landmarkController.text,
      "type_market_place": category,
      "services": typesOfServ,
      "categories": typesOfProd,
      //"store_image": ,
     "delivery_people": driversJson
    };
    if (driverList.isNotEmpty) {
      requestBody["delivery_people"] = driversJson;
    }

    final jsonBody = jsonEncode(requestBody);

    var response = await client.post(baseUrl, headers: <String, String> {
      'Content-Type': 'application/json',
    } , body:jsonBody,
    );

    //print(jsonBody);
    print(
        "checkdata : ${response.statusCode} :  ${response.request} : ${response.body} ");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  goToNextStep()));
      // goToNextStep();
      int strId = jsonResponse['data']['createdData']['id'];
      if(selectedProducts.contains("Food Court"))
      sendMallDetails(strId);
      else
         goToNextStep();
      return response.body;

    } else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);
      return "";
    }
    return "";
  }


  Future<void> bankDetailsRegistration() async {
    // Define the base API endpoint URL
    final baseUrl = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/vendor-bank-details');



    final requestBody =
    {
      "vendor_id": widget.id,
      "bank_name": bankNameController.text,
      "bank_id": bankId,
      "account_holder_name": accountHolderName.text,
      "account_number": accountNumber.text,
      "city": bankCityName.text,
      "branch": branchName.text,
      "ifsc_code": ifscCodeController.text,
    };

    // Encode the request body as JSON
    final jsonBody = jsonEncode(requestBody);
    //final jsonBody = (requestBody);

    print(requestBody);

    //Define the headers for the request
    final headers = {
      'Content-Type': 'application/json',
    };
    try {
      final response = await http.post(
        baseUrl,
        headers: headers,
        body: jsonBody,
      );
      if (response.statusCode == 200) {
        // Registration was successful
        final jsonResponse = json.decode(response.body);

        //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  HomePage()));
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Sign_In_Page()));

        print('Response: ${response.body}');
      } else {
        print('Registration failed with status code ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
    //return null;
  }

  File? _imageFile1;
  String _fileName1 = "";

  // Function to pick an image from the device's gallery
  Future<void> _pickImage(int imageNumber) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (imageNumber == 1) {
          _imageFile1 = File(pickedFile.path);
          _fileName1 = _imageFile1!.path.split('/').last;

          print(_fileName1);
        // } else if (imageNumber == 2) {
        //   _imageFile2 = File(pickedFile.path);
        //   _fileName2 = _imageFile2!.path.split('/').last;
         }
      });
    }
  }


  Future<void> _uploadImage(File? appImageFile, String? appImageFileName, int id) async {
    if (appImageFile == null ) {
      // Handle case when one or both images are not selected
      return;
    }

    final url = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/vendor-identity-details'); // Replace with your API endpoint
    final request = http.MultipartRequest('POST', url);

    // Add headers
    //request.headers['Authorization'] = '$authToken';

    // Create MultipartFile objects from image files
    final appImage = http.MultipartFile(
      'identity_proof_file',
      appImageFile.readAsBytes().asStream(),
      appImageFile.lengthSync(),
      filename: appImageFileName,
    );

    // final webImage = http.MultipartFile(
    //   'web_image',
    //   webImageFile.readAsBytes().asStream(),
    //   webImageFile.lengthSync(),
    //   filename: webImageFileName,
    // );

    // Add MultipartFile objects to the request
    request.files.add(appImage);
    //request.files.add(webImage);

    // Add other data to the request body
    request.fields['vendor_id'] = id.toString();
    request.fields['identity_proof_name'] = document;

    // Send the request
    final response = await request.send();

    // Convert and print the response body
    final responseBody = await response.stream.bytesToString();
    print('Response Body: $responseBody');

    if (response.statusCode == 200) {
      // Handle a successful response from your API
      print('Images uploaded successfully');
      // _removeImage(1);
      // _removeImage(2);

    } else {
      // Handle errors
      print('Image upload failed with status code: ${response.statusCode}');
    }
  }

  List<String?> selectedFilePaths = [];

  Future<void> _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        selectedFilePaths = result.paths;
      });
    }
  }

  bool isExpand = false;
  bool isCategory = false;
  bool isProduct = false;
  bool isService = false;
  bool isDelivery = false;
  bool isTimings = false;
  bool isGender = false;
  bool isMall = false;
  bool isBankVisible = false;
  List<bool> isStatus = List.generate(7, (index) => false);
  String document = "Select here"; // Initial text
  String gender = "select here"; // Initial text
  String category = "Select here"; // Initial text
  String mall = "Select below"; // Initial text
   int? bankId;



  int currentStep = 0;
  void goToNextStep() {
    if (currentStep < item3.length - 1) {
      setState(() {
        currentStep++;
      });
    }
  }
  List<String> item3 = [];

  List<String> selectedProducts = [];
  List<String> selectedServices = [];
  List<String> selectedBank = [];
  List<String> selectedItems = [];

  List<String> distances = ["1 Km", "2 Km", "3 Km", "4 Km", "5 Km"];
  List<String?> times = List.filled(5, null); // Stores time values for each distance
  List<String?> prices = List.filled(5, null); // Stores price values for each distance


  ////////////////////Adding drivers
  List<Driver> drivers = [Driver()];


  //////////?Store Timimngs/////////////////////
  List<String> daysOfWeek = [
    "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
  ];
  List<String> statusOptions = ["Open", "Closed"];

  List<String> statusList = [];


  //////////Vendor personel details controllers////////////////////
  final TextEditingController firstController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController altMobileController = TextEditingController();
  final TextEditingController floorNum = TextEditingController();
  final TextEditingController buildingNameController = TextEditingController();
  final TextEditingController doorNumController = TextEditingController();

  /////////////VendorStore details//////////////////////////////
   final TextEditingController storeNameController = TextEditingController();
   final TextEditingController getNumberController = TextEditingController();
   final TextEditingController fssaiController = TextEditingController();
   final TextEditingController storemobileController = TextEditingController();
   final TextEditingController storeEmailController = TextEditingController();
   final TextEditingController storeBuildingController = TextEditingController();
   final TextEditingController storeFloorController = TextEditingController();
   final TextEditingController storeDoorController = TextEditingController();


   ///////////////////////Vendor Bank Details Controllers////////////////

  final TextEditingController accountHolderName = TextEditingController();
  final TextEditingController accountNumber = TextEditingController();
  //final TextEditingController bankName = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  final TextEditingController bankCityName = TextEditingController();
  final TextEditingController branchName = TextEditingController();
  final TextEditingController ifscCodeController = TextEditingController();

//////////////////Fetching Location/////////////////

  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController latController = TextEditingController();
  final TextEditingController lngController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();


  String? _currentAddress;
  Position? _currentPosition;

  int? length;

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
        countryController.text = place.country ?? '';
        stateController.text = place.administrativeArea ?? '';
        cityController.text = place.locality ?? '';
        areaController.text = place.subLocality ?? '';
        streetController.text = place.street ?? '';
        postalCodeController.text = place.postalCode ?? '';
        landmarkController.text = place.name ?? '';


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


  bool validateGST(String gst) {
    // Regular expression to validate GST format for India (GSTIN)
    // You can replace this with the regex for your specific country's GST format
    // This example assumes the GST format for India.
    RegExp gstRegex = RegExp(
      r"^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9A-Z]{1}[Z]{1}[0-9A-Z]{1}$",
      caseSensitive: false,
    );
    return gstRegex.hasMatch(gst);
  }


  bool validateFSSAI(String fssai) {
    // Regular expression to validate FSSAI format in India
    RegExp fssaiRegex = RegExp(
      r"^[0-9]{14}$",
      caseSensitive: false,
    );
    return fssaiRegex.hasMatch(fssai);
  }
  bool isGstValid = true;
  bool isFSSAIValid = true;

  void printValues() {
    print("Time Values:");
    for (int i = 0; i < times.length; i++) {
      print("${distances[i]}: ${times[i]} :  ${prices[i]}");
    }

    // print("\nPrice Values:");
    // for (int i = 0; i < prices.length; i++) {
    //   print("${distances[i]}: ${prices[i]}");
    // }
  }

  late double lat;
  late double lng;
  Future<void> fetchBank () async {
  WidgetsBinding.instance.addPostFrameCallback((_) {
  Provider.of<ProviderVendor>(context, listen: false)
      .getCategory();
  Provider.of<ProviderVendor>(context, listen: false)
      .getBanks();
  Provider.of<ProviderVendor>(context, listen: false)
      .getMalls(lat, lng);
  Provider.of<ProviderVendor>(context, listen: false)
      .getDeliveyData();
  });
}


  @override
  void initState() {
    // TODO: implement initState
    item3.add("Profile");
    item3.add("Store");
    item3.add("Bank Detail");
    lat = 13.76867;
    lng = 77.98378;
    //token = userToken.getItem('token');
    //print(token);
    fetchBank();

    statusList = List.filled(daysOfWeek.length, "status");

   // fetchBank();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<ProviderVendor>(context, listen: false)
    //       .getCategory();
    //   Provider.of<ProviderVendor>(context, listen: false)
    //       .getBanks();
    // });

    Widget bankList() {

      TextEditingController searchController = TextEditingController();

      List<BankList> filteredBanks = [];
      ProviderVendor? value; // Define a variable to hold the value




      void filterBanks(String search, ProviderVendor value) {
        filteredBanks.clear();
        if (search.isEmpty) {
          filteredBanks.addAll(value.bankData.bankList);
        } else {
          for (var bank in value.bankData.bankList) {
            if (bank.bankName.toLowerCase().contains(search.toLowerCase())) {
              filteredBanks.add(bank);
            }
          }
        }
      }



      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text("Bank Name *", style: fontStyle50012(AppColors.bgBlack),),
            ),
            const SizedBox(height: 4,),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child:
                  TextFormField(
                    controller: bankNameController,
                    onChanged: (searchText) {
                      setState(() {
                        if (value != null) {
                          filterBanks(searchText, value);
                        }
                        // filterBanks(searchText, value!); // Pass the value as an argument

                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Enter Bank Name",
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        suffixIcon: InkWell(
                          onTap: () {
                            print(isBankVisible);
                            setState(() {
                              isBankVisible = !isBankVisible;
                              print("Lengthhhh-----${length}");
                            });
                          },
                          child: Icon(
                            Icons.expand_more,
                          ),
                        )
                    ),
                  ),
                ),
                Visibility(
                  visible: isBankVisible,
                  child: Consumer<ProviderVendor>(builder: (context, value, child) {
                    value = value;
                    if (value != null) {
                      filterBanks(bankNameController.text, value);
                    }
                    if(identical(value.isBanksLoading, "NOT_STARTED") || identical(value.isBanksLoading, "LOADING")) {
                      return CircularProgressIndicator();
                    }if(identical(value.isBanksLoading, "ERROR")) {
                     return Text("No Data");
                    }else {




                      // void filterBanks(String search) {
                      //   filteredBanks.clear();
                      //   if (search.isEmpty) {
                      //     filteredBanks.addAll(value.bankData.bankList);
                      //   } else {
                      //     for (var bank in value.bankData.bankList) {
                      //       if (bank.bankName.toLowerCase().contains(search.toLowerCase())) {
                      //         filteredBanks.add(bank);
                      //       }
                      //     }
                      //   }
                      // }


                      return
                        Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              //itemCount: products.length,
                              physics: ClampingScrollPhysics(),
                              // itemCount: value.bankData.bankList.length,
                              itemCount: filteredBanks.length,
                              itemBuilder: (BuildContext context, int index) {
                                // var banks = value.bankData.bankList[index];
                                var banks = filteredBanks[index];
                                // length = value.bankData.bankList.length;
                                length = filteredBanks.length;
                                // final isSelected = selectedProducts.contains(banks.bankName);
                                return InkWell(
                                  onTap: () {
                                    print("jhdvsbfcjkadn--->...$index");
                                    setState(() {
                                      bankNameController.text = banks.bankName;
                                      bankId = banks.id;
                                      isBankVisible = false;
                                      // if (isSelected) {
                                      //   selectedProducts.remove(banks.bankName);
                                      // } else {
                                      //   selectedProducts.add(banks.bankName);
                                      // }
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(16),
                                        alignment: Alignment.topLeft,
                                        decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius: BorderRadius.circular(8)
                                        ),
                                        //child: Text(products[index]))
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                banks.bankName,
                                              ),
                                            ),
                                          ],
                                        ),)
                                    ],
                                  ),
                                );
                              }),
                        );
                    }
                  },)
                )
              ],
            ),
          ],
        ),
      );
    }


    Widget textFormFieldDriver(String name, String hinttext, {Function(String)? onChanged, String? initialValue}) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(name),
            ),
            const SizedBox(height: 4,),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: hinttext,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 12)
                ),
                onChanged: onChanged,
                  initialValue: initialValue,
              ),
            ),
          ],
        ),
      );
    }

    //DateFormat dateFormat = DateFormat('yyyy-MM-dd');


    Future<void> _selectDate(BuildContext context) async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null) {
        String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
        setState(() {
          dobController.text = formattedDate;
        });
        // Do something with the selected DOB (formattedDate)
      }
    }


    Widget buildProfileForm() {
      final List<String> documents = [
        "Pan card",
        "Aadhar Card",
        "Driving License"
      ];

      final List<String> genderSelection = [
        "Male",
        "Female",
        "other",
      ];

      return Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            //textFormField("First Name *", "Enter your first name",firstController),
            textFormFieldWithValidation("First Name","*", "Enter your first name",firstController),

            textFormFieldWithValidation("Last Name","*", "Enter your last name",lastNameController),
            //textFormField("Dob", "DD//MM/YYYY",dobController),
            Container(
              padding: const EdgeInsets.only(top: 16),
              alignment: Alignment.topLeft,
              child:  RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "DOB",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: "*",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ),
            const SizedBox(height: 4,),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: TextFormField(
                controller: dobController,
                //editing controller of this TextField
                decoration: InputDecoration(
                    hintText: "pick date",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 12),
                    icon: Icon(Icons.calendar_today), //icon of text field

                ),
                readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        // lastDate: DateTime(2100));
                        lastDate:  DateTime.now(),);

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        dobController.text =
                            formattedDate; //set output date to TextField value.
                        print(dobController.text);
                      });
                    }
                  }
                    ),
            ),



            //textFormField("Gender", "Select your gender",postalCodeController),
            const SizedBox(height: 12,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Gender",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        isGender = !isGender;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all()
                      ),
                      child: Row(
                        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                        children: [
                          Text(gender),
                          const Icon(Icons.expand_more)
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isGender,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            //border: Border.all(),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: genderSelection.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  print("jhdvsbfcjkadn--->...$index");
                                  setState(() {
                                    gender = genderSelection[index];
                                    isGender = false;
                                  });
                                  print(gender);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.all(16),
                                          alignment: Alignment.topLeft,
                                          decoration: BoxDecoration(
                                               border: Border.all(width: 0.2),
                                            color: AppColors.grey,
                                              borderRadius: BorderRadius.circular(8)
                                          ),
                                          child: Text(genderSelection[index]))
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  )
                ],
              ),
            ),

            textFormFieldWithValidation("Email", "*" , "Enter your personal mail id",emailController),
            textFormFieldWithValidation("Mobile number" ,"*", "Personal mobile number",mobileController),
            textFormField("Alternate Mobile number(Optional) ", "Personal mobile number",altMobileController),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Address", style: fontStyleHeading(AppColors.bgBlack),),
                 InkWell(
                   onTap: () {
                     _getCurrentPosition();
                   },
                   child: Row(
                     children: [
                       Icon(Icons.location_on),
                       Text("Fetch Location"),
                     ],
                   ),
                 )
                ],
              ),
            ),
            textFormField("Country *", "Country",countryController),
            textFormField("State *", "state",stateController),
            textFormField("City *", "City", cityController),
            textFormField("Area *", "area...",areaController),
            textFormField("Lat *", "area...",latController),
            textFormField("Lng *", "area...",lngController),
            textFormField("Street Name*", "Street name...", streetController),
            textFormField("Building Name", "Building name...", buildingNameController),
            textFormField("Floor ", "Floor...",floorNum),
            textFormField("Door No*", "door No...",doorNumController),
            textFormField("PinCode*", " pincode...",postalCodeController),
            textFormField("Landmark*", " landmark...",landmarkController),
            Container(
              child: Column(
                children: [
                  const Text("Identity Proof *"),
                  InkWell(
                    onTap: (){
                     setState(() {
                       isExpand = !isExpand;
                     });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all()
                      ),
                      child: Row(
                        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                        children: [
                          Text(document),
                          const Icon(Icons.expand_more)
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isExpand,
                    child: Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: documents.length,
                          itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            print("jhdvsbfcjkadn--->...$index");
                            setState(() {
                              document = documents[index];
                              isExpand = false;
                            });
                            print(document);
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16),
                                alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Text(documents[index]))
                            ],
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24,),
            InkWell(
              onTap: (){
                //_openFilePicker();
                _pickImage(1);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all()
                ),
                child:
                Column(
                  children: [
                    if(_fileName1.isEmpty)
                   Column(
                     children: [
                       const Icon(Icons.file_upload_outlined),
                       Text("Click to upload", style: fontStyle60016(AppColors.facebook),),
                       Text("SVG, PNG, JPG,", style: fontStyleSentences(),)
                     ],
                   )
                    else
                      Container(
                        child: Text(_fileName1),
                      )


                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12)
                ),
                onPressed: (){
                  if(firstController.text.isNotEmpty && lastNameController.text.isNotEmpty && dobController.text.isNotEmpty && gender != null && emailController.text.isNotEmpty && mobileController.text.isNotEmpty && countryController.text.isNotEmpty && stateController.text.isNotEmpty && cityController.text.isNotEmpty && areaController.text.isNotEmpty && streetController.text.isNotEmpty && buildingNameController.text.isNotEmpty && floorNum.text.isNotEmpty && doorNumController.text.isNotEmpty && postalCodeController.text.isNotEmpty && landmarkController.text.isNotEmpty && document.isNotEmpty && _fileName1.isNotEmpty)
                  veriftPersonalDetails();
                } ,
                //goToNextStep,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Submit", style: fontStyle60016(AppColors.bgWhite),),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
    Widget buildStoreForm() {

      String selectedDeliveryType = ""; // Add this variable
      final List<String> categories = [
        "Products",
        //"Services",
      ];

      // final List<String> products = [
      //   "Food",
      //   "Electronics",
      //   "Fashion & Appreal",
      //   "Groceries",
      //   "HardWare"
      // ];
      // final List<String> services = [
      //   "Painting",
      //   "Electrician",
      //   "Car Grooming",
      //   "pet Gromming",
      //   "HardWare"
      // ];
      final List<String> deliveryType = [
        "Delivery by C2B",
        "Vendor Delivery",
        "Take away",
      ];
      return Consumer<ProviderVendor>(
          builder: (context, value, child) {
        if(identical(value, "NOT_STARTED") || identical(value, "LOADING")) {
          return  CircularProgressIndicator();
        }
        return
          Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Type of market place *"),
                    const SizedBox(height: 4,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          isCategory = !isCategory;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all()
                        ),
                        child: Row(
                          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                          children: [
                            Text(category),
                            const Icon(Icons.expand_more)
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isCategory,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: categories.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    print("jhdvsbfcjkadn--->...$index");
                                    setState(() {
                                      category = categories[index];
                                      isCategory = false;
                                    });
                                    print(document);
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.all(16),
                                          alignment: Alignment.topLeft,
                                          decoration: BoxDecoration(
                                              border: Border.all(width: 0.2),
                                              color: AppColors.grey,
                                              borderRadius: BorderRadius.circular(8)
                                          ),
                                          child: Text(categories[index]))
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24,),
              //////////////Product Registration////////////////////////////
              if(category == "Products")
                Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Type of Product*"),
                          const SizedBox(height: 4,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                isProduct = !isProduct;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all()
                              ),
                              child: Row(
                                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Text(selectedProducts.isEmpty ? "Select here" : "${selectedProducts.join(", ")}")),
                                  const Icon(Icons.expand_more)
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isProduct,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    //itemCount: products.length,
                                    itemCount: value.categoryData.categories.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      var products = value.categoryData.categories[index];
                                      final isSelected = selectedProducts.contains(products.categoryName);


                                      return InkWell(
                                        onTap: () {
                                          print("jhdvsbfcjkadn--->...$index");
                                          // setState(() {
                                          //   if (isSelected) {
                                          //     selectedProducts.remove(products.categoryName);
                                          //   } else {
                                          //     selectedProducts.add(products.categoryName);
                                          //   }
                                          // });
                                          // setState(() {
                                          //   if (selectedProducts.contains("Food") || selectedProducts.contains("Food Court")) {
                                          //     if (isSelected && (products.categoryName == "Food" || products.categoryName == "Food Court")) {
                                          //       selectedProducts.remove(products.categoryName);
                                          //     }
                                          //   } else if (!isSelected && (products.categoryName == "Food" || products.categoryName == "Food Court")) {
                                          //     selectedProducts.add(products.categoryName);
                                          //   }
                                          //   else {
                                          //     selectedProducts.add(products.categoryName);
                                          //   }
                                          // });

                                          ////////Working code for selecting each item but including food
                                          // setState(() {
                                          //   if (selectedProducts.contains("Food") || selectedProducts.contains("Food Court")) {
                                          //     if (isSelected && (products.categoryName == "Food" || products.categoryName == "Food Court")) {
                                          //       selectedProducts.remove(products.categoryName);
                                          //     }
                                          //   } else {
                                          //     if (isSelected) {
                                          //       selectedProducts.remove(products.categoryName);
                                          //     } else if (!isSelected && !selectedProducts.contains(products.categoryName)) {
                                          //       selectedProducts.add(products.categoryName);
                                          //     }
                                          //   }
                                          // });
//////////////////fine working code/////////////
//                                         setState(() {
//                                           if (products.categoryName == "Food" || products.categoryName == "Food Court") {
//                                             if (isSelected) {
//                                               selectedProducts.remove(products.categoryName);
//                                             } else {
//                                               selectedProducts.clear();
//                                               selectedProducts.add(products.categoryName);
//                                             }
//                                           } else if (!selectedProducts.contains("Food") && !selectedProducts.contains("Food Court")) {
//                                             if (isSelected) {
//                                               selectedProducts.remove(products.categoryName);
//                                             } else if (!isSelected && !selectedProducts.contains(products.categoryName)) {
//                                               selectedProducts.add(products.categoryName);
//                                             }
//                                           }
//                                         });
                                          /////////////
                                          setState(() {
                                            if (products.categoryName == "Food" || products.categoryName == "Food Court") {
                                              if (isSelected) {
                                                selectedProducts.remove(products.categoryName);
                                              } else {
                                                selectedProducts.clear();
                                                selectedProducts.add(products.categoryName);
                                              }
                                            } else {
                                              if (isSelected) {
                                                selectedProducts.remove(products.categoryName);
                                              } else {
                                                selectedProducts.removeWhere((product) => product == "Food" || product == "Food Court");
                                                if (!selectedProducts.contains(products.categoryName)) {
                                                  selectedProducts.add(products.categoryName);
                                                }
                                              }
                                            }
                                          });
                                          // setState(() {
                                          //   if (products.categoryName == "Food" || products.categoryName == "Food Court") {
                                          //     selectedProducts.clear();
                                          //     selectedProducts.add(products.categoryName);
                                          //   } else if (!selectedProducts.contains("Food") && !selectedProducts.contains("Food Court")) {
                                          //     if (isSelected) {
                                          //       selectedProducts.remove(products.categoryName);
                                          //     } else if (!isSelected && !selectedProducts.contains(products.categoryName)) {
                                          //       selectedProducts.add(products.categoryName);
                                          //     }
                                          //   }
                                          // });
                                          print(selectedProducts[index]);
                                          print(selectedProducts.length);
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(16),
                                              alignment: Alignment.topLeft,
                                              decoration: BoxDecoration(
                                                  border: Border.all(width: 0.2),
                                                  color: AppColors.grey,
                                                  borderRadius: BorderRadius.circular(8)
                                              ),
                                              //child: Text(products[index]))
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      products.categoryName,
                                                      style: TextStyle(
                                                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                  if (isSelected)
                                                    const Icon(
                                                      Icons.check,
                                                      color: Colors.green,
                                                    ),
                                                ],
                                              ),)
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    if(selectedProducts.contains("Food Court"))
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Select Mall from below dropdown"),
                          const SizedBox(height: 4,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                isMall = !isMall;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all()
                              ),
                              child: Row(
                                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(mall),
                                  const Icon(Icons.expand_more)
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isMall,
                            child: Container(
                              child: ListView.builder(
                                physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: value.mallList.malls.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        print("jhdvsbfcjkadn--->...$index");
                                        setState(() {
                                          mall = value.mallList.malls[index].name;
                                          isMall = false;
                                          mall_name = mall;
                                          mall_id = value.mallList.malls[index].id;
                                        });
                                        print(document);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.all(16),
                                              alignment: Alignment.topLeft,
                                              decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  borderRadius: BorderRadius.circular(8)
                                              ),
                                              child: Text(value.mallList.malls[index].name))
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                    textFormField(" Store/Company Name*", "Enter here",storeNameController),
                    //textFormField(" Gst Number *", "Enter here",getNumberController),
                    if(!selectedProducts.contains("Food Court") || !selectedProducts.contains("Food"))

                      Container(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text("Gst Number *", style: fontStyle50012(AppColors.bgBlack),),
            ),
            const SizedBox(height: 4,),
            Container(
            decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(8)
            ),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  isGstValid = validateGST(value);
                });
              },

            controller: getNumberController,
            decoration: InputDecoration(
            hintText: "Enter here",
              // errorText: isGstValid ? null : 'Invalid GST format',
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 12),
            ),
            ),
            ),
              if (!isGstValid)
                Text(
                  'Invalid GST format',
                  style: TextStyle(color: Colors.red), // You can style the error message as you like
                ),
            ],
            ),
            ),
                    if(selectedProducts.contains("Food Court") || selectedProducts.contains("Food"))
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text("FSSAI Number *", style: fontStyle50012(AppColors.bgBlack),),
                          ),
                          const SizedBox(height: 4,),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  isFSSAIValid = validateFSSAI(value);
                                });
                              },
                              controller: fssaiController,
                              decoration: InputDecoration(
                                hintText: "Enter here",
                                //errorText: isGstValid ? null : 'Invalid Fssai format',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 12),
                              ),
                            ),
                          ),
                          if (!isFSSAIValid)
                            Text(
                              'Invalid FSSAI format',
                              style: TextStyle(color: Colors.red), // You can style the error message as you like
                            ),
                        ],
                      ),
                    ),
                    //textFormField("FSSAI Number *", "Enter here",fssaiController),
                    textFormField("Mobile number *", "Enter your Mobile Number",storemobileController),
                    textFormField("Email *", "Enter your mail id",storeEmailController),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: InkWell(
                        onTap: onGetCurrentLocation,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Address", style: fontStyleHeading(AppColors.bgBlack),),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                Text("Fetch Loaction"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    textFormField("Country *", "Country",countryController),
                    textFormField("State *", "state",stateController),
                    textFormField("City *", "City",cityController),
                    textFormField("Area *", "area...",areaController),
                    textFormField("Street Name*", "Street name...",streetController),
                    textFormField("Building Name", "Building name...",storeBuildingController),
                    textFormField("Floor ", "Floor...",storeFloorController),
                    textFormField("Door No*", "door No...",storeDoorController),
                    textFormField("PinCode*", " pincode...",postalCodeController),
                    const SizedBox(height: 24,),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Select Delivery type*"),
                          const SizedBox(height: 4,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                isDelivery = !isDelivery;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all()
                              ),
                              child: Row(
                                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Text(selectedItems.isEmpty ? "Select here" : "${selectedItems.join(", ")}")),
                                  const Icon(Icons.expand_more)
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isDelivery,
                            child: Consumer<ProviderVendor>(builder: (context, value, child) {
                              if(identical(value.isDeliverytype, "NOT_STARTED") || identical(value.isDeliverytype, "LOADING")) {
                                return CircularProgressIndicator();
            }else {
                                // List<bool> selectedDelivery = List.generate(3, (index) => false);

                                return Container(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: value.deliveyTypeDetails.deliveryTypes.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        ///final isSelected = selectedProducts.contains(products[index]);
                                         List<bool> selectedDelivery = List.generate(value.deliveyTypeDetails.deliveryTypes.length, (index) => false);
                                        return InkWell(
                                          // onTap: () {
                                          //   print("jhdvsbfcjkadn--->...$index");
                                          //   // setState(() {
                                          //   //   if (selectedDelivery[index]) {
                                          //   //     selectedItems.add(deliveryType[index]);
                                          //   //   } else {
                                          //   //     selectedItems.remove(deliveryType[index]);
                                          //   //   }
                                          //   // });
                                          //   setState(() {
                                          //     if (selectedDelivery[index]) {
                                          //       selectedItems.add(value.deliveyTypeDetails.deliveryTypes[index].type);
                                          //     } else {
                                          //       selectedItems.remove(value.deliveyTypeDetails.deliveryTypes[index].type);
                                          //     }
                                          //   });
                                          //
                                          //   print(selectedProducts[index]);
                                          //   print(selectedProducts.length);
                                          // },
                                          onTap: () {
                                            setState(() {
                                              if (selectedDeliveryType == value.deliveyTypeDetails.deliveryTypes[index].type) {
                                                // If the selected delivery type is already the same as the current one, deselect it
                                                selectedDeliveryType = "";
                                                selectedItems.remove(value.deliveyTypeDetails.deliveryTypes[index].type);
                                              } else {
                                                // Otherwise, select the new delivery type and deselect the previous one if necessary
                                                selectedDeliveryType = value.deliveyTypeDetails.deliveryTypes[index].type;
                                                if (selectedDeliveryType == "COSE2BUY DELIVERY" || selectedDeliveryType == "SELLER DELIVERY") {
                                                  selectedItems.removeWhere((item) => item == "COSE2BUY DELIVERY" || item == "SELLER DELIVERY");
                                                }
                                                if (!selectedItems.contains(selectedDeliveryType)) { // Add this condition to check if the selected value is already present
                                                  selectedItems.add(selectedDeliveryType);
                                                }
                                              }
                                            });
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.all(8),
                                                alignment: Alignment.topLeft,
                                                decoration: BoxDecoration(
                                                    // border: Border.all(),
                                                    borderRadius: BorderRadius.circular(8)
                                                ),
                                                //child: Text(products[index]))
                                                child:  Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        value.deliveyTypeDetails.deliveryTypes[index].type,
                                                        style: const TextStyle(
                                                          // fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                    // Checkbox(
                                                    //   value: selectedDelivery[index],
                                                    //   onChanged: (bool? newValue) {
                                                    //     setState(() {
                                                    //       selectedDelivery[index] = newValue!;
                                                    //       if (newValue!) {
                                                    //         selectedItems.add(value.deliveyTypeDetails.deliveryTypes[index].type);
                                                    //       } else {
                                                    //         selectedItems.remove(value.deliveyTypeDetails.deliveryTypes[index].type);
                                                    //       }
                                                    //     });
                                                    //   },
                                                    // )
                                                    // Checkbox(
                                                    //   value: selectedDeliveryType == value.deliveyTypeDetails.deliveryTypes[index].type,
                                                    //   onChanged: null, // Disable the checkbox since the selection is handled by the onTap function
                                                    // )
                                                    // Checkbox(
                                                    //   value: selectedItems.contains(value.deliveyTypeDetails.deliveryTypes[index].type),
                                                    //   onChanged: (bool? newValue) {
                                                    //     setState(() {
                                                    //       if (newValue!) {
                                                    //         selectedItems.add(value.deliveyTypeDetails.deliveryTypes[index].type);
                                                    //       } else {
                                                    //         selectedItems.remove(value.deliveyTypeDetails.deliveryTypes[index].type);
                                                    //       }
                                                    //     });
                                                    //   },
                                                    // ),
                                                    Checkbox(
                                                      value: selectedItems.contains(value.deliveyTypeDetails.deliveryTypes[index].type),
                                                      onChanged: (bool? newValue) {
                                                        setState(() {
                                                          if (newValue!) {
                                                            if (value.deliveyTypeDetails.deliveryTypes[index].type == "COSE2BUY DELIVERY" || value.deliveyTypeDetails.deliveryTypes[index].type == "SELLER DELIVERY") {
                                                              selectedItems.clear(); // Clear the selectedItems list
                                                              selectedItems.add(value.deliveyTypeDetails.deliveryTypes[index].type); // Add the selected delivery type
                                                            } else {
                                                              selectedItems.add(value.deliveyTypeDetails.deliveryTypes[index].type); // Add the selected delivery type
                                                            }
                                                          } else {
                                                            selectedItems.remove(value.deliveyTypeDetails.deliveryTypes[index].type); // Remove the deselected delivery type
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),)
                                            ],
                                          ),
                                        );
                                      }),
                                );
            }
            })

                          ),
                          /////////////////Self Delivery type Data/////////////////////////////////

                          if(selectedItems.contains("SELLER DELIVERY"))
                            Container(
                                padding: const EdgeInsets.only(top: 16),
                                child: Column(
                                  children: [
                                    ListView.builder(
                                      physics: ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: distances.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return  Column(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.all(5),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                        decoration: BoxDecoration(
                                                            border: Border.all(),
                                                            borderRadius: BorderRadius.circular(8)
                                                        ),
                                                        width: MediaQuery.of(context).size.width * 0.25,
                                                        height: MediaQuery.sizeOf(context).height * 0.04,
                                                        child: Container(
                                                          alignment: Alignment.center,
                                                          child:  Text(distances[index]),
                                                        )),
                                                    Container(
                                                        decoration: BoxDecoration(
                                                            border: Border.all(),
                                                            borderRadius: BorderRadius.circular(8)
                                                        ),
                                                        width: MediaQuery.of(context).size.width * 0.25,
                                                        height: MediaQuery.sizeOf(context).height * 0.04,
                                                        child: TextFormField(
                                                          textAlign: TextAlign.center,
                                                          decoration: const InputDecoration(
                                                            hintText: "TIme(min)",
                                                            border: InputBorder.none,
                                                          ),
                                                          onChanged: (value) {
                                                            // Update time value in the list
                                                            times[index] = value;
                                                          },
                                                        )),
                                                    Container(
                                                        decoration: BoxDecoration(
                                                            border: Border.all(),
                                                            borderRadius: BorderRadius.circular(8)
                                                        ),
                                                        width: MediaQuery.of(context).size.width * 0.25,
                                                        height: MediaQuery.sizeOf(context).height * 0.04,
                                                        child: TextFormField(
                                                          textAlign: TextAlign.center,
                                                          decoration: const InputDecoration(
                                                              border: InputBorder.none,
                                                              hintText: "Price \u20B9"
                                                          ),
                                                          onChanged: (value) {
                                                            // Update price value in the list
                                                            prices[index] = value;
                                                          },
                                                        )),
                                                  ],
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                    const SizedBox(height: 24,),
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                                border: Border.all(),
                                                borderRadius: BorderRadius.circular(16)
                                            ),
                                            child: Column(
                                              children: [
                                                for (int i = 0; i < drivers.length; i++)
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Text("Driver $i", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                                                if(i>0)
                                                                  IconButton(
                                                                    icon: const Icon(Icons.close),
                                                                    onPressed: () {
                                                                      setState(() {
                                                                        drivers.removeAt(i);
                                                                      });
                                                                    },
                                                                  ),
                                                              ],
                                                            ),
                                                            textFormFieldDriver("Name *", "Enter the first name",
                                                                onChanged: (value) {
                                                                  setState(() {
                                                                    drivers[i].name = value;
                                                                  });
                                                                },initialValue: drivers[i].name
                                                            ),
                                                            textFormFieldDriver("Last Name *", "Enter the last name",
                                                                onChanged: (value) {
                                                                  setState(() {
                                                                    drivers[i].lastName = value;
                                                                  });
                                                                },initialValue: drivers[i].lastName
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                Column(
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          drivers.add(Driver());
                                                        });
                                                      },
                                                      child: const Text("Add Driver"),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            // Column(
                                            //   crossAxisAlignment: CrossAxisAlignment.start,
                                            //   children: [
                                            //     Row(
                                            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            //       children: [
                                            //         Text("Drivers *", style: fontStyle60016(AppColors.bgBlack),),
                                            //         InkWell(
                                            //           onTap: () {
                                            //
                                            //           },
                                            //             child: Icon(Icons.add))
                                            //       ],
                                            //     ),
                                            //     textFormField("Name *", " Enter the first name"),
                                            //     textFormField("Last Name *", " Enter the last name"),
                                            //   ],
                                            // ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                            )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24,),
                    ////////////////Store Timings////////////////////////////
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isTimings = !isTimings;
                              });
                            },
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Store Timimgs"),
                                Icon(isTimings ? Icons.expand_less : Icons.expand_more)
                              ],
                            ),
                          ),
                          Visibility(
                            visible: isTimings,
                            child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: daysOfWeek.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final day = daysOfWeek[index];
                                  final status = statusList[index]; // Use individual status for each item


                                  return  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(day),
                                      Container(
                                        padding: EdgeInsets.only(top: 8, bottom: 8),
                                        child: Row(
                                          children: [
                                            const Text("9:00AM"),
                                            const SizedBox(width: 5,),
                                            const Text("-"),
                                            const SizedBox(width: 5,),
                                            const Text("9:00PM"),
                                            const SizedBox(width: 5,),
                                            Column(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.only(top: 4, bottom: 4, left:8, right: 8 ),
                                                  decoration: BoxDecoration(
                                                      color: AppColors.cvPink,
                                                      borderRadius: BorderRadius.circular(24)
                                                  ),

                                                  child:  Column(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            isStatus[index] = !isStatus[index];
                                                          });
                                                        },
                                                        child:Container(
                                                          width: MediaQuery.of(context).size.width * 0.18,
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(status),
                                                              const Icon(Icons.expand_more)
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],

                                                  ),
                                                ),
                                                Visibility(
                                                  visible:  isStatus[index],
                                                  child:  Container(
                                                    width: MediaQuery.of(context).size.width * 0.19,
                                                    height: MediaQuery.of(context).size.height * 0.1,
                                                    child: ListView.builder(
                                                        itemCount: statusOptions.length,
                                                        itemBuilder: (BuildContext context, int childIndex) {
                                                          return InkWell(
                                                            onTap: () {
                                                              print(index);
                                                              print(statusOptions[childIndex]);
                                                              setState(() {
                                                                statusList[index] = statusOptions[childIndex];
                                                                isStatus[index] = false;
                                                              });
                                                            },
                                                            child: Container(
                                                                padding: EdgeInsets.only(left: 8, right: 8, bottom: 4, top: 4),
                                                                width: MediaQuery.of(context).size.width * 0.19,
                                                                alignment: Alignment.center,
                                                                decoration: BoxDecoration(
                                                                    color: AppColors.bgGreen,
                                                                    borderRadius: BorderRadius.circular(4)
                                                                ),
                                                                // padding: EdgeInsets.only(left: 8, right: 8, bottom: 4,top: 4),
                                                                child: Text(statusOptions[childIndex], style: fontStyle50012(AppColors.bgWhite),)),
                                                          );
                                                        }),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24,),
                    ////////////Elevated Submit Button///////////////////////
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12)
                        ),
                        onPressed: () {
                          //printValues();
                          veriftStoreDetails();
                          //goToNextStep();
                          // for (int i = 0; i < drivers.length; i++) {
                          //   print("Driver $i: Name: ${drivers[i].name}, Last Name: ${drivers[i].lastName}");
                          // }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Submit", style: fontStyle60016(AppColors.bgWhite),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ///////////////////////////////Services Registration////////////////////////
              if(category == "Services")
                Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Type of Services*"),
                          const SizedBox(height: 4,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                isService = !isService;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all()
                              ),
                              child: Row(
                                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Text(selectedServices.isEmpty ? "Select here" : "${selectedServices.join(", ")}")),
                                  const Icon(Icons.expand_more)
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isService,
                            child: Container(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: value.categoryData.services.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    var services = value.categoryData.services[index];
                                    final isSelected = selectedServices.contains(services.name);

                                    return InkWell(
                                      onTap: () {
                                        print("jhdvsbfcjkadn--->...$index");
                                        setState(() {
                                          if (isSelected) {
                                            selectedServices.remove(services.name);
                                          } else {
                                            selectedServices.add(services.name);
                                          }
                                        });
                                        print(selectedServices[index]);
                                        print(selectedServices.length);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(16),
                                            alignment: Alignment.topLeft,
                                            decoration: BoxDecoration(
                                                border: Border.all(),
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            //child: Text(products[index]))
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    services.name,
                                                    style: TextStyle(
                                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                                if (isSelected)
                                                  const Icon(
                                                    Icons.check,
                                                    color: Colors.green,
                                                  ),
                                              ],
                                            ),)
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),

                    textFormField("Mobile number *", "Enter your Mobile Number",postalCodeController),
                    textFormField("Alternate number *", "Enter your Alt Number",postalCodeController),
                    textFormField("Email *", "Enter your mail id",postalCodeController),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text("Address", style: fontStyleHeading(AppColors.bgBlack),),
                    ),
                    textFormField("Country *", "Country",postalCodeController),
                    textFormField("State *", "state",postalCodeController),
                    textFormField("City *", "City",postalCodeController),
                    textFormField("Area *", "area...",postalCodeController),
                    textFormField("Street Name*", "Street name...",postalCodeController),
                    textFormField("Building Name", "Building name...",postalCodeController),
                    textFormField("Floor ", "Floor...",postalCodeController),
                    textFormField("Door No*", "door No...",postalCodeController),
                    textFormField("PinCode*", " pincode...",postalCodeController),

                    const SizedBox(height: 24,),
                    ////////////Elevated Submit Button///////////////////////
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12)
                        ),
                        onPressed: () {
                          //printValues();
                          goToNextStep();
                          for (int i = 0; i < drivers.length; i++) {
                            print("Driver $i: Name: ${drivers[i].name}, Last Name: ${drivers[i].lastName}");
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Submit", style: fontStyle60016(AppColors.bgWhite),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        );
      });


      //   Container(
      //   padding: const EdgeInsets.only(left: 16, right: 16),
      //   child: Column(
      //     children: [
      //       Container(
      //         child: Column(
      //          crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             const Text("Type of market place *"),
      //             const SizedBox(height: 4,),
      //             InkWell(
      //               onTap: (){
      //                 setState(() {
      //                   isCategory = !isCategory;
      //                 });
      //               },
      //               child: Container(
      //                 padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      //                 decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(8),
      //                     border: Border.all()
      //                 ),
      //                 child: Row(
      //                   mainAxisAlignment:  MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text(category),
      //                     const Icon(Icons.expand_more)
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             Visibility(
      //               visible: isCategory,
      //               child: Container(
      //                 child: ListView.builder(
      //                     shrinkWrap: true,
      //                     itemCount: categories.length,
      //                     itemBuilder: (BuildContext context, int index) {
      //                       return InkWell(
      //                         onTap: () {
      //                           print("jhdvsbfcjkadn--->...$index");
      //                           setState(() {
      //                             category = categories[index];
      //                             isCategory = false;
      //                           });
      //                           print(document);
      //                         },
      //                         child: Column(
      //                           children: [
      //                             Container(
      //                                 padding: const EdgeInsets.all(16),
      //                                 alignment: Alignment.topLeft,
      //                                 decoration: BoxDecoration(
      //                                     border: Border.all(),
      //                                     borderRadius: BorderRadius.circular(8)
      //                                 ),
      //                                 child: Text(categories[index]))
      //                           ],
      //                         ),
      //                       );
      //                     }),
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //       const SizedBox(height: 24,),
      //      //////////////Product Registration////////////////////////////
      //       if(category == "Products")
      //      Column(
      //        children: [
      //          Container(
      //            child: Column(
      //              crossAxisAlignment: CrossAxisAlignment.start,
      //              children: [
      //                const Text("Type of Product*"),
      //                const SizedBox(height: 4,),
      //                InkWell(
      //                  onTap: (){
      //                    setState(() {
      //                      isProduct = !isProduct;
      //                    });
      //                  },
      //                  child: Container(
      //                    padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      //                    decoration: BoxDecoration(
      //                        borderRadius: BorderRadius.circular(8),
      //                        border: Border.all()
      //                    ),
      //                    child: Row(
      //                      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
      //                      children: [
      //                        Expanded(child: Text(selectedProducts.isEmpty ? "Select here" : "${selectedProducts.join(", ")}")),
      //                        const Icon(Icons.expand_more)
      //                      ],
      //                    ),
      //                  ),
      //                ),
      //                Visibility(
      //                  visible: isProduct,
      //                  child: Container(
      //                    child: ListView.builder(
      //                        shrinkWrap: true,
      //                        itemCount: products.length,
      //                        itemBuilder: (BuildContext context, int index) {
      //                          final isSelected = selectedProducts.contains(products[index]);
      //
      //                          return InkWell(
      //                            onTap: () {
      //                              print("jhdvsbfcjkadn--->...$index");
      //                              setState(() {
      //                                if (isSelected) {
      //                                  selectedProducts.remove(products[index]);
      //                                } else {
      //                                  selectedProducts.add(products[index]);
      //                                }
      //                              });
      //                              print(selectedProducts[index]);
      //                              print(selectedProducts.length);
      //                            },
      //                            child: Column(
      //                              children: [
      //                                Container(
      //                                  padding: const EdgeInsets.all(16),
      //                                  alignment: Alignment.topLeft,
      //                                  decoration: BoxDecoration(
      //                                      border: Border.all(),
      //                                      borderRadius: BorderRadius.circular(8)
      //                                  ),
      //                                  //child: Text(products[index]))
      //                                  child: Row(
      //                                    children: [
      //                                      Expanded(
      //                                        child: Text(
      //                                          products[index],
      //                                          style: TextStyle(
      //                                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      //                                          ),
      //                                        ),
      //                                      ),
      //                                      if (isSelected)
      //                                        const Icon(
      //                                          Icons.check,
      //                                          color: Colors.green,
      //                                        ),
      //                                    ],
      //                                  ),)
      //                              ],
      //                            ),
      //                          );
      //                        }),
      //                  ),
      //                )
      //              ],
      //            ),
      //          ),
      //          textFormField(" Store/Company Name*", "Enter here",storeNameController),
      //          textFormField(" Gst Number *", "Enter here",getNumberController),
      //          textFormField("FSSAI Number *", "Enter here",fssaiController),
      //          textFormField("Mobile number *", "Enter your Mobile Number",storemobileController),
      //          textFormField("Email *", "Enter your mail id",storeEmailController),
      //          Padding(
      //            padding: const EdgeInsets.only(top: 16),
      //            child: InkWell(
      //              onTap: onGetCurrentLocation,
      //              child: Row(
      //                mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                children: [
      //                  Text("Address", style: fontStyleHeading(AppColors.bgBlack),),
      //                  Row(
      //                    children: [
      //                      Icon(Icons.location_on),
      //                      Text("Fetch Loaction"),
      //                    ],
      //                  ),
      //                ],
      //              ),
      //            ),
      //          ),
      //          textFormField("Country *", "Country",countryController),
      //          textFormField("State *", "state",stateController),
      //          textFormField("City *", "City",cityController),
      //          textFormField("Area *", "area...",areaController),
      //          textFormField("Street Name*", "Street name...",streetController),
      //          textFormField("Building Name", "Building name...",postalCodeController),
      //          textFormField("Floor ", "Floor...",postalCodeController),
      //          textFormField("Door No*", "door No...",postalCodeController),
      //          textFormField("PinCode*", " pincode...",postalCodeController),
      //          const SizedBox(height: 24,),
      //          Container(
      //            padding: const EdgeInsets.all(16),
      //            decoration: BoxDecoration(
      //                border: Border.all(),
      //                borderRadius: BorderRadius.circular(12)
      //            ),
      //            child: Column(
      //              crossAxisAlignment: CrossAxisAlignment.start,
      //              children: [
      //                const Text("Select Delivery type*"),
      //                const SizedBox(height: 4,),
      //                InkWell(
      //                  onTap: (){
      //                    setState(() {
      //                      isDelivery = !isDelivery;
      //                    });
      //                  },
      //                  child: Container(
      //                    padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      //                    decoration: BoxDecoration(
      //                        borderRadius: BorderRadius.circular(8),
      //                        border: Border.all()
      //                    ),
      //                    child: Row(
      //                      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
      //                      children: [
      //                        Expanded(child: Text(selectedItems.isEmpty ? "Select here" : "${selectedItems.join(", ")}")),
      //                        const Icon(Icons.expand_more)
      //                      ],
      //                    ),
      //                  ),
      //                ),
      //                Visibility(
      //                  visible: isDelivery,
      //                  child: Container(
      //                    child: ListView.builder(
      //                        shrinkWrap: true,
      //                        itemCount: deliveryType.length,
      //                        itemBuilder: (BuildContext context, int index) {
      //                          ///final isSelected = selectedProducts.contains(products[index]);
      //                          return InkWell(
      //                            onTap: () {
      //                              print("jhdvsbfcjkadn--->...$index");
      //                              setState(() {
      //                                if (selectedDelivery[index]) {
      //                                  selectedItems.add(deliveryType[index]);
      //                                } else {
      //                                  selectedItems.remove(deliveryType[index]);
      //                                }
      //                              });
      //                              print(selectedProducts[index]);
      //                              print(selectedProducts.length);
      //                            },
      //                            child: Column(
      //                              children: [
      //                                Container(
      //                                  padding: const EdgeInsets.all(16),
      //                                  alignment: Alignment.topLeft,
      //                                  decoration: BoxDecoration(
      //                                      border: Border.all(),
      //                                      borderRadius: BorderRadius.circular(8)
      //                                  ),
      //                                  //child: Text(products[index]))
      //                                  child:  Row(
      //                                    children: [
      //                                      Expanded(
      //                                        child: Text(
      //                                          deliveryType[index],
      //                                          style: const TextStyle(
      //                                            // fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      //                                          ),
      //                                        ),
      //                                      ),
      //                                      Checkbox(
      //                                        value: selectedDelivery[index],
      //                                        onChanged: (bool? value) {
      //                                          setState(() {
      //                                            selectedDelivery[index] = value!;
      //                                            if (value!) {
      //                                              selectedItems.add(deliveryType[index]);
      //                                            } else {
      //                                              selectedItems.remove(deliveryType[index]);
      //                                            }
      //                                          });
      //                                        },
      //                                      ),
      //                                    ],
      //                                  ),)
      //                              ],
      //                            ),
      //                          );
      //                        }),
      //                  ),
      //                ),
      //                /////////////////Self Delivery type Data/////////////////////////////////
      //
      //                if(selectedItems.contains("Slef Delivery"))
      //                  Container(
      //                      padding: const EdgeInsets.only(top: 16),
      //                      child: Column(
      //                        children: [
      //                          ListView.builder(
      //                              shrinkWrap: true,
      //                              itemCount: distances.length,
      //                              itemBuilder: (BuildContext context, int index) {
      //                                return  Column(
      //                                  children: [
      //                                    Container(
      //                                      padding: const EdgeInsets.all(5),
      //                                      child: Row(
      //                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                        children: [
      //                                          Container(
      //                                              decoration: BoxDecoration(
      //                                                  border: Border.all(),
      //                                                  borderRadius: BorderRadius.circular(8)
      //                                              ),
      //                                              width: MediaQuery.of(context).size.width * 0.25,
      //                                              height: MediaQuery.sizeOf(context).height * 0.04,
      //                                              child: Container(
      //                                                alignment: Alignment.center,
      //                                                child:  Text(distances[index]),
      //                                              )),
      //                                          Container(
      //                                              decoration: BoxDecoration(
      //                                                  border: Border.all(),
      //                                                  borderRadius: BorderRadius.circular(8)
      //                                              ),
      //                                              width: MediaQuery.of(context).size.width * 0.25,
      //                                              height: MediaQuery.sizeOf(context).height * 0.04,
      //                                              child: TextFormField(
      //                                                textAlign: TextAlign.center,
      //                                                decoration: const InputDecoration(
      //                                                  hintText: "TIme(min)",
      //                                                  border: InputBorder.none,
      //                                                ),
      //                                                onChanged: (value) {
      //                                                  // Update time value in the list
      //                                                  times[index] = value;
      //                                                },
      //                                              )),
      //                                          Container(
      //                                              decoration: BoxDecoration(
      //                                                  border: Border.all(),
      //                                                  borderRadius: BorderRadius.circular(8)
      //                                              ),
      //                                              width: MediaQuery.of(context).size.width * 0.25,
      //                                              height: MediaQuery.sizeOf(context).height * 0.04,
      //                                              child: TextFormField(
      //                                                textAlign: TextAlign.center,
      //                                                decoration: const InputDecoration(
      //                                                    border: InputBorder.none,
      //                                                    hintText: "Price \u20B9"
      //                                                ),
      //                                                onChanged: (value) {
      //                                                  // Update price value in the list
      //                                                  prices[index] = value;
      //                                                },
      //                                              )),
      //                                        ],
      //                                      ),
      //                                    )
      //                                  ],
      //                                );
      //                              }),
      //                          const SizedBox(height: 24,),
      //                          Container(
      //                            child: Column(
      //                              children: [
      //                                Container(
      //                                  padding: const EdgeInsets.all(16),
      //                                  decoration: BoxDecoration(
      //                                      border: Border.all(),
      //                                      borderRadius: BorderRadius.circular(16)
      //                                  ),
      //                                  child: Column(
      //                                    children: [
      //                                      for (int i = 0; i < drivers.length; i++)
      //                                        Container(
      //                                          child: Column(
      //                                            children: [
      //                                              Column(
      //                                                crossAxisAlignment: CrossAxisAlignment.start,
      //                                                children: [
      //                                                  Row(
      //                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                                    children: [
      //                                                      Text("Driver $i", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      //                                                      if(i>0)
      //                                                        IconButton(
      //                                                          icon: const Icon(Icons.close),
      //                                                          onPressed: () {
      //                                                            setState(() {
      //                                                              drivers.removeAt(i);
      //                                                            });
      //                                                          },
      //                                                        ),
      //                                                    ],
      //                                                  ),
      //                                                  textFormFieldDriver("Name *", "Enter the first name",
      //                                                      onChanged: (value) {
      //                                                        setState(() {
      //                                                          drivers[i].name = value;
      //                                                        });
      //                                                      },initialValue: drivers[i].name
      //                                                  ),
      //                                                  textFormFieldDriver("Last Name *", "Enter the last name",
      //                                                      onChanged: (value) {
      //                                                        setState(() {
      //                                                          drivers[i].lastName = value;
      //                                                        });
      //                                                      },initialValue: drivers[i].lastName
      //                                                  ),
      //                                                ],
      //                                              ),
      //                                            ],
      //                                          ),
      //                                        ),
      //
      //                                      Column(
      //                                        children: [
      //                                          ElevatedButton(
      //                                            onPressed: () {
      //                                              setState(() {
      //                                                drivers.add(Driver());
      //                                              });
      //                                            },
      //                                            child: const Text("Add Driver"),
      //                                          ),
      //                                        ],
      //                                      ),
      //                                    ],
      //                                  ),
      //                                  // Column(
      //                                  //   crossAxisAlignment: CrossAxisAlignment.start,
      //                                  //   children: [
      //                                  //     Row(
      //                                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                  //       children: [
      //                                  //         Text("Drivers *", style: fontStyle60016(AppColors.bgBlack),),
      //                                  //         InkWell(
      //                                  //           onTap: () {
      //                                  //
      //                                  //           },
      //                                  //             child: Icon(Icons.add))
      //                                  //       ],
      //                                  //     ),
      //                                  //     textFormField("Name *", " Enter the first name"),
      //                                  //     textFormField("Last Name *", " Enter the last name"),
      //                                  //   ],
      //                                  // ),
      //                                )
      //                              ],
      //                            ),
      //                          )
      //                        ],
      //                      )
      //                  )
      //              ],
      //            ),
      //          ),
      //          const SizedBox(height: 24,),
      //          ////////////////Store Timings////////////////////////////
      //          Container(
      //            padding: const EdgeInsets.all(16),
      //            decoration: BoxDecoration(
      //                border: Border.all(),
      //                borderRadius: BorderRadius.circular(8)
      //            ),
      //            child: Column(
      //              children: [
      //                InkWell(
      //                  onTap: () {
      //                    setState(() {
      //                      isTimings = !isTimings;
      //                    });
      //                  },
      //                  child:  Row(
      //                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                    children: [
      //                      Text("Store Timimgs"),
      //                      Icon(isTimings ? Icons.expand_less : Icons.expand_more)
      //                    ],
      //                  ),
      //                ),
      //                Visibility(
      //                  visible: isTimings,
      //                  child: ListView.builder(
      //                      shrinkWrap: true,
      //                      itemCount: daysOfWeek.length,
      //                      itemBuilder: (BuildContext context, int index) {
      //                        final day = daysOfWeek[index];
      //                        final status = statusList[index]; // Use individual status for each item
      //
      //
      //                        return  Row(
      //                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                          children: [
      //                            Text(day),
      //                            Container(
      //                              padding: EdgeInsets.only(top: 8, bottom: 8),
      //                              child: Row(
      //                                children: [
      //                                  const Text("9:00AM"),
      //                                  const SizedBox(width: 5,),
      //                                  const Text("-"),
      //                                  const SizedBox(width: 5,),
      //                                  const Text("9:00PM"),
      //                                  const SizedBox(width: 5,),
      //                                  Column(
      //                                    children: [
      //                                      Container(
      //                                        padding: const EdgeInsets.only(top: 4, bottom: 4, left:8, right: 8 ),
      //                                        decoration: BoxDecoration(
      //                                            color: AppColors.cvPink,
      //                                            borderRadius: BorderRadius.circular(24)
      //                                        ),
      //
      //                                        child:  Column(
      //                                          children: [
      //                                            InkWell(
      //                                              onTap: () {
      //                                                setState(() {
      //                                                  isStatus[index] = !isStatus[index];
      //                                                });
      //                                              },
      //                                              child:Container(
      //                                                width: MediaQuery.of(context).size.width * 0.18,
      //                                                child: Row(
      //                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                                  children: [
      //                                                    Text(status),
      //                                                    const Icon(Icons.expand_more)
      //                                                  ],
      //                                                ),
      //                                              ),
      //                                            ),
      //
      //                                          ],
      //
      //                                        ),
      //                                      ),
      //                                      Visibility(
      //                                        visible:  isStatus[index],
      //                                        child:  Container(
      //                                          width: MediaQuery.of(context).size.width * 0.19,
      //                                          height: MediaQuery.of(context).size.height * 0.1,
      //                                          child: ListView.builder(
      //                                              itemCount: statusOptions.length,
      //                                              itemBuilder: (BuildContext context, int childIndex) {
      //                                                return InkWell(
      //                                                  onTap: () {
      //                                                    print(index);
      //                                                    print(statusOptions[childIndex]);
      //                                                    setState(() {
      //                                                      statusList[index] = statusOptions[childIndex];
      //                                                      isStatus[index] = false;
      //                                                    });
      //                                                  },
      //                                                  child: Container(
      //                                                      padding: EdgeInsets.only(left: 8, right: 8, bottom: 4, top: 4),
      //                                                      width: MediaQuery.of(context).size.width * 0.19,
      //                                                      alignment: Alignment.center,
      //                                                      decoration: BoxDecoration(
      //                                                          color: AppColors.bgGreen,
      //                                                          borderRadius: BorderRadius.circular(4)
      //                                                      ),
      //                                                      // padding: EdgeInsets.only(left: 8, right: 8, bottom: 4,top: 4),
      //                                                      child: Text(statusOptions[childIndex], style: fontStyle50012(AppColors.bgWhite),)),
      //                                                );
      //                                              }),
      //                                        ),
      //                                      )
      //                                    ],
      //                                  )
      //                                ],
      //                              ),
      //                            )
      //                          ],
      //                        );
      //                      }),
      //                )
      //              ],
      //            ),
      //          ),
      //          const SizedBox(height: 24,),
      //          ////////////Elevated Submit Button///////////////////////
      //          Container(
      //            child: ElevatedButton(
      //              style: ElevatedButton.styleFrom(
      //                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      //                  padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12)
      //              ),
      //              onPressed: () {
      //                //printValues();
      //                veriftStoreDetails();
      //                //goToNextStep();
      //                for (int i = 0; i < drivers.length; i++) {
      //                  print("Driver $i: Name: ${drivers[i].name}, Last Name: ${drivers[i].lastName}");
      //                }
      //              },
      //              child: Row(
      //                mainAxisAlignment: MainAxisAlignment.center,
      //                children: [
      //                  Text("Submit", style: fontStyle60016(AppColors.bgWhite),),
      //                ],
      //              ),
      //            ),
      //          ),
      //        ],
      //      ),
      //       ///////////////////////////////Services Registration////////////////////////
      //       if(category == "Services")
      //       Column(
      //         children: [
      //           Container(
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 const Text("Type of Services*"),
      //                 const SizedBox(height: 4,),
      //                 InkWell(
      //                   onTap: (){
      //                     setState(() {
      //                       isService = !isService;
      //                     });
      //                   },
      //                   child: Container(
      //                     padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      //                     decoration: BoxDecoration(
      //                         borderRadius: BorderRadius.circular(8),
      //                         border: Border.all()
      //                     ),
      //                     child: Row(
      //                       mainAxisAlignment:  MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         Expanded(child: Text(selectedServices.isEmpty ? "Select here" : "${selectedServices.join(", ")}")),
      //                         const Icon(Icons.expand_more)
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 Visibility(
      //                   visible: isService,
      //                   child: Container(
      //                     child: ListView.builder(
      //                         shrinkWrap: true,
      //                         itemCount: services.length,
      //                         itemBuilder: (BuildContext context, int index) {
      //                           final isSelected = selectedServices.contains(services[index]);
      //
      //                           return InkWell(
      //                             onTap: () {
      //                               print("jhdvsbfcjkadn--->...$index");
      //                               setState(() {
      //                                 if (isSelected) {
      //                                   selectedServices.remove(services[index]);
      //                                 } else {
      //                                   selectedServices.add(services[index]);
      //                                 }
      //                               });
      //                               print(selectedServices[index]);
      //                               print(selectedServices.length);
      //                             },
      //                             child: Column(
      //                               children: [
      //                                 Container(
      //                                   padding: const EdgeInsets.all(16),
      //                                   alignment: Alignment.topLeft,
      //                                   decoration: BoxDecoration(
      //                                       border: Border.all(),
      //                                       borderRadius: BorderRadius.circular(8)
      //                                   ),
      //                                   //child: Text(products[index]))
      //                                   child: Row(
      //                                     children: [
      //                                       Expanded(
      //                                         child: Text(
      //                                           services[index],
      //                                           style: TextStyle(
      //                                             fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      //                                           ),
      //                                         ),
      //                                       ),
      //                                       if (isSelected)
      //                                         const Icon(
      //                                           Icons.check,
      //                                           color: Colors.green,
      //                                         ),
      //                                     ],
      //                                   ),)
      //                               ],
      //                             ),
      //                           );
      //                         }),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //
      //           textFormField("Mobile number *", "Enter your Mobile Number",postalCodeController),
      //           textFormField("Alternate number *", "Enter your Alt Number",postalCodeController),
      //           textFormField("Email *", "Enter your mail id",postalCodeController),
      //           Padding(
      //             padding: const EdgeInsets.only(top: 16),
      //             child: Text("Address", style: fontStyleHeading(AppColors.bgBlack),),
      //           ),
      //           textFormField("Country *", "Country",postalCodeController),
      //           textFormField("State *", "state",postalCodeController),
      //           textFormField("City *", "City",postalCodeController),
      //           textFormField("Area *", "area...",postalCodeController),
      //           textFormField("Street Name*", "Street name...",postalCodeController),
      //           textFormField("Building Name", "Building name...",postalCodeController),
      //           textFormField("Floor ", "Floor...",postalCodeController),
      //           textFormField("Door No*", "door No...",postalCodeController),
      //           textFormField("PinCode*", " pincode...",postalCodeController),
      //
      //           const SizedBox(height: 24,),
      //           ////////////Elevated Submit Button///////////////////////
      //           Container(
      //             child: ElevatedButton(
      //               style: ElevatedButton.styleFrom(
      //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      //                   padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12)
      //               ),
      //               onPressed: () {
      //                 //printValues();
      //                 goToNextStep();
      //                 for (int i = 0; i < drivers.length; i++) {
      //                   print("Driver $i: Name: ${drivers[i].name}, Last Name: ${drivers[i].lastName}");
      //                 }
      //               },
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Text("Submit", style: fontStyle60016(AppColors.bgWhite),),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // );
    }

    Widget buildBankDetailForm() {


      return  Container(
        padding: EdgeInsets.all(16),
        child:   Column(
          children: [
            textFormField("Account Holder Name  *", "Enter Account Holder Number",accountHolderName),
            textFormField("Account Number  *", "Enter your Account Number",accountNumber),
            bankList(),
            //Container(child: textFormField("Bank Name number *", "Enter Bank Name",bankName)),
            // Container(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(top: 16),
            //         child: Text("Bank Name *", style: fontStyle50012(AppColors.bgBlack),),
            //       ),
            //       const SizedBox(height: 4,),
            //       Column(
            //         children: [
            //           Container(
            //             decoration: BoxDecoration(
            //                 border: Border.all(),
            //                 borderRadius: BorderRadius.circular(8)
            //             ),
            //             child:
            //             TextFormField(
            //               controller: bankNameController,
            //               decoration: InputDecoration(
            //                   hintText: "Enter Bank Name",
            //                   border: InputBorder.none,
            //                   contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            //                   suffixIcon: InkWell(
            //                     onTap: () {
            //                       print(isBankVisible);
            //                      setState(() {
            //                        isBankVisible = !isBankVisible;
            //                      });
            //                     },
            //                     child: Icon(
            //                       Icons.expand_more,
            //                     ),
            //                   )
            //               ),
            //             ),
            //           ),
            //           Visibility(
            //             visible: isBankVisible,
            //             child: Container(
            //               child: ListView.builder(
            //                   shrinkWrap: true,
            //                   //itemCount: products.length,
            //                   physics: ClampingScrollPhysics(),
            //                   itemCount: value.bankData.bankList.length,
            //                   itemBuilder: (BuildContext context, int index) {
            //                     var banks = value.bankData.bankList[index];
            //                     // final isSelected = selectedProducts.contains(banks.bankName);
            //                     return InkWell(
            //                       onTap: () {
            //                         print("jhdvsbfcjkadn--->...$index");
            //                         setState(() {
            //                           bankNameController.text = banks.bankName;
            //                           //isBank = false;
            //                           // if (isSelected) {
            //                           //   selectedProducts.remove(banks.bankName);
            //                           // } else {
            //                           //   selectedProducts.add(banks.bankName);
            //                           // }
            //                         });
            //                         print(selectedProducts[index]);
            //                         print(selectedProducts.length);
            //                       },
            //                       child: Column(
            //                         children: [
            //                           Container(
            //                             padding: const EdgeInsets.all(16),
            //                             alignment: Alignment.topLeft,
            //                             decoration: BoxDecoration(
            //                                 border: Border.all(),
            //                                 borderRadius: BorderRadius.circular(8)
            //                             ),
            //                             //child: Text(products[index]))
            //                             child: Row(
            //                               children: [
            //                                 Expanded(
            //                                   child: Text(
            //                                     banks.bankName,
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),)
            //                         ],
            //                       ),
            //                     );
            //                   }),
            //             ),
            //           )
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            textFormField("City *", "Enter here",bankCityName),
            textFormField("Branch *", "Enter Branch here",branchName),
            textFormField("IFSC Code *", "Enter IFSC Code here",ifscCodeController),

            const SizedBox(height: 24,),
            ////////////Elevated Submit Button///////////////////////
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12)
                ),
                onPressed: () {
                  //printValues();
                  //goToNextStep();
                  bankDetailsRegistration();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Submit", style: fontStyle60016(AppColors.bgWhite),),
                  ],
                ),
              ),
            ),
          ],
        ),
      );


      //   Container(
      //   padding: EdgeInsets.all(16),
      //   child:   Column(
      //     children: [
      //       textFormField("Account Holder Name  *", "Enter Account Holder Number",accountHolderName),
      //       textFormField("Account Number  *", "Enter your Account Number",accountNumber),
      //       //Container(child: textFormField("Bank Name number *", "Enter Bank Name",bankName)),
      //     Container(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.only(top: 16),
      //             child: Text("Bank Name *", style: fontStyle50012(AppColors.bgBlack),),
      //           ),
      //           const SizedBox(height: 4,),
      //           Column(
      //             children: [
      //               Container(
      //                 decoration: BoxDecoration(
      //                     border: Border.all(),
      //                     borderRadius: BorderRadius.circular(8)
      //                 ),
      //                 child: TextFormField(
      //                   controller: bankName,
      //                   decoration: InputDecoration(
      //                       hintText: "Enter Bank Name",
      //                       border: InputBorder.none,
      //                       contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      //                       suffixIcon: IconButton(
      //                       onPressed: () {},
      //                       icon: Icon(Icons.expand_more),
      //                     )
      //                   ),
      //                 ),
      //               ),
      //               Visibility(
      //                 visible: isBank,
      //                 child: Container(
      //                   child: ListView.builder(
      //                       shrinkWrap: true,
      //                       //itemCount: products.length,
      //                       itemCount: value.categoryData.categories.length,
      //                       itemBuilder: (BuildContext context, int index) {
      //                         var products = value.categoryData.categories[index];
      //                         final isSelected = selectedProducts.contains(products.categoryName);
      //
      //
      //                         return InkWell(
      //                           onTap: () {
      //                             print("jhdvsbfcjkadn--->...$index");
      //                             setState(() {
      //                               if (isSelected) {
      //                                 selectedProducts.remove(products.categoryName);
      //                               } else {
      //                                 selectedProducts.add(products.categoryName);
      //                               }
      //                             });
      //                             print(selectedProducts[index]);
      //                             print(selectedProducts.length);
      //                           },
      //                           child: Column(
      //                             children: [
      //                               Container(
      //                                 padding: const EdgeInsets.all(16),
      //                                 alignment: Alignment.topLeft,
      //                                 decoration: BoxDecoration(
      //                                     border: Border.all(),
      //                                     borderRadius: BorderRadius.circular(8)
      //                                 ),
      //                                 //child: Text(products[index]))
      //                                 child: Row(
      //                                   children: [
      //                                     Expanded(
      //                                       child: Text(
      //                                         products.categoryName,
      //                                         style: TextStyle(
      //                                           fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      //                                         ),
      //                                       ),
      //                                     ),
      //                                     if (isSelected)
      //                                       const Icon(
      //                                         Icons.check,
      //                                         color: Colors.green,
      //                                       ),
      //                                   ],
      //                                 ),)
      //                             ],
      //                           ),
      //                         );
      //                       }),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //       textFormField("City *", "Enter here",bankCityName),
      //       textFormField("Branch *", "Enter Branch here",branchName),
      //       textFormField("IFSC Code *", "Enter IFSC Code here",ifscCodeController),
      //
      //       const SizedBox(height: 24,),
      //       ////////////Elevated Submit Button///////////////////////
      //       Container(
      //         child: ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      //               padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12)
      //           ),
      //           onPressed: () {
      //             //printValues();
      //             goToNextStep();
      //           },
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Text("Submit", style: fontStyle60016(AppColors.bgWhite),),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // );
    }


    Widget buildStepForm(int step) {
      switch (step) {
        case 0:
          return buildProfileForm();
        case 1:
          return buildStoreForm();
        case 2:
          return buildBankDetailForm();
        default:
          return const SizedBox.shrink();
      }
    }

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 16, bottom: 16),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text("Registration "),
                  const SizedBox(height: 10,),
                  FormStepper(
                    items: item3,
                    selectedColor: AppColors.bgGreen,
                    unSelectedColor: AppColors.grey,
                    inProcess: currentStep,
                    menuTitleSize: 12,
                    height: 90,
                    onItemClicked: (index){
                      setState(() {
                        currentStep = index;
                      });
                    print('ClickedIndex'+index.toString());
                  },
                  ),
                  const SizedBox(height: 20,),
                  buildStepForm(currentStep),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


