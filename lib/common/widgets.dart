import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../common/Colors.dart';

Container offers(String text, VoidCallback onTap) {
  return Container(
    //margin: const EdgeInsets.only(left: 10, right: 10),
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
            Container(
              padding: const EdgeInsets.all(5),
              // height: MediaQuery.of(context).size.height * .038,
              //width: MediaQuery.of(context).size.height * 0.10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColors.headerGradient2,
              ),

              child: InkWell(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.only(left: 8,right: 4,bottom: 4,top: 4),
                  child: Row(
                    children: [
                      Text(
                        "More",
                        style: TextStyle(fontSize: 12, color: AppColors.bgWhite,
                          fontWeight: FontWeight.w500,),
                      ),
                      //SizedBox(width: 4,),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: AppColors.bgWhite,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Container buildSearchBar(String text) {
  return Container(
    child: Card(
      color: AppColors.bgWhite,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.search_outlined),
          suffixIcon: const Icon(Icons.mic),
        ),
      ),
    ),
  );
}

////// only Text left alligned
Container offersText(
    String text,
    ) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )
            )),
      ],
    ),
  );
}

//////////Button with Icon

Container customButton(String buttonText, VoidCallback onPressed) {
  return Container(
    //padding: EdgeInsets.only(left: 16, right: 16, top: 10),
    child: ElevatedButton(
      style:
      ElevatedButton.styleFrom(backgroundColor: AppColors.headerGradient2),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonText,
            style: TextStyle(fontSize: 16, color: AppColors.bgWhite),
          ),
          const SizedBox(
            width: 16,
          ),
          Icon(Icons.arrow_forward, color: AppColors.bgWhite),
        ],
      ),
    ),
  );
}

////////Appbar with left arrow button and text

AppBar appbarWithIcon(
    String text, Icon icon, double fontSize, VoidCallback onIconTap) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      text,
      style: TextStyle(fontSize: fontSize, color: AppColors.bgBlack),
    ),
    centerTitle: true,
    leading: InkWell(
      onTap: onIconTap,
      child: icon,
    ),
  );
}

///////Product image having favourite add and chat Options
Widget buildRecentProductCard(String image, String text, String img2) {
  return Container(
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20), bottom: Radius.circular(20)),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                //width: double.infinity,
              ),
              Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.bgWhite,
                          borderRadius: BorderRadius.circular(40)),
                      child: const Icon(Icons.favorite_outline))),
              Positioned(
                  bottom: 10,
                  left: 10,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.bgWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
                      child: Text(
                        text,
                        style: TextStyle(color: AppColors.bgGreen),
                      ),
                    ),
                  )),
              Positioned(
                  bottom: 16,
                  right: 16,
                  child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: AppColors.bgWhite,
                          borderRadius: BorderRadius.circular(40)),
                      child: Image.asset(img2))),
            ],
          )),
    ),
  );
}



////////////////////////Product image without add and chat ///////////////////////
Widget buildRecentProductCardWithEdit(String image) {
  return Container(
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20), bottom: Radius.circular(20)),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                //width: double.infinity,
              ),
              Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.bgWhite,
                          borderRadius: BorderRadius.circular(40)),
                      child: const Icon(Icons.edit))),
              // Positioned(
              //     bottom: 10,
              //     left: 10,
              //
              //     child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: AppColors.bgWhite,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20.0),
              //         ),
              //       ),
              //       onPressed: () {},
              //       child: Padding(
              //         padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
              //         child: Text(
              //           text,
              //           style: TextStyle(color: AppColors.bgGreen),
              //         ),
              //       ),
              //     )),
              // Positioned(
              //     bottom: 16,
              //     right: 16,
              //     child: Container(
              //         padding: const EdgeInsets.all(6),
              //         decoration: BoxDecoration(
              //             color: AppColors.bgWhite,
              //             borderRadius: BorderRadius.circular(40)),
              //         child: Image.asset(img2))),
            ],
          )),
    ),
  );
}




///////Product image having favourite add  and callback funonly Options
Widget buildRecentProductCardwithOutChatWithCallback(String image, String text,VoidCallback ontap) {
  return Container(
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20), bottom: Radius.circular(20)),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                //width: double.infinity,
              ),
              Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.bgWhite,
                          borderRadius: BorderRadius.circular(40)),
                      child: const Icon(Icons.favorite_outline))),
              Positioned(
                  bottom: 10,
                  left: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.bgWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    onPressed: ontap,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        text,
                        style: TextStyle(color: AppColors.bgGreen),
                      ),
                    ),
                  )),

            ],
          )),
    ),
  );
}






///////Product image having favourite add only Options
Widget buildRecentProductCardwithOutChat(String image, String text,) {
  return Container(
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20), bottom: Radius.circular(20)),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                //width: double.infinity,
              ),
              Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.bgWhite,
                          borderRadius: BorderRadius.circular(40)),
                      child: const Icon(Icons.favorite_outline))),
              Positioned(
                  bottom: 10,
                  left: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.bgWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        text,
                        style: TextStyle(color: AppColors.bgGreen),
                      ),
                    ),
                  )),

            ],
          )),
    ),
  );
}

Widget productWithicons(
    String name,
    String imagepath,
    String addText,
    String imagepath1,
    String address,
    BuildContext context,
    String rating,
    String price,
    String discount) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildRecentProductCard(imagepath, addText, imagepath1),
        Container(
            margin: const EdgeInsets.only(left: 10, right: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 16,
                    ),
                    Text(rating),
                  ],
                )
              ],
            )),
        Container(
          margin: const EdgeInsets.only(
            left: 10,
          ),
          width: MediaQuery.of(context).size.width *
              0.40, // Adjust the width as needed
          child: Text(
            address,
            style: const TextStyle(fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Text("\u20B9$price"),
              const SizedBox(
                width: 10,
              ),
              Text(
                "\u20B9 $discount",
                style: const TextStyle(decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget materialIconWidget(
    BuildContext context, String image, VoidCallback onIconTap) {
  return Material(
    elevation: 2,
    type: MaterialType.button,
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(100),
    child: Container(
      width: MediaQuery.of(context).size.width * 0.1,
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color(0xFFFFFFFF),
      ),
      child: GestureDetector(
        onTap: onIconTap,
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: Image.asset(image),
        ),
      ),
    ),
  );
}

// Widget appBarWithThreeItems(BuildContext context, VoidCallback onTapShare,VoidCallback onTapWishList, VoidCallback onTapMenu ){
//   return Container(
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         IconButton(onPressed: (){
//           Navigator.pop(context);
//         }, icon: const Icon(Icons.arrow_back)),
//         Row(
//           children: [
//             materialIconWidget(context,("assets/products/Group.png") , onTapShare),
//             const SizedBox(width: 10),
//             materialIconWidget(context, "assets/products/wishlist pro.png", onTapWishList),
//             const SizedBox(width: 10),
//             materialIconWidget(context, "assets/products/Option.png",onTapMenu),
//           ],
//         )
//       ],
//     ),
//   );
// }



///////Appbar with backgroundcourselimages and three action buttons
PreferredSizeWidget appbarWithImageCourselAndThreeButtons(
    List<String> images,
    VoidCallback onTapShare,
    VoidCallback onTapWishList,
    VoidCallback onTapMenu,
    BuildContext context,
    int initialIndex
    ) {

  int _currentIndex = initialIndex;
  return PreferredSize(
    preferredSize: const Size.fromHeight(500.0), // Adjust the required height
    child: Stack(
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading:  IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: AppColors.bgBlack,),
          ),
          flexibleSpace: Column(
            children: [
              CarouselSlider(
                items: images.map((image) {
                  return Container(
                    height: 500.0, // Adjust the required height
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image), // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: false,
                  //enlargeCenterPage: true,
                  aspectRatio: 0.85,
                  viewportFraction: 1.0,
                ),
              ),
              const SizedBox(height: 10,),
              DotsIndicator(
                dotsCount: images.length,
                position: _currentIndex,
                decorator: DotsDecorator(
                  activeColor: const Color(0xFFE74c3c),
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: [
                  materialIconWidget(
                      context, ("assets/products/Group.png"), onTapShare),
                  const SizedBox(width: 10),
                  materialIconWidget(
                      context, "assets/products/wishlist pro.png", onTapWishList),
                  const SizedBox(width: 10),
                  materialIconWidget(
                      context, "assets/products/Option.png", onTapMenu),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
}


///////Appbar with backgroundcourselimages only
PreferredSizeWidget appbarWithImageCoursel(
    List<String> images,
    BuildContext context,
    int initialIndex
    ) {

  int _currentIndex = initialIndex;
  return PreferredSize(
    preferredSize: const Size.fromHeight(500.0), // Adjust the required height
    child: Stack(
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading:  IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: AppColors.bgBlack,),
          ),
          flexibleSpace: Column(
            children: [
              CarouselSlider(
                items: images.map((image) {
                  return Container(
                    height: 500.0, // Adjust the required height
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image), // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: false,
                  //enlargeCenterPage: true,
                  aspectRatio: 0.85,
                  viewportFraction: 1.0,
                ),
              ),
              const SizedBox(height: 10,),
              DotsIndicator(
                dotsCount: images.length,
                position: _currentIndex,
                decorator: DotsDecorator(
                  activeColor: const Color(0xFFE74c3c),
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ],
          ),

        ),
      ],
    ),
  );
}

//////AppBar with three action share wishlist menu

AppBar appbarwiththreeactionButtons(
    BuildContext context,
    VoidCallback onTapShare,
    VoidCallback onTapWishList,
    VoidCallback onTapMenu) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.bgBlack,
        )),
    actions: [
      Container(
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          children: [
            materialIconWidget(
                context, ("assets/products/Group.png"), onTapShare),
            const SizedBox(width: 10),
            materialIconWidget(
                context, "assets/products/wishlist pro.png", onTapWishList),
            const SizedBox(width: 10),
            materialIconWidget(
                context, "assets/products/Option.png", onTapMenu),
          ],
        ),
      )
    ],
  );
}

///////Appbar with background image and three action buttons

PreferredSize appbarWithImageAndThreebuttons(String image,VoidCallback onTapShare,
    VoidCallback onTapWishList,
    VoidCallback onTapMenu, BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(500.0), // Adjust the required height
    child: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Material(),
      flexibleSpace: Container(
        height: 500.0, // Adjust the required height
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
      ),
      actions: [
        Container(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: [
              materialIconWidget(
                  context, ("assets/products/Group.png"), onTapShare),
              const SizedBox(width: 10),
              materialIconWidget(
                  context, "assets/products/wishlist pro.png", onTapWishList),
              const SizedBox(width: 10),
              materialIconWidget(
                  context, "assets/products/Option.png", onTapMenu),
            ],
          ),
        )
      ],
    ),
  );
}




///////////////SHOP/HOTEL DETAIL PAGE IMAGE CARD
Widget cardWithImageAndContent(
    String imagepath,
    String name,
    String dialogName,
    String storeIconImage,
    String Address,
    String locationIconImage,
    String distance,
    String rating) {
  return Container(
      child: Stack(
        children: [
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    double availableWidth = constraints.maxWidth;
                    double imageHeight = 0.5 * availableWidth;

                    return AspectRatio(
                      aspectRatio: 396 / imageHeight,
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30)),
                        child: Image.asset(
                          imagepath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),

                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              )
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                              color: AppColors.bgWhite,
                            ),
                            child: Container(
                              padding: const EdgeInsets.only(left: 7, right: 5),
                              child: Card(

                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.only(left: 8, right: 4, top: 4,bottom: 4),
                                  child: Row(
                                    children: [
                                      Text(
                                        dialogName,
                                        style: TextStyle(
                                          color: AppColors.bgGreen,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(width: 4,),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 15,
                                        color: AppColors.bgGreen,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          //Image.asset("assets/images/Store.png"),
                          Image.asset(storeIconImage),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(child: Text(Address, style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ))),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Image.asset(locationIconImage),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(distance, style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          )),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: 24,
              right: 24,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 6,
                  top: 2,
                  bottom: 2,
                  right:6,
                ),
                decoration: BoxDecoration(
                    color: AppColors.bgGreen1,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.bgWhite,
                      size: 12,
                    ),
                    Text(rating,
                        style: TextStyle(color: AppColors.bgWhite, fontSize: 12))
                  ],
                ),
              )),
        ],
      ));
}




/////Search bar with filter
Widget buildSearchBarWithFilter(BuildContext context, String image, String hintText) {
  return Container(
    //padding: EdgeInsets.all(16),
    child: Row(
      children: [
        Expanded(
          flex: 8000,
          child: Card(
            color: AppColors.bgWhite,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              decoration:  InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search_outlined),
                suffixIcon: const Icon(Icons.mic),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 2000,
            child: Container(
              height: MediaQuery.of(context).size.width * 0.11,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, // Make it a circular shape
                  color: AppColors.bgWhite,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 3,
                        color: AppColors.bgBlack.withOpacity(0.12)

                    )
                  ]
              ),
              // child: Image.asset('assets/images/Filter.png'),
              child: Image.asset(image),
            ))
      ],
    ),
  );
}







///////////App bar with text and downside search bar with filter options

Widget appbar(BuildContext context, String text) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: AppColors.bgBlack,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 20, color: AppColors.bgWhite),
        ),
        Container(),
      ],
    ),
  );
}



Widget customAppbar(BuildContext context, String appBarText, String searchBarImage, String searchBarHintText) {
  return Container(
    padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 16),
    decoration: const BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30.0),
      ),
    ),
    //margin: EdgeInsets.only(top: 30),
    child: Column(
      children: [
        appbar(context, appBarText),
        buildSearchBarWithFilter(context, searchBarImage, searchBarHintText),
      ],
    ),
  );
}


////////////////Font Title with weight 600 and 20
TextStyle fontStyleHeading(Color colors) {
  return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.4,
      color: colors
  );
}

////TExtStyle for Fontweight 400 & 20 size

TextStyle fontStyle400() {
  return
    const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
    );

}

////////////////Font sentences
TextStyle fontStyleSentences() {
  return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.4,
      color: AppColors.bgBlack
  );
}

//////////Font Size weight 600 and size 16

TextStyle fontStyle60016(Color color) {
  return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.4,
      color: color
  );
}

/////////FontStyle weight 700,size 22


TextStyle fontStyle70022() {
  return TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.4,
      color: AppColors.bgBlack
  );
}

TextStyle fontStyle50012(Color color) {
  return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.4,
      color: color
  );
}


TextStyle fontStyle40012(Color color) {
  return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.4,
      color: color
  );
}

TextStyle fontStyle40022(Color color) {
  return TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.4,
      color: color
  );
}






//////////////////Appbar for profiles Account Pages


AppBar profileAppbar(VoidCallback onTap, String text) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(text, style: fontStyle70022(),),
    centerTitle: true,
    leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back, color: AppColors.bgBlack,),),

  );
}



////////////////////////////////Elevated Button with border and without color//////////////////////////
Widget elevatedButtonWithBorderandImage(BuildContext context, Color color,VoidCallback onTap, String image, String text) {
  return  Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      border: Border.all(
        color: AppColors.cvBackground1, // Color of the border
        width: 1.0, // Width of the border
      ),
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      onPressed: onTap,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(width: 12,),
          Text(text, style: fontStyle60016(color),),
        ],
      ),
    ),
  );
}



///////////////Elevated button without image/icon //////////
Widget elevatedButton(VoidCallback ontap, String trxt){
  return  ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.headerGradient2,
      padding: const EdgeInsets.only(left: 40, right: 40, top: 12, bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
      ),
    ),
    onPressed: ontap,
    child:  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(trxt, style: fontStyleHeading(AppColors.bgWhite),),
      ],
    ),
  );
}
////////////////Elevated button with Colors without border
Widget elevatedButtonWithOutBorderandImage(Color color,Color textcolor, BuildContext context, VoidCallback onTap, String image, String text) {
  return  ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
      ),
    ),
    onPressed: onTap,
    child:  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        const SizedBox(width: 12,),
        Text(text, style: fontStyle60016(textcolor),),
      ],
    ),
  );
}

////////Text Field with out icon
Widget textFieldWithHint(String name, String entername, TextEditingController controll) {
  return Column(
    children: [
      Container(
          alignment: Alignment.topLeft,
          child:  Text(name, style: fontStyle40012(AppColors.cvBackground8))),
      const SizedBox(height: 8,),
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.cvBackground8),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextFormField(
          controller: controll,
          decoration:  InputDecoration(
            hintText: entername,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(left: 15),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color:AppColors.cvBackground8), // Color of the border
                borderRadius: BorderRadius.circular(10.0)
            ),
          ),
        ),
      ),
      const SizedBox(height: 12,),
    ],
  );
}




////////////////Textfield With icon/////////////////

Widget textFieldWithHintAndIcon(String name, String entername, TextEditingController controll, Icon icon) {
  return Column(
    children: [
      Container(
          alignment: Alignment.topLeft,
          child:  Text(name, style: fontStyle40012(AppColors.cvBackground8))),
      const SizedBox(height: 8,),
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.cvBackground8),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextFormField(
          controller: controll,
          decoration:  InputDecoration(
            suffixIcon: icon,
            hintText: entername,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(left: 15, top: 15),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color:AppColors.cvBackground8), // Color of the border
                borderRadius: BorderRadius.circular(10.0)
            ),
          ),
        ),
      ),
      const SizedBox(height: 12,),
    ],
  );
}

///////////////////Registration form field////////////////////
Widget textFormField(String name, String hinttext, TextEditingController controller ) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(name, style: fontStyle50012(AppColors.bgBlack),),
        ),
        const SizedBox(height: 4,),
        Container(
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8)
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                hintText: hinttext,
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 12)
            ),
          ),
        ),
      ],
    ),
  );
}


///////////////////Registration with validation////////////////////////////////

Widget textFormFieldWithValidation(String name,String icon, String hinttext, TextEditingController controller ) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: name,
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: icon,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ),
        const SizedBox(height: 4,),
        Container(
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8)
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                hintText: hinttext,
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 12)
            ),
          ),
        ),
      ],
    ),
  );
}




























////////////////////Backup///
// Widget buildRecentProductCard(Restaurant data1) {
//   Image image = Image.asset('assets/images/prod.png');
//   return Container(
//     //margin: EdgeInsets.only(left: 10, right: 10),
//     //height: MediaQuery.of(context).size.height * 0.20,
//     child: Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       child: ClipRRect(
//           borderRadius: const BorderRadius.vertical(
//               top: Radius.circular(20), bottom: Radius.circular(20)),
//           child: Stack(
//             children: [
//               Image.asset(
//                 "assets/images/prod.png",
//                 fit: BoxFit.cover,
//                 //width: double.infinity,
//               ),
//               Positioned(
//                   top: 10,
//                   right: 10,
//                   child: Container(
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                           color: AppColors.bgWhite,
//                           borderRadius:  BorderRadius.circular(40)),
//                       child: const Icon(Icons.favorite_outline)
//                   )),
//               Positioned(
//                   bottom: 10,
//                   left: 10,
//                   child: ElevatedButton(
//                     onPressed: () {}, child: Padding(
//                     padding: const EdgeInsets.only(left: 10, right: 10),
//                     child: Text("Add", style: TextStyle(color: AppColors.bgGreen),),
//                   ),
//
//                   )),
//               Positioned(
//                   bottom: 10,
//                   right: 10,
//                   child: Container(
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                           color: AppColors.bgWhite,
//                           borderRadius:  BorderRadius.circular(40)),
//                       child: Image.asset("assets/images/chat.png")
//                   )),
//             ],
//           )
//       ),
//     ),
//   );
// }
