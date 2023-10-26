import 'package:c2b_vendor/common/Colors.dart';
import 'package:c2b_vendor/common/widgets.dart';
import 'package:flutter/material.dart';

class StoreinfoPage extends StatefulWidget {
  const StoreinfoPage({super.key});

  @override
  State<StoreinfoPage> createState() => _StoreinfoPageState();
}

class _StoreinfoPageState extends State<StoreinfoPage> {


  final List<Address> addresses = [
    Address(
      doorNumber: '#89',
      streetName: 'Jawaharlal Nehru Road/Street',
      area: 'Rajarajeshwari Nagar',
      city: 'Bangalore',
      state: 'Karnataka',
      pincode: '578945',
    ),
  ];

  List<String> daysOfWeek = [
    "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
  ];
  bool isTimings = false;

  @override
  Widget build(BuildContext context) {

    Widget address1(String name) {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: fontStyle60016(AppColors.bgBlack),),
            const SizedBox(height: 6,),
            textFormField("Door Number", "Enter here",TextEditingController()),
            textFormField("Street Name", "Enter here",TextEditingController()),
            textFormField("Area Name", "Enter here",TextEditingController()),
            textFormField("City ", "Enter here",TextEditingController()),
            textFormField("State ", "Enter here",TextEditingController()),
            textFormField("Pincode ", "Enter here",TextEditingController()),
          ],
        ),
      );
    }

    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Store Profile", style: fontStyle70022(),),
        centerTitle: true,
        leading: InkWell(
          onTap: ()=> Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: AppColors.bgBlack,)),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity, // or set the width to the desired width
                    height: MediaQuery.of(context).size.height * 0.2, // Set the desired height here
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1604719312566-8912e9227c6a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29udmVuaWVuY2UlMjBzdG9yZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
                        fit: BoxFit.cover, // You can set the fit mode to cover, contain, etc.
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Transform.translate(
                      offset: const Offset(0, 35),
                      child: ClipRect(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  backgroundColor: AppColors.bgWhite,

                                ),
                                onPressed: () {
                                  // Handle button click here
                                },
                                child: Row(
                                  children: [
                                    Text("Add", style: fontStyle40012(AppColors.bgBlack),),
                                    const SizedBox(width: 8,),
                                    Icon(Icons.photo_camera, color: AppColors.bgBlack,)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24,),
              textFormField("Store name *", " Enter your Store name",TextEditingController()),
              textFormField("Mobile Number*", " +91 7397392974",TextEditingController()),
              const SizedBox(height: 16,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(13),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Change Mobile number", style: fontStyle60016(AppColors.bgBlack),),
                      const SizedBox(width: 12,),
                      Icon(Icons.change_circle_rounded, color: AppColors.bgBlack,)
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              textFormField("Alternate Mobile Number*", " +91 7397392974",TextEditingController()),
              textFormField("Email Id *", " Enter here",TextEditingController()),
              const SizedBox(height: 16,),
              address1("Home Address1 *"),
              const SizedBox(height: 12,),
              textFormField("Landmark *", "Enter near by landmark",TextEditingController()),
              const SizedBox(height: 16,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(13),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Change Address", style: fontStyle60016(AppColors.bgBlack),),
                      const SizedBox(width: 12,),
                      Icon(Icons.arrow_forward, color: AppColors.bgBlack,)
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 16,),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isTimings = !isTimings;
                        });
                      },
                      child:   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Store Timimgs"),
                          Icon( isTimings ? Icons.expand_less : Icons.expand_more)
                        ],
                      ),
                    ),
                    Visibility(
                      visible: isTimings,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: daysOfWeek.length,
                          itemBuilder: (BuildContext context, int index) {
                            final day = daysOfWeek[index];
                            return  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(day),
                                Container(
                                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                                  child: const Row(
                                    children: [
                                      Text("9:00AM"),
                                      SizedBox(width: 5,),
                                      Text("-"),
                                      SizedBox(width: 5,),
                                      Text("9:00PM"),
                                      SizedBox(width: 5,),

                                    ],
                                  ),
                                )
                              ],
                            );
                          }),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16,),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all()
                ),

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Documents details", style: fontStyle60016(AppColors.bgBlack),),
                    textFormField("GSt No *", "22AAAAA0000A1Z5",TextEditingController()),
                    textFormField("FSSAI No *", "12319678901234",TextEditingController()),
                    textFormField("Pancard Num *", "BQVRB3365B",TextEditingController()),
                  ],
                ),
              ),
              const SizedBox(height: 16,),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all()
                ),

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Account Details", style: fontStyle60016(AppColors.bgBlack),),
                    textFormField("Account Holder Name *", "XYZ.........",TextEditingController()),
                    textFormField(" Account Number*", "XYZ.............",TextEditingController()),
                    textFormField("Bank Name *", "XYZ...........",TextEditingController()),
                    textFormField("City *", "XYZ...........",TextEditingController()),
                    textFormField("Branch *", "XYZ...........",TextEditingController()),
                    textFormField("IFSC Code *", "XYZ...........",TextEditingController()),
                    const SizedBox(height: 24,),
                  ],
                ),
              ),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.bgBlack,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24), // Adjust the radius as needed
                            ),
                            padding: EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("View", style: fontStyleHeading(AppColors.bgWhite),),
                            const SizedBox(width: 8,),
                            Icon(Icons.remove_red_eye_outlined)
                          ],
                        )
                    ),
                  ),
                  const SizedBox(width: 12,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.headerGradient2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24), // Adjust the radius as needed
                          ),
                          padding: EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10)
                      ),
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Get Approval", style: fontStyleHeading(AppColors.bgWhite),),
                          const SizedBox(width: 8,),
                          Icon(Icons.arrow_forward)
                        ],
                      )
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



class Address {
  final String doorNumber;
  final String streetName;
  final String area;
  final String city;
  final String state;
  final String pincode;
  Address({
    required this.doorNumber,
    required this.streetName,
    required this.area,
    required this.city,
    required this.state,
    required this.pincode,
  });
}
