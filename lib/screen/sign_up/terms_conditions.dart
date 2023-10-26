import 'package:flutter/material.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("PRIVACY POLICY"),
              Text(
                  "Close to Buy Private Limited, a private limited company with its registered office,at   459,   7th Main,8th Cross,   M   L   Layout,   Bangalore,   Karnataka,   560096, India ${(
                  "Company",
                  "We",
                  "Us",
                  "Our",
                  "and",
                  "terms",
                  "of",
                  "similar",
                  "meaning"
                  )} is committed to protecting your privacy. This Privacy Policy shall apply to the Users,Delivery Partners, Merchants (as defined in the Terms of Use). For the purposes of this Privacy Policy, the Users, Delivery Partners, Merchants (as defined in the Terms   of   Use)   shall   together   hereinafter   be   referred   to as “You”, “Your” or “Yourself”."),
              Text("This   Privacy   Policy   is   incorporated   into   and   subject   to   Our   Terms   of Use (“Terms”) and shall be read harmoniously and in conjunction with the Terms.In the event of any conflict between the Terms and this Privacy Policy, the provisions of the Terms shall supersede the Privacy Policy. All capitalized termsnot defined under this Privacy Policy shall have the meaning ascribed to it underthe applicable Terms."),
              Text("Our Statement of Privacy Practice"),
              Text("Your information is collected and processed in accordance with the terms and conditions of this Privacy Policy."),
              Text("Information You Provide to Us"),
              Text("The information we collect on or through our Services may include:"),
              Row(
                children: [
                  Text("Your   account   information"),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
