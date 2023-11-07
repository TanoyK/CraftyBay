import 'package:flutter_ecommerce_project_16/data/models/network_response.dart';
import 'package:flutter_ecommerce_project_16/data/models/product_model.dart';
import 'package:flutter_ecommerce_project_16/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';


//SRP = Single Responsibility Principle

class PopularProductController extends GetxController {
  bool _getPopularProductsInProgress = false;
  ProductModel _popularProductModel = ProductModel();
  String _errorMessage = '';

  bool get getPopularProductsInProgress => _getPopularProductsInProgress;

  ProductModel get popularProductModel => _popularProductModel;

  String get errorMessage => _errorMessage;


  Future<bool> getPopularProducts() async {
    _getPopularProductsInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductsByRemarks('popular'));
    _getPopularProductsInProgress = false;
    if(response.isSuccess){
      _popularProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'Popular product fetch failed! try again';
      update();
      return false;
    }
  }
}