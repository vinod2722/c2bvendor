import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

import '../../common/Colors.dart';
import '../../common/widgets.dart';
import '../../model/productsModel.dart';
import '../../providers/providers.dart';
import '../productDetail.dart';

class ViewAllProductsPage extends StatefulWidget {
  const ViewAllProductsPage({super.key});

  @override
  State<ViewAllProductsPage> createState() => _ViewAllProductsPageState();
}

class _ViewAllProductsPageState extends State<ViewAllProductsPage> {

  List<Product>? filteredProducts;

  final LocalStorage userToken = LocalStorage('user_token');
  late String token = '';

  late double lat;
  late double  lng;

  Future<void> getData() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProviderVendor>(context, listen: false)
          .getProductsDate(token,lat, lng,);

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    token = userToken.getItem('token');
    lat = 14.44937;
    lng = 79.9873;
    print(token);
    getData();
  }

  void filterProducts(String query) {
    Provider.of<ProviderVendor>(context, listen: false).filterProducts(query);
  }
  @override
  Widget build(BuildContext context) {


    // Widget recentProductsList1() {
    //   return GridView.builder(
    //     shrinkWrap: true,
    //     itemCount: 6,
    //     physics: const ClampingScrollPhysics(),
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //       childAspectRatio: 1 / 1.73,
    //       crossAxisSpacing: 10,
    //     ),
    //     itemBuilder: (BuildContext context, int index) {
    //       //var data1 = restaurantData[index];
    //       return InkWell(
    //         //onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ProductDetailPage())),
    //         onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  ProductDetailsPage())),
    //         child: Container(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               buildRecentProductCardWithEdit("assets/images/samsung.png"),
    //               Container(
    //                   padding: const EdgeInsets.only( right: 6,),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Padding(
    //                         padding: const EdgeInsets.all(6.0),
    //                         child: Text(
    //                           "Samsung",
    //                           style: const TextStyle(fontSize: 16),
    //                         ),
    //                       ),
    //
    //                       const Row(
    //                         children: [
    //                           Icon(Icons.star, size: 16,),
    //                           Text("5.0"),
    //                         ],
    //                       )
    //
    //                     ],
    //                   )),
    //               Container(
    //                 margin: const EdgeInsets.only(
    //                   left: 6,
    //                 ),
    //                 width: MediaQuery.of(context).size.width *
    //                     0.40, // Adjust the width as needed
    //                 child: Text(
    //                   "Flag ship smartphone",
    //                   style: const TextStyle(fontSize: 12),
    //                   maxLines: 1,
    //                   overflow: TextOverflow.ellipsis,
    //                 ),
    //               ),
    //               Container(
    //                 margin: const EdgeInsets.only(left: 6,top: 6),
    //                 child: const Row(
    //                   crossAxisAlignment: CrossAxisAlignment.end,
    //                   children: [
    //                     Text("\u20B9 64,999",style: TextStyle(
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.w600,
    //                     )),
    //                     SizedBox(width: 10,),
    //                     Text("\u20B9 64,999", style: TextStyle(decoration: TextDecoration.lineThrough,  fontSize: 12,),),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //   );
    // }
    Widget recentProductsList1() {
      final double screenWidth = MediaQuery.of(context).size.width;
      final double screenHeight = MediaQuery.of(context).size.height;

      // Calculate aspect ratio based on screen size
      final double aspectRatio = screenWidth / (screenHeight * 0.88);
      return Consumer<ProviderVendor>(builder: (context, value, child) {
        if(identical(value.isLoading, "NOT_STARTED") || identical(value.isLoading, "LOADING")){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else {
          filteredProducts = value.productResponse.products;
          return Column(
            children: [
              // offers("Recently viewed products", () {
              //   Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => RecentlyViewedProductsPage(
              //           products: value.recentProducts)));
              // }),
              const SizedBox(
                height: 16,
              ),

              GridView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: aspectRatio, // Dynamic aspect ratio
                ),
                //itemCount: value.recentProducts.recentlyViewedProducts.length,
                itemCount:  filteredProducts!.length,
                itemBuilder: (context, index) {
                  var data1 = filteredProducts![index];
                  return
                    InkWell(
                      // onTap: () {
                      //   // print("data1-----${data1.product.id}");
                      //   // print("data1-----${data1.category.categoryName}");
                      //
                      //   if(data1.categoryTableAssociation.categoryName == "Food") {
                      //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => FoodHomePage( categoryName: data1.category.categoryName)));
                      //   } else{
                      //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailPage(id: data1.product.id, catName: data1.category.categoryName)));
                      //
                      //   }
                      //
                      //   print("what${data1.category.categoryName}");
                      // },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.26,
                                width: MediaQuery.of(context).size.width * 1.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    data1.imagesOfProducts.length >0 ? data1.imagesOfProducts[0].imageUrl : "",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 12.0,
                                  right: 12.0,
                                  child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: AppColors.bgWhite,
                                          borderRadius: BorderRadius.circular(40)),
                                      child: const Icon(Icons.favorite_outline))),
                              // Positioned(
                              //     bottom: 12.0,
                              //     left: 16.0,
                              //     child: ElevatedButton(
                              //       style: ElevatedButton.styleFrom(
                              //         backgroundColor: AppColors.bgWhite,
                              //         shape: RoundedRectangleBorder(
                              //           borderRadius: BorderRadius.circular(16.0),
                              //         ),
                              //       ),
                              //       onPressed: () {},
                              //       child: Padding(
                              //         padding: const EdgeInsets.only(
                              //             left: 16, right: 16, top: 6, bottom: 6),
                              //         child: Text(
                              //           "ADD",
                              //           style: TextStyle(color: AppColors.bgGreen),
                              //         ),
                              //       ),
                              //     )),
                              // Positioned(
                              //     bottom: 16.0,
                              //     right: 12.0,
                              //     child: Container(
                              //         padding: const EdgeInsets.all(6),
                              //         decoration: BoxDecoration(
                              //             color: AppColors.bgWhite,
                              //             borderRadius: BorderRadius.circular(40)),
                              //         child: Image.asset("assets/images/chat.png"))),
                            ],
                          ),
                          const SizedBox(height: 8.0), // Add spacing between image and text
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Padding(
                                //   padding: const EdgeInsets.only(top: 4, bottom: 4),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Expanded(
                                //         child: Text(
                                //           overflow: TextOverflow.ellipsis,
                                //           "${data1.name}",
                                //           // "category_name=${data1.category.categoryName}&product_id=${data1.productId}",
                                //           style: const TextStyle(
                                //               fontSize: 16,
                                //               fontWeight: FontWeight.bold),
                                //         ),
                                //       ),
                                //       const Row(
                                //         children: [
                                //           Text(
                                //             " 5.0",
                                //             style: TextStyle(
                                //                 fontWeight: FontWeight.bold),
                                //           ),
                                //           SizedBox(
                                //             width: 4,
                                //           ),
                                //           Icon(
                                //             Icons.star,
                                //             size: 16,
                                //           )
                                //         ],
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                                  child: Expanded(
                                    child: Text(
                                      "${data1.description}",
                                      style: const TextStyle(fontSize: 16),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                                  child: Row(
                                    children: [
                                      Text(
                                        "\u20B9 ${data1.price}",
                                        // Replace with the actual price
                                        style: TextStyle(
                                            color: AppColors.bgBlack,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(
                                        width: 24,
                                      ),
                                      Text(
                                        "\u20B9 ${data1.comparePrice}",
                                        // Replace with the actual price
                                        style: TextStyle(
                                            color: AppColors.cvBackground8,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            decoration: TextDecoration.lineThrough),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                },
              )
            ],
          );
        }

      });

    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Product", style: fontStyle60016(AppColors.bgBlack),),
        centerTitle: true,
        leading: IconButton(onPressed: ()=> Navigator.pop(context),icon: Icon(Icons.arrow_back, color: AppColors.bgBlack,),),
        actions: [
          Image.asset('assets/images/FAQ.png')
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                // buildSearchBarWithFilter(context, "assets/images/FAQ.png", "Search your products"),
            Container(
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
                    hintText: "Search your products",
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search_outlined),
                    suffixIcon: const Icon(Icons.mic),
                  ),
                  onChanged: (query) {
                    filterProducts(query);
                    print("Queryyy---$query");
                  },
                ),
              ),
            ),
            // Expanded(
            //     flex: 2000,
            //     child: Container(
            //       height: MediaQuery.of(context).size.width * 0.11,
            //       decoration: BoxDecoration(
            //           shape: BoxShape.circle, // Make it a circular shape
            //           color: AppColors.bgWhite,
            //           boxShadow: [
            //             BoxShadow(
            //                 blurRadius: 4,
            //                 spreadRadius: 3,
            //                 color: AppColors.bgBlack.withOpacity(0.12)
            //
            //             )
            //           ]
            //       ),
            //       // child: Image.asset('assets/images/Filter.png'),
            //       child: Image.asset("assets/images/FAQ.png"),
            //     ))
            ],
          ),
        ),
                const SizedBox(height: 24,),
                recentProductsList1(),
                // Container(
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                //       backgroundColor: AppColors.headerGradient2,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(24.0), // Adjust the radius as needed
                //       ),
                //     ),
                //     onPressed: () {},
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text("Get Approval", style: fontStyleHeading(AppColors.bgWhite),),
                //         const SizedBox(width: 8,),
                //         Icon(Icons.arrow_forward)
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
