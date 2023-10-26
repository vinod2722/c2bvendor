// // // import 'package:flutter/material.dart';
// // // import 'package:multi_image_picker_view/multi_image_picker_view.dart';
// // //
// // //
// // // class DemoPage extends StatefulWidget {
// // //   const DemoPage({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   State<DemoPage> createState() => _DemoPageState();
// // // }
// // //
// // // class _DemoPageState extends State<DemoPage> {
// // //   final controller = MultiImagePickerController(
// // //     maxImages: 10,
// // //     withReadStream: true,
// // //     allowedImageTypes: ['png', 'jpg', 'jpeg'],
// // //   );
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return SizedBox(
// // //       width: double.infinity,
// // //       child: Column(
// // //         children: [
// // //           MultiImagePickerView(
// // //             onChange: (list) {
// // //               debugPrint(list.toString());
// // //             },
// // //             controller: controller,
// // //             padding: const EdgeInsets.all(10),
// // //           ),
// // //           const SizedBox(height: 32),
// // //           //const CustomExamples()
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     controller.dispose();
// // //     super.dispose();
// // //   }
// // // }
// //
// //
// //
// // import 'dart:io';
// //
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:http/http.dart' as http;
// //
// //
// // class Home extends  StatefulWidget {
// //   @override
// //   State<Home> createState() => _HomeState();
// // }
// //
// //
// // class _HomeState extends State<Home> {
// //   final ImagePicker imgpicker = ImagePicker();
// //   List<XFile>? imagefiles;
// //
// //   openImages() async {
// //     try {
// //       var pickedfiles = await imgpicker.pickMultiImage();
// //       if (pickedfiles != null) {
// //         setState(() {
// //           imagefiles = pickedfiles;
// //         });
// //       } else {
// //         print("No image is selected.");
// //       }
// //     } catch (e) {
// //       print("error while picking file.");
// //     }
// //   }
// //
// //   // Function to send selected images to API
// //   Future<void> sendImagesToApi() async {
// //     if (imagefiles == null || imagefiles!.isEmpty) {
// //       print("No images to send.");
// //       return;
// //     }
// //
// //     List<File> files = imagefiles!.map((xfile) => File(xfile.path)).toList();
// //
// //     try {
// //       var uri = Uri.parse('YOUR_API_ENDPOINT'); // Replace with your API endpoint
// //       var request = http.MultipartRequest('POST', uri);
// //
// //       for (var file in files) {
// //         var stream = http.ByteStream.fromBytes(await file.readAsBytes());
// //         var length = await file.length();
// //
// //         var multipartFile = http.MultipartFile(
// //           'images', // Replace with the field name expected by your API
// //           stream,
// //           length,
// //           filename: basename(file.path),
// //         );
// //
// //         request.files.add(multipartFile);
// //       }
// //
// //       var response = await request.send();
// //       if (response.statusCode == 200) {
// //         print('Images uploaded successfully.');
// //       } else {
// //         print('Failed to upload images. Status code: ${response.statusCode}');
// //       }
// //     } catch (e) {
// //       print('Error uploading images: $e');
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // ... Your existing code ...
// //
// //       // ElevatedButton(
// //       //   onPressed: () {
// //       //     openImages();
// //       //   },
// //       //   child: Text("Open Images"),
// //       // ),
// //
// //       // ElevatedButton(
// //       //   onPressed: () {
// //       //     sendImagesToApi();
// //       //   },
// //       //   child: Text("Send Images to API"),
// //       // ),
// //
// //       // ... Your existing code ...
// //     );
// //   }
// // }
// //////////////Permission Denied is coming//////////////////
//
//
// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import 'package:multiple_images_picker/multiple_images_picker.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   List<Asset> images = <Asset>[];
//   String _error = 'No Error Dectected';
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Widget buildGridView() {
//     return GridView.count(
//       crossAxisCount: 3,
//       children: List.generate(images.length, (index) {
//         Asset asset = images[index];
//         return AssetThumb(
//           asset: asset,
//           width: 300,
//           height: 300,
//         );
//       }),
//     );
//   }
//
//   Future<void> loadAssets() async {
//     List<Asset> resultList = <Asset>[];
//     String error = 'No Error Detected';
//
//     try {
//       resultList = await MultipleImagesPicker.pickImages(
//         maxImages: 300,
//         enableCamera: true,
//         selectedAssets: images,
//         cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
//         materialOptions: MaterialOptions(
//           actionBarColor: "#abcdef",
//           actionBarTitle: "Example App",
//           allViewTitle: "All Photos",
//           useDetailsView: false,
//           selectCircleStrokeColor: "#000000",
//         ),
//       );
//     } on Exception catch (e) {
//       error = e.toString();
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       images = resultList;
//       _error = error;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Column(
//           children: <Widget>[
//             Center(child: Text('Error: $_error')),
//             ElevatedButton(
//               child: Text("Pick images"),
//               onPressed: loadAssets,
//             ),
//             Expanded(
//               child: buildGridView(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }



