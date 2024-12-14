import 'package:flutter/material.dart';
import 'package:flutter_main_exam/model/productmodel.dart';
import 'package:flutter_main_exam/model/singleProduct_model.dart';
import 'package:http/http.dart' as http;

class ProductScreenController extends ChangeNotifier {
  bool isLoading = false;
  List<ProductModel> productModel = [];
  ProductDetail? selectedProduct;

  Future<void> fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse('https://api.restful-api.dev/objects');
    var resonse = await http.get(url);
    try {
      if (resonse.statusCode == 200) {
        productModel = productModelFromJson(resonse.body);
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getProductDetails(String id) async {
    final url = Uri.parse('https://api.restful-api.dev/objects/$id');
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        selectedProduct = productDetailFromJson(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
