import 'dart:convert';

import 'package:c2b_vendor/model/addon_model.dart';
import 'package:c2b_vendor/model/subCat_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/bank_model.dart';
import '../model/bannerModel.dart';
import '../model/categories_model.dart';
import '../model/delivery_model.dart';
import '../model/malls_model.dart';
import '../model/productsModel.dart';
import '../model/selectedCategoryModel.dart';
import '../model/user_model.dart';
import '../model/vendor_order_model.dart';
import '../services/services.dart';
import 'package:http/http.dart' as http;


class ProviderVendor extends ChangeNotifier {
  final _service = ApiServices();


///Catrgory_Provider///////////////////

  String isCategoryLoading = "NOT_STARTED";
   late CategoryModel _category;

  CategoryModel get categoryData => _category;

  Future<void> getCategory() async {
    isCategoryLoading = "LOADING";
    notifyListeners();

    final response = await _service.categoryData();
    if(identical(response, "please try again later")) {
      isCategoryLoading = "ERROR";
    }else {
      isCategoryLoading = "COMPLETED";
      _category = categoryModelFromJson(response);
    }
    notifyListeners();
  }
////
  //////////////
  List<Product> filteredProducts = [];

  void filterProducts(String query) {
    // Filter the products based on the search query
    filteredProducts = _productDate.products.where((product) {
      // You can customize the filtering logic here.
      // For example, if you want to filter by product name, you can use:
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    // Notify listeners to update the UI with filtered products
    notifyListeners();
  }
  ///////////////ProductsFetching//////////

  String isLoading = "NOT_STARTED";
  late ProductResponse _productDate;

  ProductResponse get productResponse => _productDate;


  Future<void> getProductsDate(String token, double lat, double lng,) async {

// Define isLoading locally
    isLoading = "LOADING";
    notifyListeners();


    final response = await _service.productData(token, lat, lng,);
    if (identical(response, 'Something went wrong Please try again')) {
      isLoading = "ERROR";
      //_errorMessage = "Something went wrong Please try again";
    } else {
      _productDate = productResponseFromJson(response);
      isLoading = "COMPLETED";
      // Initialize _productDate here
    }

    notifyListeners();
  }
  ///////////////////////////Categories selected while regoistring////////
  String isSelectedCat = "NOT_STARTED";
  late SelectedCatModel _selectedCategory;

  SelectedCatModel get SelectedCat => _selectedCategory;

  Future<void> getSelectedCategory(String token) async {
    isSelectedCat = "LOADING";
    notifyListeners();

    final response = await _service.selectedCategory(token);
    if(identical(response, "please try again later")) {
      isSelectedCat = "ERROR";
    }else {
      isSelectedCat = "COMPLETED";
      _selectedCategory = selectedCatModelFromJson(response);
    }
    notifyListeners();
  }


////////////////////////BAnksFetching//////////////////
  String isBanksLoading = "NOT_STARTED";
   late  BanksModel _bank;

  BanksModel get bankData => _bank;

  Future<void> getBanks() async {
    isBanksLoading = "LOADING";
    notifyListeners();

    final response = await _service.fetchBanks();
    if(identical(response, "please try again later")) {
      isBanksLoading = "ERROR";
    }else {
      isBanksLoading = "COMPLETED";
      _bank = banksModelFromJson(response);
    }
    notifyListeners();
  }


  ////////////////////////////////Fetching banners////////////////
  String isBannerLoading = "NOT_STARTED";
  late  ImageFetchModel _banner;

  ImageFetchModel get bannerData => _banner;

  Future<void> getBanners(String token) async {
    isBannerLoading = "LOADING";
    notifyListeners();

    final response = await _service.detchBanners(token);
    if(identical(response, "please try again later")) {
      isBannerLoading = "ERROR";
    }else {
      isBannerLoading = "COMPLETED";
      _banner = imageFetchModelFromJson(response);
    }
    notifyListeners();
  }



  /////To Fetch MAlls//////////////////
  String isMallLoading = "NOT_STARTED";
  late MallsModel _mallData;

  MallsModel get mallList => _mallData;

  Future<void> getMalls( lat, lng) async{
    isMallLoading = "LOADING";
    notifyListeners();

    final response = await _service.getMallsList( lat, lng);
    if(identical(response, "Someting went wrong try again later")) {
      isMallLoading = "ERROR";
    }else {
      isMallLoading = "COMPLETED";
      _mallData = mallsModelFromJson(response);
    }
    notifyListeners();
  }


  //////////?Fetching Addons/////
  String isAddonLoading = "NOT_STARTED";
  late AddonModel _addonData;

  AddonModel get addonList => _addonData;

  Future<void> getAddonList(token) async{
    isAddonLoading = "LOADING";
    notifyListeners();

    final response = await _service.getAddons(token);
    if(identical(response, "Someting went wrong try again later")) {
      isAddonLoading = "ERROR";
    }else {
      isAddonLoading = "COMPLETED";
      _addonData = addonModelFromJson(response);
    }
    notifyListeners();
  }

  ///////////?Fetch Sub Catgeories/////////////
  String isSubCatLoading = "NOT_STARTED";
  late SubCatModel _subCatData;

  SubCatModel get subCatList => _subCatData;


  Future<void> getASubList(String token, String catName ) async{
    isSubCatLoading = "LOADING";
    notifyListeners();

    final response = await _service.getSubCat(token, catName);
    if(identical(response, "Someting went wrong try again later")) {
      isSubCatLoading = "ERROR";
    }else {
      isSubCatLoading = "COMPLETED";
      _subCatData = subCatModelFromJson(response);
    }
    notifyListeners();
  }


  /////////////Fetching Orders//////
  String isOrdersLoading = "NOT_STARTED";
  late VendoeOrder _orderData;

  VendoeOrder get vendOrder => _orderData;


  Future<void> getOrders(String token ) async{
    isOrdersLoading = "LOADING";
    notifyListeners();

    final response = await _service.getOrders(token);
    if(identical(response, "Someting went wrong try again later")) {
      isOrdersLoading = "ERROR";
    }else {
      isOrdersLoading = "COMPLETED";
      _orderData = vendoeOrderFromJson(response);
    }
    notifyListeners();
  }


/////////Editing Addons///////////
  Future<void> updateAddonAvailability(String token, int addonId, String name, int price, int comparePrice, bool available) async {
    final response = await http.post(
      Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/edit-add-on'),
      headers: <String, String>{
        'authorization': token,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'addon_id': addonId,
        'name': name,
        'price': price,
        'compare_price': comparePrice,
        'available': available,
      }),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      // You might want to update your local data here.
      notifyListeners();
      Fluttertoast.showToast(msg: "Updated Successfully");
    } else {
      // If the server returns an error response, throw an exception.
      throw Exception('Failed to update addon availability');
    }
  }


  ///////////?Fetch User Data/////////////
  String isUserData = "NOT_STARTED";
  late UserModel _userData;

  UserModel get userDetails => _userData;


  Future<void> getUserData(String token,) async{
    isUserData = "LOADING";
    notifyListeners();

    final response = await _service.getUserdat(token);
    if(identical(response, "Someting went wrong try again later")) {
      isUserData = "ERROR";
    }else {
      isUserData = "COMPLETED";
      _userData = userModelFromJson(response);
    }
    notifyListeners();
  }


  ///////////Get Delivery types///////
  String isDeliverytype = "NOT_STARTED";
  late DeliveryType delType;

  DeliveryType get deliveyTypeDetails => delType;


  Future<void> getDeliveyData() async{
    isDeliverytype = "LOADING";
    notifyListeners();

    final response = await _service.getDeliveryType();
    if(identical(response, "Someting went wrong try again later")) {
      isDeliverytype = "ERROR";
    }else {
      isDeliverytype = "COMPLETED";
      delType = deliveryTypeFromJson(response);
    }
    notifyListeners();
  }

}