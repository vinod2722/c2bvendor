import 'package:c2b_vendor/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

//
// class BannerUploadingPage extends StatefulWidget {
//   const BannerUploadingPage({super.key});
//
//   @override
//   State<BannerUploadingPage> createState() => _BannerUploadingPageState();
// }
//
// class _BannerUploadingPageState extends State<BannerUploadingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text("Banner",style: fontStyle60016(AppColors.bgBlack), ),
//         centerTitle: true,
//         leading: Icon(Icons.arrow_back, color: AppColors.bgBlack,),
//         actions: [
//           Image.asset("assets/images/FAQ.png")
//         ],
//       ),
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.only(bottom: 10),
//                 alignment: Alignment.topLeft,
//                   child: Text("App banners", style: fontStyle60016(AppColors.bgBlack),)),
//               DottedBorder(
//                 borderType: BorderType.RRect,
//                 radius: Radius.circular(24),
//                 strokeWidth: 1,
//                 dashPattern: [12, 10],
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   //padding: EdgeInsets.only(top: 68, bottom: 68, right: 10, left: 10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(24),
//                   ),
//                   child:
//                   Icon(Icons.add_a_photo),
//                   //Image.asset("assets/images/Banner.png")
//                 ),
//               ),
//               const SizedBox(height: 24,),
//               Container(
//                   padding: EdgeInsets.only(bottom: 10),
//                   alignment: Alignment.topLeft,
//                   child: Text("Web banners", style: fontStyle60016(AppColors.bgBlack),)),
//               DottedBorder(
//                 borderType: BorderType.RRect,
//                 radius: Radius.circular(24),
//                 strokeWidth: 1,
//                 dashPattern: [12, 10],
//                 child: Container(
//                   //width: MediaQuery.of(context).size.width,
//                   //padding: EdgeInsets.only(top: 68, bottom: 68, right: 10, left: 10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(24),
//                   ),
//                   child:
//                   Icon(Icons.add_a_photo),
//                   //Image.asset("assets/images/Banner.png")
//                 ),
//               ),
//               const SizedBox(height: 24,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                         onPressed: (){},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.bgBlack,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(24), // Adjust the radius as needed
//                           ),
//                             padding: EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10)
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text("View", style: fontStyleHeading(AppColors.bgWhite),),
//                             const SizedBox(width: 8,),
//                             Icon(Icons.remove_red_eye_outlined)
//                           ],
//                         )
//                     ),
//                   ),
//                   const SizedBox(width: 12,),
//                   Expanded(
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.headerGradient2,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(24), // Adjust the radius as needed
//                         ),
//                         padding: EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10)
//                       ),
//                         onPressed: (){},
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text("Get Approval", style: fontStyleHeading(AppColors.bgWhite),),
//                             const SizedBox(width: 4,),
//                             Icon(Icons.arrow_forward)
//                           ],
//                         )
//                     ),
//                   ),
//
//                 ],
//               ),
//               const SizedBox(height: 10,),
//               Container(
//                 alignment: Alignment.topLeft,
//                 child: Text("Recent Banners"),
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.2,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   shrinkWrap: true,
//                   itemCount: 5,
//                     itemBuilder: (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.asset('assets/images/Banner.png'),
//                   );
//                 }),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  Future<void> loadBanners() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProviderVendor>(context, listen: false).getBanners(token);
    });
  }

  final LocalStorage userToken = LocalStorage('user_token');
  late String token = '';

  File? _imageFile1;
  String? _fileName1;
  File? _imageFile2;
  String? _fileName2;

  void _removeImage(int imageNumber) {
    setState(() {
      if (imageNumber == 1) {
        _imageFile1 = null;
        _fileName1 = null;
      } else if (imageNumber == 2) {
        _imageFile2 = null;
        _fileName2 = null;
        loadBanners();
      }
    });
  }

  // Function to pick an image from the device's gallery
  Future<void> _pickImage(int imageNumber) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (imageNumber == 1) {
          _imageFile1 = File(pickedFile.path);
          _fileName1 = _imageFile1!.path.split('/').last;
        } else if (imageNumber == 2) {
          _imageFile2 = File(pickedFile.path);
          _fileName2 = _imageFile2!.path.split('/').last;
        }
      });
    }
  }

///////////////Trail And Error method/////////////////

  // Future<void> _uploadImageTrail( File? appImageFileName,  File? webImageFileName, bool active, String authToken) async {
  //   if (appImageFileName == null || webImageFileName == null) {
  //     // Handle case when one or both images are not selected
  //     return;
  //   }
  //
  //   final url = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/add-banner'); // Replace with your API endpoint
  //   final headers = <String, String>{
  //     'Authorization': 'Bearer $authToken',
  //     'Content-Type': 'application/json', // Set content type to JSON
  //   };
  //
  //
  //
  //   final Map<String, dynamic> jsonBody = {
  //     'active': active,
  //     'app_image': appImageFileName,
  //     'web_image': webImageFileName,
  //   };
  //
  //   final response = await http.post(
  //     url,
  //     headers: headers,
  //     body: json.encode(jsonBody), // Convert the JSON map to a string
  //   );
  //
  //   print(jsonBody);
  //   print(
  //       "ImageData : ${response.statusCode} :  ${response.request} : ${response.body} ");
  //
  //   // Check the response
  //   if (response.statusCode == 200) {
  //     // Handle a successful response from your API
  //     print('Images uploaded successfully');
  //   } else {
  //     // Handle errors
  //     print('Image upload failed with status code: ${response.statusCode}');
  //   }
  // }
  //Function to upload an image and send the filename to the API
  Future<void> _uploadImage(
      File? appImageFile,
      String? appImageFileName,
      File? webImageFile,
      String? webImageFileName,
      bool active,
      String authToken) async {
    if (appImageFile == null || webImageFile == null) {
      // Handle case when one or both images are not selected
      return;
    }

    final url = Uri.parse(
        'https://close2buy-dev.jurysoftprojects.com/api/add-banner'); // Replace with your API endpoint
    final request = http.MultipartRequest('POST', url);

    // Add headers
    request.headers['Authorization'] = '$authToken';

    // Create MultipartFile objects from image files
    final appImage = http.MultipartFile(
      'app_image',
      appImageFile.readAsBytes().asStream(),
      appImageFile.lengthSync(),
      filename: appImageFileName,
    );

    final webImage = http.MultipartFile(
      'web_image',
      webImageFile.readAsBytes().asStream(),
      webImageFile.lengthSync(),
      filename: webImageFileName,
    );

    // Add MultipartFile objects to the request
    request.files.add(appImage);
    request.files.add(webImage);

    // Add other data to the request body
    request.fields['active'] = active.toString();

    // Send the request
    final response = await request.send();

    // Convert and print the response body
    final responseBody = await response.stream.bytesToString();
    print('Response Body: $responseBody');

    if (response.statusCode == 200) {
      // Handle a successful response from your API
      print('Images uploaded successfully');
      _removeImage(1);
      _removeImage(2);
    } else {
      // Handle errors
      print('Image upload failed with status code: ${response.statusCode}');
    }
  }

  ///////////Some what developed API/////////////
  // Future<void> bankDetailsRegistration(
  //     String app_image,
  //     String web_image,
  //     ) async {
  //   // Define the base API endpoint URL
  //   final baseUrl = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/vendor-bank-details');
  //   final request = http.MultipartRequest('POST', baseUrl);
  //
  //   // final requestBody =
  //   // {
  //   //   "active": true,
  //   //   "app_image": ,
  //   //   "web_image": ,
  //   //
  //   //
  //   // };
  //
  //   final imageFile1 = http.MultipartFile(
  //     'app_image',
  //     _imageFile1!.readAsBytes().asStream(),
  //     _imageFile1!.lengthSync(),
  //     filename: _fileName1,
  //   );
  //
  //   final imageFile2 = http.MultipartFile(
  //     'web_image',
  //     _imageFile2!.readAsBytes().asStream(),
  //     _imageFile2!.lengthSync(),
  //     filename: _fileName2,
  //   );
  //
  //   request.fields['active'] = "true";
  //   //request.fields['app_image'] = email;
  //   if (app_image.isNotEmpty) {
  //     request.files.add(
  //         await http.MultipartFile.fromPath("app_image", _fileName1!));
  //   }
  //   if (web_image.isNotEmpty) {
  //   request.files.add(
  //   await http.MultipartFile.fromPath("web_image", _fileName2!));
  //   }
  //
  //
  //   // Encode the request body as JSON
  //   // final jsonBody = jsonEncode(requestBody);
  //   // //final jsonBody = (requestBody);
  //   //
  //   // print(requestBody);
  //   //
  //   // //Define the headers for the request
  //   // final headers = {
  //   //   'Content-Type': 'application/json',
  //   // };
  //   // try {
  //   //   final response = await http.post(
  //   //     baseUrl,
  //   //     headers: headers,
  //   //     body: jsonBody,
  //   //   );
  //   var response = await http.Response.fromStream(await request.send());
  //     if (response.statusCode == 200) {
  //       // Registration was successful
  //       final jsonResponse = json.decode(response.body);
  //
  //       //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  HomePage()));
  //
  //       print('Response: ${response.body}');
  //     } else {
  //       print('Registration failed with status code ${response.statusCode}');
  //       print('Response: ${response.body}');
  //     }
  //   } catch (error) {
  //     print('Error: $error');
  //   }
  //   //return null;
  // }

///////////////BAckUp@///////////
//   Future<void> _uploadImages() async {
//     if (_imageFile1 == null || _imageFile2 == null) {
//       // Handle case when one or both images are not selected
//       return;
//     }
//
//     final url = Uri.parse('YOUR_API_ENDPOINT_HERE'); // Replace with your API endpoint
//     final request = http.MultipartRequest('POST', url);
//
//     // Create MultipartFile objects from your image files
//     final imageFile1 = http.MultipartFile(
//       'app_image',
//       _imageFile1!.readAsBytes().asStream(),
//       _imageFile1!.lengthSync(),
//       filename: _fileName1,
//     );
//
//     final imageFile2 = http.MultipartFile(
//       'web_image',
//       _imageFile2!.readAsBytes().asStream(),
//       _imageFile2!.lengthSync(),
//       filename: _fileName2,
//     );
//
//     // Add MultipartFile objects to the request
//     request.files.add(imageFile1);
//     request.files.add(imageFile2);
//
//     // Add other data to the request body
//     request.fields['active'] = 'true';
//     //request.fields['bank_id'] = bankId; // Assuming bankId is a variable with the value you want to include
//
//
//     // Print the request headers and body
//     print('Request Headers: ${request.headers}');
//     print('Request Body: ${await request.finalize().bytesToString()}');
//
//     // Send the request
//     // final response = await http.Response.fromStream(await request.send());
//     //
//     //
//     // if (response.statusCode == 200) {
//     //   // Handle a successful response from your API
//     //   print('Images uploaded successfully');
//     // } else {
//     //   // Handle errors
//     //   print('Image upload failed with status code: ${response.statusCode}');
//     // }
//
//   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    token = userToken.getItem('token');
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    loadBanners();

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upload Example'),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back, color: AppColors.bgBlack,),
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ///////////////////////To display image////////////////

            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _pickImage(1),
                    child: Text('Add Mobile Banner'),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(_fileName1 ?? ""),
                    ),
                  ),
                  if (_imageFile1 != null)
                    IconButton(
                        onPressed: () {
                          _removeImage(1);
                        },
                        icon: Icon(Icons.close))
                ],
              ),
            ),
            // if (_imageFile1 != null)
            //   Image.file(
            //     _imageFile1!,
            //     height: 200,
            //     width: 200,
            //   ),
            //
            // if (_imageFile1 != null)
            //   Image.file(
            //     _imageFile1!,
            //     height: 200,
            //     width: 200,
            //   ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _pickImage(2),
                    child: Text('Add Web Banner'),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(_fileName2 ?? ""),
                    ),
                  ),
                  if (_imageFile2 != null)
                    IconButton(
                        onPressed: () {
                          _removeImage(2);
                        },
                        icon: Icon(Icons.close))
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.headerGradient2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24))),
                //onPressed: () => _uploadImage(_fileName1, _fileName2, true, ),
                onPressed: () => _uploadImage(
                  _imageFile1,
                  _fileName1,
                  _imageFile2,
                  _fileName2,
                  true,
                  token,
                ),
                //   onPressed: () => _uploadImageTrail(
                //     _imageFile1,
                //     _imageFile2,
                //     true,
                //     token,
                //   ),

                child: Text('Get An Approval'),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () => _uploadImage(_imageFile2, _fileName2),
            //   child: Text('Upload Image 2'),
            // ),

            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent Banners"),
                  TextButton(onPressed: () {}, child: Text("More"))
                ],
              ),
            ),

            Consumer<ProviderVendor>(builder: (context, value, child) {
              if (identical(value.isBannerLoading, "NOT_STARTED") ||
                  identical(value.isBannerLoading, "LOADING")) {
                return CircularProgressIndicator();
              }
              return Container(
                height: MediaQuery.of(context).size.height * 0.18,
                // width: MediaQuery.of(context).size.width * 0.7,
                //width: 100,
                //height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: value.bannerData.banners.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AspectRatio(
                              aspectRatio: 16 / 7,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    value
                                        .bannerData.banners[index].appBannerUrl,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          Positioned(
                              top: 0,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: value.bannerData.banners[index].approve == 0 ? AppColors.headerGradient2 : AppColors.bgGreen,
                                  shape: BoxShape.circle,
                                ),
                              ))
                        ],
                      );
                    }),
              );
            })
          ],
        ),
      ),
    );
  }
}
