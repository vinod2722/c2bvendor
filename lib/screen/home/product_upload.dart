
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:c2b_vendor/common/Colors.dart';
import 'package:c2b_vendor/common/widgets.dart';
import 'package:c2b_vendor/screen/home/view_all_products.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localstorage/localstorage.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;


import '../../providers/providers.dart';

class ProductUploadPage extends StatefulWidget {
  const ProductUploadPage({super.key});

  @override
  State<ProductUploadPage> createState() => _ProductUploadPageState();
}

class _ProductUploadPageState extends State<ProductUploadPage> {

  int? id;
  String? table_name;
  String? catName;
  int? sub_id;

  //////////Uploading product without image.///////////////
  Future<void> uploadProductData() async  {
    var baseUrl = Uri.parse("https://close2buy-dev.jurysoftprojects.com/api/add-product-without-images");
    var client = http.Client;
    // final  headers = {
    //   'Content-Type': 'application/json',
    //   'authorization': token,
    // };

   final  categoryDat =  {
    "id": id,
    "category_name": catName,
    "table_name": table_name
    };

   //final catString = jsonDecode(categoryDat);

    final Map<String, dynamic> requestBody =
    {
      "name": nameController.text,
      "description": descriptionController.text,
      "total_price": totalPriceController.text,
      "compare_price": comapareController.text,
      "gst": gstController.text,
      "food_type": null,
      "negociation": isNegotiationAccepted,
      "tags": "string",
      "free_delivery": isFreeDeliveryAccepted,
      "free_delivery_if_more": freeDeliveryRangeController.text,
      "category": categoryDat,
      "sub_categories": null,
      "exchange_available": isExchangeAccepted,
      "exchange_policy": exchangePolicyController.text,
      "cancellation_available": isCancellationAccepted,
      "cancellation_policy": cancellationController.text,
      "size": sizeController.text,
      "color": colorController.text,
      //"weight": weightController.text,
      "stock": stockController.text
    };
    final jsonBody = jsonEncode(requestBody);
    print(jsonBody);
    print(jsonBody.toString());


    var response = await http.post(baseUrl, headers: <String, String> {
      'Content-Type': 'application/json',
      'authorization' : token,
    } , body:jsonBody,
    );
    print(
        "Product Data : ${response.statusCode} :  ${response.request} : ${response.body} ");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      final id = jsonResponse['created_product']['id'];
      Fluttertoast.showToast(msg: errorMessage);
      print(id);
      uploadProductToSubCat(token, id);
      _uploadImages(token,id);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  goToNextStep()));
      //return response.body;

    } else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);
      //return "";
    }
  }


/////Adding product to sub-category////////////////////////
  Future<void> uploadProductToSubCat(String token, int id) async  {
    var baseUrl = Uri.parse("https://close2buy-dev.jurysoftprojects.com/api/add-products-to-sub-category-for-vendor");
    var client = http.Client;

    Map<String, dynamic> requestData = {
      "products": [
        {
          "product_id": id,
          "category_id": id,
          "category_name": catName,
          "sub_category_id": sub_id,
          "active": true
        }
      ]
    };
    final jsonBody = jsonEncode(requestData);

    print(jsonBody);
    print(jsonBody.toString());


    var response = await http.post(baseUrl, headers: <String, String> {
      'Content-Type': 'application/json',
      'authorization' : token,
    } , body:jsonBody,
    );
    print(
        "Product Data : ${response.statusCode} :  ${response.request} : ${response.body} ");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);

      //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  goToNextStep()));
      //return response.body;

    } else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);
      //return "";
    }
  }
  /////////////////Upload Food withoutImages///////////
  Future<void> uploadFoodData() async  {
    var baseUrl = Uri.parse("https://close2buy-dev.jurysoftprojects.com/api/add-food-without-images");
    var client = http.Client;
    // final  headers = {
    //   'Content-Type': 'application/json',
    //   'authorization': token,
    // };

    final  categoryDat =  {
      "id": id,
      "category_name": catName,
      "table_name": table_name
    };

    //final catString = jsonDecode(categoryDat);

    final Map<String, dynamic> requestBody =
    {
      "name": nameController.text,
      "description": descriptionController.text,
      "total_price": totalPriceController.text,
      "compare_price": comapareController.text,
      "gst": gstController.text,
      "food_type": null,
      //"negociation": isNegotiationAccepted,
      "tags": "string",
      "free_delivery": isFreeDeliveryAccepted,
      "free_delivery_if_more": null,
      "category": categoryDat,
      "sub_categories": null,
      // "exchange_available": isExchangeAccepted,
      // "exchange_policy": exchangePolicyController.text,
      // "cancellation_available": isCancellationAccepted,
      // "cancellation_policy": cancellationController.text,
       "size": "string",
      // "color": colorController.text,
      //"weight": weightController.text,
      //"stock": stockController.text
      "available" : true,
    };
    final jsonBody = jsonEncode(requestBody);
    print(jsonBody);
    print(jsonBody.toString());


    var response = await http.post(baseUrl, headers: <String, String> {
      'Content-Type': 'application/json',
      'authorization' : token,
    } , body:jsonBody,
    );
    print(
        "Product Data : ${response.statusCode} :  ${response.request} : ${response.body} ");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      final id = jsonResponse['created_product']['id'];
      Fluttertoast.showToast(msg: errorMessage);
      print(id);
      uploadProductToSubCat(token, id);
      _uploadImages(token,id);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  goToNextStep()));
      //return response.body;

    } else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);
      //return "";
    }
  }





  // File? _imageFile1;
  // String? _fileName1;
  // File? _imageFile2;
  // String? _fileName2;
  //
  //
  // Future<void> _pickImage(int imageNumber) async {
  //   final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  //
  //   if (pickedFile != null) {
  //     setState(() {
  //       if (imageNumber == 1) {
  //         _imageFile1 = File(pickedFile.path);
  //         _fileName1 = _imageFile1!.path.split('/').last;
  //       } else if (imageNumber == 2) {
  //         _imageFile2 = File(pickedFile.path);
  //         _fileName2 = _imageFile2!.path.split('/').last;
  //       }
  //     });
  //   }
  // }

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController totalPriceController = TextEditingController();
  TextEditingController comapareController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  TextEditingController exchangePolicyController = TextEditingController();
  TextEditingController cancellationController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController freeDeliveryRangeController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  bool isNegotiationAccepted = false;
  bool isFreeDeliveryAccepted = false;
  bool isExchangeAccepted = false;
  bool isCancellationAccepted = false;

  List<String> dynamicallyGeneratedItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8'
  ];

  final List<String> categories = [
    "Products",
    "Food",
  ];

  bool isCategory = false;
  bool isSubCategory = false;
  String category = "Select here"; // Initial text
  String subCategory = "Select here"; // Initial text

  final LocalStorage userToken = LocalStorage('user_token');
  late String token = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    token = userToken.getItem('token');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProviderVendor>(context, listen: false)
          .getSelectedCategory(token);

    });

  }


  List<File> images = [];


  final controller = MultiImagePickerController(
    maxImages: 8,
    withReadStream: true,
    allowedImageTypes: ['png', 'jpg', 'jpeg'],
  );
  // final controller = MultiImagePickerController(
  //   maxImages: 8,
  //   withReadStream: true,
  //   allowedImageTypes: ['png', 'jpg', 'jpeg'],
  // );
  //
  // final controller = MultiImagePickerController(
  //   maxImages: 8,
  //   withReadStream: true,
  //   allowedImageTypes: ['png', 'jpg', 'jpeg'],
  // );

  // void uploadImagesToApi(List<ImageFile> selectedImages) async {
  //   var uri = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/add-product-images');
  //
  //   var request = http.MultipartRequest('POST', uri);
  //
  //   for (var image in selectedImages) {
  //     var file = await http.MultipartFile.fromPath('images', image.path);
  //     request.files.add(file);
  //   }
  //
  //   var response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     print("Images uploaded successfully!");
  //   } else {
  //     print("Failed to upload images. Status code: ${response.statusCode}");
  //   }
  // }


  Future<void> _uploadImages( String authToken, int idRes) async {
    final url = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/add-product-images'); // Replace with your API endpoint
    final request = http.MultipartRequest('POST', url);

    // Add headers
    request.headers['Authorization'] = '$authToken';

    // Loop through the selected images and add them to the request
    // for (var file in images) {
    //   // Create a file stream from the ImageFile
    //
    //   final filePathParts = file.path.split('/');
    //   final filename = filePathParts.last;
    //   final multipartFile = http.MultipartFile(
    //     'images', // Field name for the file (replace with your API's field name)
    //     file.openRead(), // Byte stream of the file
    //     await file.length(), // Length of the file
    //     filename: filename, // File name
    //   );
    //   print("mahsdbjjvdcn----------${file.path}");
    //   // Add the multipart file to the request
    //   request.files.add(multipartFile);
    // }
    if (images.length == 1) {
      final file = images[0]; // Get the single selected image
      final filePathParts = file.path.split('/');
      final filename = filePathParts.last;
      final multipartFile = http.MultipartFile(
        'image', // Field name for the single image
        file.openRead(), // Byte stream of the file
        await file.length(), // Length of the file
        filename: filename, // File name
      );

      // Add the single image as a multipart file
      request.files.add(multipartFile);
    } else {
      // Loop through the selected images and add them to the request
      for (var file in images) {
        final filePathParts = file.path.split('/');
        final filename = filePathParts.last;
        final multipartFile = http.MultipartFile(
          'images', // Field name for multiple images
          file.openRead(), // Byte stream of the file
          await file.length(), // Length of the file
          filename: filename, // File name
        );

        // Add the multipart file to the request
        request.files.add(multipartFile);
      }
    }

    request.fields['product_id'] = idRes.toString();
    request.fields['product_category_name'] = catName.toString();
    request.fields['active'] = true.toString();




    try {
      final response = await request.send();



      if (response.statusCode == 200) {

        print("Images uploaded successfully!");
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewAllProductsPage()));
      } else {
        print("Failed to upload images. Status code: ${response.statusCode}}");
        final responseString = await response.stream.bytesToString();
        print("Failed to upload images. Status code: ${response.statusCode}, Message: $responseString");
      }
    } catch (error) {
      print("Error uploading images: $error");
    }
  }


  @override
  Widget build(BuildContext context) {

    Widget addImages() {
      return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            MultiImagePickerView(
              onChange: (list) {
                debugPrint("hellooooooo----${list.toString()}");
                setState(() {
                  //images = list;
                  if (list.length == 1) {
                    // If only one image is selected, store it as a single File
                    images = [File(list.first.path.toString())];
                  } else {
                    // If multiple images are selected, store them as a list of Files
                    images = list.map((imageFile) => File(imageFile.path.toString())).toList();
                  }
                 //images = list.map((imageFile) => File(imageFile.path.toString())).toList();
                  //images = list.map((imageFile) => File(imageFile.path!)).toList();
                });
                // setState(() {
                //   images = list.map((imageFile) => imageFile.path).toList();
                // });
              },
              controller: controller,
              padding: const EdgeInsets.all(10),
            ),
            const SizedBox(height: 32),
            //const CustomExamples()
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Product",
          style: fontStyle60016(AppColors.bgBlack),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.bgBlack,
          ),
        ),
        actions: [Image.asset('assets/images/FAQ.png')],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ////////////////////////////View All products Button///////////////
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(24)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const ViewAllProductsPage()));
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) =>
                            //      Home()));
                          },
                          child: Text(
                            "View all products",
                            style: fontStyle60016(AppColors.bgBlack),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),

                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Types of products*"),
                      const SizedBox(
                        height: 4,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isCategory = !isCategory;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(category),
                              const Icon(Icons.expand_more)
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                          visible: isCategory,
                          child: Consumer<ProviderVendor>(
                              builder: (Context, value, child) {
                            if (identical(value.isSelectedCat, "NOT_STARTED") ||
                                identical(value.isSelectedCat, "LOADING")) {
                              return Center(child: CircularProgressIndicator());
                            }
                            return Container(
                              child: Column(
                                children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: value.SelectedCat.productTypes.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var selectcata = value.SelectedCat.productTypes[index];
                                        return InkWell(
                                          onTap: () {
                                            print("jhdvsbfcjkadn--->...$index");
                                            setState(() {
                                              category = selectcata.categoryName;
                                              id = selectcata.id;
                                              table_name = selectcata.tableName;
                                              catName = selectcata.categoryName;
                                              isCategory = false;
                                            });
                                            Provider.of<ProviderVendor>(context, listen: false)
                                                .getASubList(token, selectcata.categoryName);
                                            print("cateanameneb----${category}");
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                  padding: const EdgeInsets.all(16),
                                                  alignment: Alignment.topLeft,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(),
                                                      borderRadius:
                                                          BorderRadius.circular(8)),
                                                  child: Text(selectcata.categoryName))
                                            ],
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            );
                          }))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),

                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Types of Sub-category*"),
                      const SizedBox(
                        height: 4,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isSubCategory = !isSubCategory;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(subCategory),
                              const Icon(Icons.expand_more)
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                          visible: isSubCategory,
                          child: Consumer<ProviderVendor>(
                              builder: (Context, value, child) {
                                if (identical(value.isSubCatLoading, "NOT_STARTED") ||
                                    identical(value.isSubCatLoading, "LOADING")) {
                                  return Center(child: CircularProgressIndicator());
                                }
                                return Container(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: value.subCatList.subCategories.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var selectcata = value.subCatList.subCategories[index];
                                        print("name---${selectcata.name}");
                                        //print("name---${selectcata.categoryName}");
                                        return InkWell(
                                          onTap: () {
                                            print("jhdvsbfcjkadn--->...$index");
                                            setState(() {
                                               subCategory = selectcata.name;
                                               sub_id = selectcata.id;
                                               isSubCategory = false;
                                            });

                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                  padding: const EdgeInsets.all(16),
                                                  alignment: Alignment.topLeft,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(),
                                                      borderRadius:
                                                      BorderRadius.circular(8)),
                                                  child: Text(selectcata.name))
                                            ],
                                          ),
                                        );
                                      }),
                                );
                              }))
                    ],
                  ),
                ),
                ///////////////////////Product/////////////////////
                if (category != "Food" && category != "Food Court")
                  Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Add Product Image",
                          style: fontStyle60016(AppColors.bgBlack),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        //child: DemoPage(),
                        child: addImages(),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     print("Selected Images Count: ${images.length}");
                      //     for (var image in images) {
                      //       //print("Image Name: ${image.name}");
                      //       print("Image Path: ${image.path}");
                      //       //print("Image Size: ${image.size}");
                      //       //You can access other properties of ImageFile as needed.
                      //
                      //     }
                      //     //_uploadImages(token);
                      //   },
                      //   child: Text("Print Selected Images"),
                      // ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: "Products Title",
                          border: InputBorder.none,
                          )

                      ),
                      Divider(
                        height: 10,
                        color: AppColors.bgBlack,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      //////////////////////////////////Adding Product Description////////////////////
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Add Product Description *",
                          style: fontStyle50012(AppColors.bgBlack),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(8)),
                        child: TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                              hintText: "Add Product Description",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 14)),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      //////////////////////Adding Product Price//////////////////
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price",
                              style: fontStyle60016(AppColors.bgBlack),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              "Total Price *",
                              style: fontStyle50012(AppColors.bgBlack),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextFormField(
                                controller: totalPriceController,
                                decoration: const InputDecoration(
                                    hintText: "\u20B90.0",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 14)),
                              ),
                            ),
                            if(category == "Food Court" || category == "Food")
                            Column(
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "MRP *",
                                  style: fontStyle50012(AppColors.bgBlack),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: TextFormField(
                                    controller: comapareController,
                                    decoration: const InputDecoration(
                                        hintText: "\u20B90.0",
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(left: 14)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "GST *",
                              style: fontStyle50012(AppColors.bgBlack),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextFormField(
                                controller: gstController,
                                decoration: const InputDecoration(
                                    //hintText: "\u20B90.0",
                                    hintText: "% 0.5",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 14)),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      /////////////////////////////Add Tags////////////////////////////////

                      //               Container(
                      //                 decoration: BoxDecoration(
                      //                   border: Border.all()
                      //                 ),
                      //                 child: Column(
                      //                   crossAxisAlignment: CrossAxisAlignment.start,
                      //                   children: [
                      //                     Text("Add tags", style: fontStyle60016(AppColors.bgBlack),),
                      //                     const SizedBox(height: 16,),
                      //                     Container(
                      //                       decoration: BoxDecoration(
                      //                         color: AppColors.bgWhite,
                      //                         borderRadius: BorderRadius.circular(50),
                      //                         boxShadow: [
                      //                           BoxShadow(
                      //                             color: Colors.black.withOpacity(0.3),
                      //                             spreadRadius: 2,
                      //                             blurRadius: 4,
                      //                             offset: const Offset(0, 2),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                       child: TextFormField(
                      //                         decoration: const InputDecoration(
                      //                           contentPadding: EdgeInsets.all(16),
                      //                           prefixIcon: Icon(Icons.search_outlined),
                      //                           hintText: "Search for tag",
                      //                           border: InputBorder.none
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     const SizedBox(height: 16,),
                      //                     Container(
                      //                       child: GridView.builder(
                      //                         shrinkWrap: true,
                      //                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //                           crossAxisCount: 4,
                      //                         ),
                      //                         itemCount: dynamicallyGeneratedItems.length,
                      //                         itemBuilder: (BuildContext context, int index) {
                      //                           return Container(
                      //                             decoration: BoxDecoration(
                      //                               color: AppColors.buttonGrey,
                      //                               borderRadius: BorderRadius.circular(24)
                      //                             ),
                      //                             child: Row(
                      //                               mainAxisAlignment: MainAxisAlignment.center,
                      //                               children: [
                      //                                 Text(dynamicallyGeneratedItems[index]),
                      //                                 const Icon(Icons.close),
                      //                               ],
                      //                             ),
                      //                           );
                      //                         },
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //               const SizedBox(height: 24,),
                      ////////////////////////Negotiation///////////////////////////////////
                      textFormField("Size*", "Enter size",
                          sizeController),
                      const SizedBox(
                        height: 16,
                      ),
                      textFormField("Color*", "Enter color",
                          colorController),
                      const SizedBox(
                        height: 16,
                      ),
                      textFormField("Weight*", "Enter weight",
                          weightController),
                      const SizedBox(
                        height: 16,
                      ),
                      textFormField("Total Stock *", "Enter here",
                            stockController),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(24)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Negotiation",
                                    style: fontStyle60016(AppColors.bgBlack),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Can customer can negotiate with you.?",
                                    style: fontStyleSentences(),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isNegotiationAccepted = true; // Set to true when "Yes" is tapped
                                        print(isNegotiationAccepted);
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Yes",
                                        style: fontStyle60016(isNegotiationAccepted ?  AppColors.bgGreen : AppColors.bgBlack),
                                      ),
                                    ),
                                  ),
                                  VerticalDivider(
                                    thickness: 1,
                                    color: AppColors.bgBlack,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isNegotiationAccepted = false; // Set to false when "No" is tapped
                                        print(isNegotiationAccepted);
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "No",
                                        style: fontStyle60016(isNegotiationAccepted ?  AppColors.bgBlack : AppColors.headerGradient1),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ////////////////////////////Free Delivery///////////////////
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Free delivery",
                                        style:
                                            fontStyle60016(AppColors.bgBlack),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Will customer have any delivery free.?",
                                        style: fontStyleSentences(),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isFreeDeliveryAccepted = true;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Yes",
                                            style:
                                                fontStyle60016(isFreeDeliveryAccepted ? AppColors.bgGreen : AppColors.bgBlack),
                                          ),
                                        ),
                                      ),
                                      VerticalDivider(
                                        thickness: 1,
                                        color: AppColors.bgBlack,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isFreeDeliveryAccepted = false;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "No",
                                            style:
                                                fontStyle60016(isFreeDeliveryAccepted ?  AppColors.bgBlack : AppColors.headerGradient1),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Free delivery if you order more than *",
                              style: fontStyle50012(AppColors.bgBlack),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextFormField(
                                controller: freeDeliveryRangeController,
                                decoration: const InputDecoration(
                                    hintText: "\u20B90.0",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 14)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      //////////////////////////Exchange/Cancellation/////////////////////////////////////////
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Exchange",
                                        style:
                                            fontStyle60016(AppColors.bgBlack),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Will customer have any Exchange.?",
                                        style: fontStyleSentences(),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isExchangeAccepted = true;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Yes",
                                            style:
                                                fontStyle60016(isExchangeAccepted ?  AppColors.bgGreen : AppColors.bgBlack),
                                          ),
                                        ),
                                      ),
                                      VerticalDivider(
                                        thickness: 1,
                                        color: AppColors.bgBlack,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isExchangeAccepted = false;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "No",
                                            style:
                                                fontStyle60016(isExchangeAccepted ?  AppColors.bgBlack : AppColors.headerGradient1),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Add Exchange policy*",
                              style: fontStyle50012(AppColors.bgBlack),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextFormField(
                                controller: exchangePolicyController,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: const InputDecoration(
                                  hintText: "Write here",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 14),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),

                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Cancellation",
                                        style:
                                        fontStyle60016(AppColors.bgBlack),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Will customer have any Cancellation.?",
                                        style: fontStyleSentences(),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                  MediaQuery.of(context).size.height * 0.04,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isCancellationAccepted = true;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Yes",
                                            style:
                                            fontStyle60016(isCancellationAccepted ?  AppColors.bgGreen : AppColors.bgBlack),
                                          ),
                                        ),
                                      ),
                                      VerticalDivider(
                                        thickness: 1,
                                        color: AppColors.bgBlack,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isCancellationAccepted = false;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "No",
                                            style:
                                            fontStyle60016(isCancellationAccepted ?  AppColors.bgBlack : AppColors.headerGradient1),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),

                            Text(
                              "Add Cancellation policy*",
                              style: fontStyle50012(AppColors.bgBlack),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextFormField(
                                controller: cancellationController,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: const InputDecoration(
                                    hintText: "Write here",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 14)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   height: 24,
                      // ),
                      //
                      // Container(
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(24),
                      //       border: Border.all()),
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //         backgroundColor: Colors.transparent,
                      //         elevation: 0,
                      //         padding: EdgeInsets.only(
                      //             left: 26, right: 26, top: 13, bottom: 13)),
                      //     onPressed: () {},
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Text(
                      //           "Bulk upload",
                      //           style: fontStyle60016(AppColors.bgBlack),
                      //         ),
                      //         const SizedBox(
                      //           width: 12,
                      //         ),
                      //         Icon(
                      //           Icons.upload_file_outlined,
                      //           color: AppColors.bgBlack,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.bgBlack,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          24), // Adjust the radius as needed
                                    ),
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 10,
                                        top: 10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "View",
                                      style:
                                          fontStyleHeading(AppColors.bgWhite),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Icon(Icons.remove_red_eye_outlined)
                                  ],
                                )),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.headerGradient2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          24), // Adjust the radius as needed
                                    ),
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 10,
                                        top: 10)),
                                onPressed: () {
                                  uploadProductData();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Save",
                                      style:
                                          fontStyleHeading(AppColors.bgWhite),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Icon(Icons.save)
                                  ],
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),

                /////////////////////Food////////////////////////
                if (category == "Food" || category == "Food Court")
                  Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Add Food Image",
                          style: fontStyle60016(AppColors.bgBlack),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        //child: DemoPage(),
                        child: addImages(),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "Products Title",
                            border: InputBorder.none,
                          )

                      ),
                      Divider(
                        height: 10,
                        color: AppColors.bgBlack,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      //////////////////////////////////Adding Product Description////////////////////
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Add Product Description *",
                          style: fontStyle50012(AppColors.bgBlack),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(8)),
                        child: TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                              hintText: "Add Product Description",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 14)),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      //////////////////////Adding Product Price//////////////////
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price",
                              style: fontStyle60016(AppColors.bgBlack),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              "Total Price *",
                              style: fontStyle50012(AppColors.bgBlack),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextFormField(
                                controller: totalPriceController,
                                decoration: const InputDecoration(
                                    hintText: "\u20B90.0",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 14)),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "MRP*",
                              style: fontStyle50012(AppColors.bgBlack),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextFormField(
                                controller: comapareController,
                                decoration: const InputDecoration(
                                    hintText: "\u20B90.0",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 14)),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "GST *",
                              style: fontStyle50012(AppColors.bgBlack),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextFormField(
                                controller: gstController,
                                decoration: const InputDecoration(
                                    hintText: "% o.5",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 14)),
                              ),
                            )
                          ],
                        ),
                      ),
                      if (category != "Food" && category != "Food Court")
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Free delivery",
                                        style:
                                        fontStyle60016(AppColors.bgBlack),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Will customer have any delivery free.?",
                                        style: fontStyleSentences(),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                  MediaQuery.of(context).size.height * 0.04,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isFreeDeliveryAccepted = true;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Yes",
                                            style:
                                            fontStyle60016(isFreeDeliveryAccepted ? AppColors.bgGreen : AppColors.bgBlack),
                                          ),
                                        ),
                                      ),
                                      VerticalDivider(
                                        thickness: 1,
                                        color: AppColors.bgBlack,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isFreeDeliveryAccepted = false;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "No",
                                            style:
                                            fontStyle60016(isFreeDeliveryAccepted ?  AppColors.bgBlack : AppColors.headerGradient1),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Free delivery if you order more than *",
                              style: fontStyle50012(AppColors.bgBlack),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextFormField(
                                controller: freeDeliveryRangeController,
                                decoration: const InputDecoration(
                                    hintText: "\u20B90.0",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 14)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      if (category != "Food" && category != "Food Court")
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Cancellation",
                                        style:
                                        fontStyle60016(AppColors.bgBlack),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Will customer have any Cancellation.?",
                                        style: fontStyleSentences(),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                  MediaQuery.of(context).size.height * 0.04,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isCancellationAccepted = true;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Yes",
                                            style:
                                            fontStyle60016(isCancellationAccepted ?  AppColors.bgGreen : AppColors.bgBlack),
                                          ),
                                        ),
                                      ),
                                      VerticalDivider(
                                        thickness: 1,
                                        color: AppColors.bgBlack,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isCancellationAccepted = false;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "No",
                                            style:
                                            fontStyle60016(isCancellationAccepted ?  AppColors.bgBlack : AppColors.headerGradient1),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),

                            Text(
                              "Add Cancellation policy*",
                              style: fontStyle50012(AppColors.bgBlack),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextFormField(
                                controller: cancellationController,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: const InputDecoration(
                                    hintText: "Write here",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 14)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      // Container(
                      //   padding: EdgeInsets.all(16),
                      //   decoration: BoxDecoration(
                      //       border: Border.all(),
                      //       borderRadius: BorderRadius.circular(24)),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Expanded(
                      //             child: Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 Text(
                      //                   "Add-on",
                      //                   style:
                      //                       fontStyle60016(AppColors.bgBlack),
                      //                 ),
                      //                 const SizedBox(
                      //                   height: 4,
                      //                 ),
                      //                 Text(
                      //                   "Will customer have any add-on for this item.?",
                      //                   style: fontStyleSentences(),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //           Container(
                      //             height:
                      //                 MediaQuery.of(context).size.height * 0.04,
                      //             decoration: BoxDecoration(
                      //                 border: Border.all(),
                      //                 borderRadius: BorderRadius.circular(8)),
                      //             child: Row(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: [
                      //                 Padding(
                      //                   padding: const EdgeInsets.all(8.0),
                      //                   child: Text(
                      //                     "Yes",
                      //                     style:
                      //                         fontStyle60016(AppColors.bgBlack),
                      //                   ),
                      //                 ),
                      //                 VerticalDivider(
                      //                   thickness: 1,
                      //                   color: AppColors.bgBlack,
                      //                 ),
                      //                 Padding(
                      //                   padding: const EdgeInsets.all(8.0),
                      //                   child: Text(
                      //                     "No",
                      //                     style:
                      //                         fontStyle60016(AppColors.bgBlack),
                      //                   ),
                      //                 )
                      //               ],
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //       const SizedBox(
                      //         height: 12,
                      //       ),
                      //       Text(
                      //         "Veg Category",
                      //         style: fontStyle50012(AppColors.bgBlack),
                      //       ),
                      //       const SizedBox(
                      //         height: 8,
                      //       ),
                      //       textFormField("variables 1", "write here...",
                      //           TextEditingController()),
                      //       textFormField(
                      //           "Price", "0:00...", TextEditingController()),
                      //       textFormField("variables 2", "write here...",
                      //           TextEditingController()),
                      //       textFormField(
                      //           "Price", "0:00...", TextEditingController()),
                      //       ////////////////Non-veg Category//////////////////////
                      //       const SizedBox(
                      //         height: 16,
                      //       ),
                      //       Text(
                      //         "Non-Veg Category",
                      //         style: fontStyle50012(AppColors.bgBlack),
                      //       ),
                      //       const SizedBox(
                      //         height: 4,
                      //       ),
                      //       textFormField("variables 1", "write here...",
                      //           TextEditingController()),
                      //       textFormField(
                      //           "Price", "0:00...", TextEditingController()),
                      //       textFormField("variables 2", "write here...",
                      //           TextEditingController()),
                      //       textFormField(
                      //           "Price", "0:00...", TextEditingController()),
                      //       ///////////////////////Beverage Category///////////////
                      //       const SizedBox(
                      //         height: 16,
                      //       ),
                      //       Text(
                      //         "Beverage Category",
                      //         style: fontStyle50012(AppColors.bgBlack),
                      //       ),
                      //       const SizedBox(
                      //         height: 4,
                      //       ),
                      //       textFormField("variables 1", "write here...",
                      //           TextEditingController()),
                      //       textFormField(
                      //           "Price", "0:00...", TextEditingController()),
                      //       textFormField("variables 2", "write here...",
                      //           TextEditingController()),
                      //       textFormField(
                      //           "Price", "0:00...", TextEditingController()),
                      //       ///////////////////////////Desert Category////////////
                      //       const SizedBox(
                      //         height: 16,
                      //       ),
                      //       Text(
                      //         "Dessert Category",
                      //         style: fontStyle50012(AppColors.bgBlack),
                      //       ),
                      //       const SizedBox(
                      //         height: 4,
                      //       ),
                      //       textFormField("variables 1", "write here...",
                      //           TextEditingController()),
                      //       textFormField(
                      //           "Price", "0:00...", TextEditingController()),
                      //       textFormField("variables 2", "write here...",
                      //           TextEditingController()),
                      //       textFormField(
                      //           "Price", "0:00...", TextEditingController()),
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 16,
                      // ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(24),
                      //       border: Border.all()),
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //         backgroundColor: Colors.transparent,
                      //         elevation: 0,
                      //         padding: EdgeInsets.only(
                      //             left: 26, right: 26, top: 13, bottom: 13)),
                      //     onPressed: () {},
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Text(
                      //           "Bulk upload",
                      //           style: fontStyle60016(AppColors.bgBlack),
                      //         ),
                      //         const SizedBox(
                      //           width: 12,
                      //         ),
                      //         Icon(
                      //           Icons.upload_file_outlined,
                      //           color: AppColors.bgBlack,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.bgBlack,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          24), // Adjust the radius as needed
                                    ),
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 10,
                                        top: 10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "View",
                                      style:
                                          fontStyleHeading(AppColors.bgWhite),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Icon(Icons.remove_red_eye_outlined)
                                  ],
                                )),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.headerGradient2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          24), // Adjust the radius as needed
                                    ),
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 10,
                                        top: 10)),
                                onPressed: () {
                                  uploadFoodData();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Save",
                                      style:
                                          fontStyleHeading(AppColors.bgWhite),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Icon(Icons.save)
                                  ],
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
  // onSelectedCategory() {
  //   setState(() {
  //     isCategoryVisible = false;
  //     categoryData = data;
  //     Provider.of<ProviderVendor>(context, listen: false)
  //         .getASubList();
  //   });
  // }
}





//
// class CustomImage {
// final String name;
// //final String identifier;
// final ByteData byteData;
//
// CustomImage({
//   required this.name,
//   //required this.identifier,
//   required this.byteData,
// });
// }