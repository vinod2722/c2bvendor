import 'package:flutter/material.dart';

import '../../common/Colors.dart';
import '../../common/widgets.dart';


class ServicePlansPage extends StatefulWidget {
  const ServicePlansPage({super.key});

  @override
  State<ServicePlansPage> createState() => _ServicePlansPageState();
}

class _ServicePlansPageState extends State<ServicePlansPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Subscription", style: fontStyleHeading(AppColors.bgBlack),),
        centerTitle: true,
        leading: IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Icons.arrow_back, color: AppColors.bgBlack,),),
        actions: [
          Image.asset("assets/images/FAQ.png")
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                //Text("Welcome to C2B! We are excited to have you on board below, you will find information about our subscription plans, their benefits, and the steps to purchase one", style: fontStyleSentences(),),
                const SizedBox(height: 16),
                /////////////////////////////BASIC PLAN
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.serviceBackground,
                      border: Border.all(color: AppColors.serviceBoder),
                      borderRadius: BorderRadius.circular(24)
                  ),
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text("Plan Name: Basic", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                      Text("Benefits:", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                      Text("     .[List the key benefits of the plan]", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                      Text("Price: \$100 per month", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              padding: EdgeInsets.only(left: 26, top: 18, bottom: 18, right: 26),
                            ),
                            onPressed: () {},
                            child: Container(
                              //width: double.infinity, // Make the button take up full width
                              //padding: EdgeInsets.symmetric(vertical: 18, horizontal: 26),
                              alignment: Alignment.center,
                              child:  Text("Proceed to Payment", style: fontStyleHeading(AppColors.bgBlack),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                /////////////////////////ADVANCE PLAN ////////////////////////////
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.serviceBackground1,
                      border: Border.all(color: AppColors.bgGreen3),
                      borderRadius: BorderRadius.circular(24)
                  ),
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text("Plan Name: Standard", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                      Text("Benefits:", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                      Text("     .[List the key benefits of the plan]", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                      Text("Price: \$200 per month", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              padding: EdgeInsets.only(left: 26, top: 18, bottom: 18, right: 26),
                            ),
                            onPressed: () {},
                            child: Container(
                              //width: double.infinity, // Make the button take up full width
                              //padding: EdgeInsets.symmetric(vertical: 18, horizontal: 26),
                              alignment: Alignment.center,
                              child:  Text("Proceed to Payment", style: fontStyleHeading(AppColors.bgBlack),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                ///////////////////////////PREMIUM////////////////////////////////
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.serviceBackground2,
                      border: Border.all(color: AppColors.serviceBoder2),
                      borderRadius: BorderRadius.circular(24)
                  ),
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text("Plan Name: Premium", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                      Text("Benefits:", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                      Text("     .[List the key benefits of the plan]", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                      Text("Price: \$300 per month", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              padding: EdgeInsets.only(left: 26, top: 18, bottom: 18, right: 26),
                            ),
                            onPressed: () {},
                            child: Container(
                              //width: double.infinity, // Make the button take up full width
                              //padding: EdgeInsets.symmetric(vertical: 18, horizontal: 26),
                              alignment: Alignment.center,
                              child:  Text("Proceed to Payment", style: fontStyleHeading(AppColors.bgBlack),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                ///////////////////////////PREMIUM////////////////////////////////
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.serviceBackground2,
                      border: Border.all(color: AppColors.serviceBoder2),
                      borderRadius: BorderRadius.circular(24)
                  ),
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text("Plan Name: Pro", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                      Text("Benefits:", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                      Text("     .[List the key benefits of the plan]", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                      Text("Price: \$400 per month", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              padding: EdgeInsets.only(left: 26, top: 18, bottom: 18, right: 26),
                            ),
                            onPressed: () {},
                            child: Container(
                              //width: double.infinity, // Make the button take up full width
                              //padding: EdgeInsets.symmetric(vertical: 18, horizontal: 26),
                              alignment: Alignment.center,
                              child:  Text("Proceed to Payment", style: fontStyleHeading(AppColors.bgBlack),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                ///////////////////////////PREMIUM////////////////////////////////
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.serviceBackground2,
                      border: Border.all(color: AppColors.serviceBoder2),
                      borderRadius: BorderRadius.circular(24)
                  ),
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text("Plan Name: Enterprise", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                      Text("Benefits:", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                     Container(
                       child: ListView.builder(
                         shrinkWrap: true,
                         itemCount: 5,
                           itemBuilder: (BuildContext context, int index) {
                         return Text("     .[List the key benefits of the plan]", style: fontStyleSentences());
                       }),
                     ),
                      const SizedBox(height: 16),
                      Text("Price: \$500 per month", style: fontStyleSentences()),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              padding: EdgeInsets.only(left: 26, top: 18, bottom: 18, right: 26),
                            ),
                            onPressed: () {},
                            child: Container(
                              //width: double.infinity, // Make the button take up full width
                              //padding: EdgeInsets.symmetric(vertical: 18, horizontal: 26),
                              alignment: Alignment.center,
                              child:  Text("Proceed to Payment", style: fontStyleHeading(AppColors.bgBlack),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
