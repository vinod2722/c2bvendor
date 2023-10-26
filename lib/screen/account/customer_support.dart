import 'package:flutter/material.dart';


import '../../common/Colors.dart';
import '../../common/widgets.dart';

class HelpDeskHomePage extends StatefulWidget {
  const HelpDeskHomePage({super.key});

  @override
  State<HelpDeskHomePage> createState() => _HelpDeskHomePageState();
}

class _HelpDeskHomePageState extends State<HelpDeskHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWithIcon("Helpdesk", Icon(Icons.arrow_back, color: AppColors.bgBlack,), 16, () { }),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Card(
                          color: AppColors.grey,
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Account and security"),
                                IconButton(onPressed: () {}, icon: Icon(Icons.expand_more))
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
