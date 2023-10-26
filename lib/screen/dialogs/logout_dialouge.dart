import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

import '../../common/Colors.dart';
import '../../common/widgets.dart';
import '../singn_in/sign_in.dart';


class LogOutPage extends StatelessWidget {
  const LogOutPage({super.key});

  @override
  Widget build(BuildContext context) {

    final LocalStorage userToken = LocalStorage('user_token');
    late String token = '';

    token = userToken.getItem('token');


    Future<String> login() async {

      var client = http.Client();
      final baseUrl = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/logout-user');


      var response = await client.post(baseUrl, headers: <String, String> {
        'Content-Type': 'application/json',
        'Authorization' : token
      }
      );
      print(
          "checkdata : ${response.statusCode} :  ${response.request} : ${response.body} ");
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final errorMessage = jsonResponse['message'];
        Fluttertoast.showToast(msg: errorMessage);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Sign_In_Page()));
        return response.body;

      } else {
        final jsonResponse = json.decode(response.body);
        final errorMessage = jsonResponse['message'];
        Fluttertoast.showToast(msg: errorMessage);
        return "";
      }
      return "";
    }
    return  Container(

      child: Dialog(
        child: Container(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.15, maxWidth:  MediaQuery.of(context).size.width * 0.15), // Adjust size as needed

          child:  Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Are you sure you want to logout", style: fontStyle60016(AppColors.bgBlack),),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: (){
                      login();
                    }, child: Text("Confirm")),
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("Cancel"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
