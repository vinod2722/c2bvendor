import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../common/Colors.dart';
import '../../common/widgets.dart';


class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: profileAppbar(() {}, "Feedback"),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("We value your feedback and are commited to continuously improving your experience on our e-commerce, and opinions help us enhance our platform and provide you with better services. Here`s how you can share your feedback.", style: fontStyleSentences(),),
              const SizedBox(height: 40,),
              Text("What`s your feedback about C2B app...?", style: fontStyle60016(AppColors.bgBlack),),
              const SizedBox(height: 12,),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter your comments here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  // Handle the changes in the comment text
                },
              ),
              const SizedBox(height: 20,),
              Text("Rate your overall experience on a scale of 1 to 5 stars.", style: fontStyleSentences(),),
              const SizedBox(height: 20,),
              Container(
                alignment: Alignment.center,
                child: RatingBar.builder(
                  initialRating: 0,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 35,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    // Handle the rating when it's updated
                    print(rating);
                  },
                ),
              ),
              const SizedBox(height: 150,),
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
    );
  }
}
