import 'package:flutter/material.dart';

import '../../common/Colors.dart';
import '../../common/widgets.dart';
import 'account_detail.dart';


class Login_Security_Page extends StatefulWidget {
  const Login_Security_Page({super.key});

  @override
  State<Login_Security_Page> createState() => _Login_Security_PageState();
}

class _Login_Security_PageState extends State<Login_Security_Page> {
  @override
  Widget build(BuildContext context) {

    /////////Fields//////////////
    Widget fields(String name, String label) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Text(name, style: fontStyle60016(AppColors.bgBlack),)),
            const SizedBox(height: 6,),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 16,top: 14),
                    hintText: label,
                    hintStyle: fontStyleSentences(),
                    suffixIcon: IconButton(onPressed: (){},icon: Icon(Icons.remove_red_eye_outlined),)
                ),
              ),
            )
          ],
        ),
      );
    }
    return  Scaffold(
      appBar: profileAppbar((){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccountPage()));
      }, "Login and Security"),
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fields("Current Password *", "Enter old Password"),
                TextButton(onPressed: () {}, child: Text("Forget your Password", style: TextStyle(color: AppColors.bgBlack),)),

                const SizedBox(height: 20,),
                fields("New Password *", "Enter new Password"),
                const SizedBox(height: 15,),
                fields("Confirm new Password *", "Reenter Password"),
                const SizedBox(height: 250,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.headerGradient2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0), // Adjust the radius as needed
                        ),
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10)
                    ),
                    onPressed: () {},
                    child: Text("Save", style: fontStyleHeading(AppColors.bgWhite),),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
