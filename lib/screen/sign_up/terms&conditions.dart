import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Terms & Conditions"),
        centerTitle: true,
      ),
      body: Container(
        child: Text("Terms and Conditions"),
      ),
    );
  }
}
