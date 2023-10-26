import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class ApiServices{
  Future<String> categoryData() async {
    var client = http.Client();
    final baseUrl = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/get-categories-and-services');
    var response = await client.get(baseUrl);

    print(
        "checkdata : ${response.statusCode} :  ${response.request} : ${response.body} ");

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      //Fluttertoast.showToast(msg: errorMessage);
      return response.body;
    } else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      //Fluttertoast.showToast(msg: errorMessage);
      return "";
    }
  }



  ////////////Fetching Selected Categories while registration///////////

  Future<String> selectedCategory(String token) async {
    var client = http.Client();
    final baseUrl = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/get-categories');
    //var response = await client.get(baseUrl);

    var response = await client.get(baseUrl, headers: <String, String> {
      'Authorization' : token,
    });

    print(
        "SelectedCategories : ${response.statusCode} :  ${response.request} : ${response.body} ");

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);
      return response.body;
    } else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      Fluttertoast.showToast(msg: errorMessage);
      return "";
    }
  }




///////////ProductsFetching//////
  Future<String> productData(String token, double lat, double lng,) async {
    var client = http.Client();

    final queryParameters = {
      'lat': lat.toString(),
      'lng': lng.toString(),
      //'id': id,
    };

    // if (cat.isNotEmpty) {
    //   queryParameters['category_name'] = cat;
    // }
    // if (id.isNotEmpty) {
    //   queryParameters['id'] = id.toString();
    // }
    // if (id.toString().isNotEmpty && id != 0) {
    //   queryParameters['product_id'] = id.toString();
    //
    // }

    final baseUrl = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/get-products')
        .replace(queryParameters: queryParameters);

    var response = await client.get(baseUrl, headers: <String, String> {
      'Authorization': token,
    });

    print(
        "ProductData : ${response.statusCode} :  ${response.request} : ${response.body} ");

    if (response.statusCode == 200) {
      // final jsonResponse = json.decode(response.body);
      // final errorMessage = jsonResponse['message'];
      //Fluttertoast.showToast(msg: errorMessage);
      return response.body;
    } else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      //Fluttertoast.showToast(msg: errorMessage);
      return errorMessage;
    }
  }


  Future<String> fetchBanks() async {
    var client = http.Client();
    final baseUrl = Uri.parse('https://close2buy-dev.jurysoftprojects.com/api/fetch-banks');
    var response = await client.get(baseUrl);

    print(
        "BankData : ${response.statusCode} :  ${response.request} : ${response.body} ");

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      //Fluttertoast.showToast(msg: errorMessage);
      return response.body;
    } else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      //Fluttertoast.showToast(msg: errorMessage);
      return "";
    }
  }
  
  Future<String> detchBanners(String token) async {
    var client = http.Client();
    final baseUrl = Uri.parse(
        "https://close2buy-dev.jurysoftprojects.com/api/get-banners");


    var response = await client.get(baseUrl, headers: <String, String> {
      'Authorization' : token,
    });

    print(
        "BankData : ${response.statusCode} :  ${response.request} : ${response
            .body} ");

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      //Fluttertoast.showToast(msg: errorMessage);
      return response.body;
    } else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      //Fluttertoast.showToast(msg: errorMessage);
      return "";
    }
  }


  ////////////////////MAll_Fetchinggg//////////
  Future<String> getMallsList( double lat, double lng) async {
    var client = http.Client();
    final baseUrl = Uri.parse("https://close2buy-dev.jurysoftprojects.com/api/get-malls")
        .replace(queryParameters: {
      'lat': lat.toString(),
      'lng': lng.toString(),
    });
    var response = await client.get(baseUrl, headers: <String, String> {

    });
    print(
        "Malls Near By----: ${response.statusCode} : ${response.body}"
    );
    if(response.statusCode == 200) {
      //final jsonResponse = json.decode(response.body);
      return response.body;
    }else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      return errorMessage;
    }
  }

  Future<String> getAddons( String token) async {
    var client = http.Client();
    final baseUrl = Uri.parse("https://close2buy-dev.jurysoftprojects.com/api/fetch-add-ons");

    var response = await client.get(baseUrl, headers: <String, String> {
      'Authorization' : token,
    });
    print(
        "Addons----: ${response.statusCode} : ${response.body}"
    );
    if(response.statusCode == 200) {
      //final jsonResponse = json.decode(response.body);
      return response.body;
    }else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      return errorMessage;
    }
  }


  /////////////getSub-categories///////
  Future<String> getSubCat( String token, String catName) async {
    var client = http.Client();

    final baseUrl = Uri.parse("https://close2buy-dev.jurysoftprojects.com/api/fetch-sub-category?active=true").replace(queryParameters: {
      'category': catName,

    });;

    var response = await client.get(baseUrl, headers: <String, String> {
      'Authorization' : token,
    });
    print(
        "Sub-categoriies----: ${response.statusCode} :${response.request} : ${response.body}"
    );
    if(response.statusCode == 200) {
      //final jsonResponse = json.decode(response.body);
      return response.body;
    }else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      return errorMessage;
    }
  }

  //////////////Fetch orders///////////////////
  Future<String> getOrders( String token) async {
    var client = http.Client();

    final baseUrl = Uri.parse("https://close2buy-dev.jurysoftprojects.com/api/fetch-orders-vendor");

    var response = await client.get(baseUrl, headers: <String, String> {
      'Authorization' : token,
    });
    print(
        "Orders----: ${response.statusCode} :${response.request} : ${response.body}"
    );
    if(response.statusCode == 200) {
      //final jsonResponse = json.decode(response.body);
      return response.body;
    }else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      return errorMessage;
    }
  }


/////////////User-Data///////
  Future<String> getUserdat( String token) async {
    var client = http.Client();

    final baseUrl = Uri.parse("https://close2buy-dev.jurysoftprojects.com/api/get-user");

    var response = await client.get(baseUrl, headers: <String, String> {
      'Authorization' : token,
    });
    print(
        "User-data----: ${response.statusCode} :${response.request} : ${response.body}"
    );
    if(response.statusCode == 200) {
      //final jsonResponse = json.decode(response.body);
      return response.body;
    }else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      return errorMessage;
    }
  }

  ////////?Fetch Delivery Type//////////////////////
  Future<String> getDeliveryType() async {
    var client = http.Client();

    final baseUrl = Uri.parse("https://close2buy-dev.jurysoftprojects.com/api/get-delivery-types");

    var response = await client.get(baseUrl, headers: <String, String> {

    });
    print(
        "deivery-data----: ${response.statusCode} :${response.request} : ${response.body}"
    );
    if(response.statusCode == 200) {
      //final jsonResponse = json.decode(response.body);
      return response.body;
    }else {
      final jsonResponse = json.decode(response.body);
      final errorMessage = jsonResponse['message'];
      return errorMessage;
    }
  }
}