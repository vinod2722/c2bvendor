import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/widgets.dart';


class Privacy_Police_Page extends StatelessWidget {
  const Privacy_Police_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppbar(() {}, " Privacy Policy"),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Thank you for using our e-commerce multi-vendor application (\"C2B\"). This Privacy Policy outlines how we collect, use, and safeguard your personal information. By accessing or using the Platform, you consent to the practices described in this policy.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "1. Information Collection: We collect information you provide when you register an account, make purchases, or interact with the Platform. This may include your name, contact details, payment information, and browsing activity.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "2. Use of Information: We use your information to process orders, improve our services, and personalize your experience. This includes sending order notifications, recommendations, and updates.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "3. Data Security: We implement security measures to protect your data from unauthorized access, alteration, or disclosure. However, no online platform can guarantee complete security.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "4. Third-Party Services: We may use third-party services for payment processing, analytics, and marketing. These services have their own privacy policies, and we encourage you to review them.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "5. Cookies and Tracking Technologies: We use cookies and similar technologies to enhance your experience on the Platform. You can manage your preferences regarding these technologies..",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "1. Information Collection: We collect information you provide when you register an account, make purchases, or interact with the Platform. This may include your name, contact details, payment information, and browsing activity.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
