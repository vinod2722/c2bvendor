import 'package:flutter/material.dart';

import '../../common/Colors.dart';
import '../../common/widgets.dart';



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


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {



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
  @override
  Widget build(BuildContext context) {

    ///////////ProfilePic///////////
    Widget profilePic() {
      return Container(
        alignment: Alignment.center,
        child: CircleAvatar(
            radius: 60, // Adjust the radius as needed
            backgroundImage: const NetworkImage('https://imgv3.fotor.com/images/gallery/AI-3D-Female-Profile-Picture.jpg'), // Replace with your image path
            child: Container()
        )
        ,
      );
    }

    /////////Fields//////////////
    Widget fields(String name, String label) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: fontStyle60016(AppColors.bgBlack),),
            const SizedBox(height: 6,),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintText: label,
                    hintStyle: fontStyleSentences()
                ),
              ),
            )
          ],
        ),
      );
    }

    ////////ChangeMobilenumber///////////////
    Widget changeNumber() {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(25)
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.only(left: 26, right: 26, top: 13, bottom: 13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25), // Sets the border radius
              ),
              backgroundColor: AppColors.bgWhite
          ),
          onPressed: (){},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Change Mobile Number", style: fontStyle60016(AppColors.bgBlack),),
              const SizedBox(width: 12,),
              Icon(Icons.change_circle_outlined, color: AppColors.bgBlack,)
            ],
          ),
        ),
      );
    }

    //////////////HomeAddress////////////////////
    Widget address1(String name) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: fontStyle60016(AppColors.bgBlack),),
          const SizedBox(height: 6,),
          Container(
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(8)
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                var address = addresses[index];
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                              flex: 1,
                              child: Text("Door number")),
                          const Text(":"),
                          Expanded(
                              flex: 2,
                              child: Text(address.doorNumber))
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                              flex: 1,
                              child: Text("Street Name")),
                          const Text(":"),
                          Expanded(
                              flex: 2,
                              child: Text(address.streetName))
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                              flex: 1,
                              child: Text("Area")),
                          const Text(":"),
                          Expanded(
                              flex: 2,
                              child: Text(address.area))
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                              flex: 1,
                              child: Text("City")),
                          const Text(":"),
                          Expanded(
                              flex: 2,
                              child: Text(address.city))
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                              flex: 1,
                              child: Text("State")),
                          const Text(":"),
                          Expanded(
                              flex: 2,
                              child: Text(address.state))
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                              flex: 1,
                              child: Text("Pincode")),
                          const Text(":"),
                          Expanded(
                              flex: 2,
                              child: Text(address.pincode))
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),

          ),
        ],
      );
    }

    //////////////In a row two buttons//////////////////////
    Widget twoButtons() {
      return Container(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(25)

                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //padding: EdgeInsets.only(left: 26, right: 26,top: 13, bottom: 13),
                        backgroundColor: Colors.transparent,
                        elevation: 0
                    ),
                    onPressed: () {},
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Add more", style: fontStyle60016(AppColors.bgBlack),),
                        Icon(Icons.arrow_forward, color: AppColors.bgBlack,)
                      ],
                    )),
              ),
            ),
            const SizedBox(width: 12,),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(25)
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0
                      //padding: EdgeInsets.only(left: 20, right: 26,top: 13, bottom: 13)
                    ),
                    onPressed: () {},
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Change Address",style: fontStyle60016(AppColors.bgBlack),),
                        Icon(Icons.arrow_forward, color: AppColors.bgBlack,)
                      ],
                    )),
              ),
            )
          ],
        ),
      );
    }

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Profile", style: fontStyle70022(),),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back, color: AppColors.bgBlack,),),
        actions: [
          TextButton(onPressed: () {
            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileEditPage()));
          }, child: Text("Edit", style: fontStyle60016(AppColors.bgBlack),))
        ],
      ),
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                profilePic(),
                const SizedBox(height: 20,),
                fields("First name *", "Enter your first name"),
                const SizedBox(height: 20,),
                fields("Last name *", "Enter your last name"),
                const SizedBox(height: 20,),
                fields("DOB", "DD/MM/YY"),
                const SizedBox(height: 20,),
                fields("Language", "Enter your mother language"),
                const SizedBox(height: 20,),
                fields("Mobile number *", "9834537665"),
                const SizedBox(height: 20,),
                changeNumber(),
                const SizedBox(height: 20,),
                fields("Alternate Mobile number *", "+91 6746534567"),
                const SizedBox(height: 20,),
                fields("Email *", "Enter your Email address"),
                const SizedBox(height: 20,),
                address1("Home Address1 *"),
                const SizedBox(height: 12,),
                fields("Landmark *", "Enter near by landmark"),
                const SizedBox(height: 12,),

                twoButtons(),
                const SizedBox(height: 20,),
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
