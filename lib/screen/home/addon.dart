import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localstorage/localstorage.dart';

import '../../common/Colors.dart';
import '../../common/widgets.dart';
import 'package:http/http.dart' as http;

import 'all_addons.dart';


class AddOnsPage extends StatefulWidget {
  const AddOnsPage({super.key});

  @override
  State<AddOnsPage> createState() => _AddOnsPageState();
}

class _AddOnsPageState extends State<AddOnsPage> {

  bool isAvailabale = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController compareController = TextEditingController();
  final LocalStorage userToken = LocalStorage('user_token');
  late String token = '';


  Future<void> addAddons() async {
    var baseUrl = Uri.parse("https://close2buy-dev.jurysoftprojects.com/api/create-new-add-on");

    final requestBody =
      {
        "name": nameController.text,
        "price": priceController.text,
        "compare_price": compareController.text,
        "available": isAvailabale
      };
    final jsonBody = jsonEncode(requestBody);

    var response = await http.post(baseUrl, headers: <String, String> {
      'Content-Type': 'application/json',
      'authorization': token,
    }, body: jsonBody);
    print(
        "Product Data : ${response.statusCode} :  ${response.request} : ${response.body} ");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      //final id = jsonResponse['created_product']['id'];
      nameController.clear();
      priceController.clear();
      compareController.clear();
      Fluttertoast.showToast(msg: errorMessage);

    } else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);
      //return "";
    }
    }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    token = userToken.getItem('token');
    print(token);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                            const AllAddons()));
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) =>
                        //      Home()));
                      },
                      child: Text(
                        "View all Addon's",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Available",
                        style:
                        fontStyle60016(AppColors.bgBlack),
                      ),

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
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                             setState(() {
                               isAvailabale = true;
                             });
                             print(isAvailabale);
                            },
                            child: Text(
                              "Yes",
                              style:
                              isAvailabale == true ? fontStyle60016(AppColors.bgGreen) : fontStyle60016(AppColors.bgBlack),

                            ),
                          ),
                        ),
                      ),
                      VerticalDivider(
                        thickness: 1,
                        color: AppColors.bgBlack,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                isAvailabale = false;
                              });
                            },
                            child: Text(
                              "No",
                              style:
                              isAvailabale == false ? fontStyle60016(AppColors.headerGradient2) : fontStyle60016(AppColors.bgBlack),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),

            const SizedBox(
              height: 8,
            ),
            textFormField("variables ", "Enter here...",
                nameController),
            textFormField(
                "Price", "0:00...", priceController),
            textFormField("Compare Price", "Enter here...",
                compareController),
            ////////////////Non-veg Category//////////////////////
            const SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
                child: ElevatedButton(onPressed: (){
                  addAddons();
                }, child: Text("Get Approval")))
          ],
        ),
      )
    );
  }
}
