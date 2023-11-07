import 'package:flutter_ecommerce_project_16/data/models/network_response.dart';
import 'package:flutter_ecommerce_project_16/data/models/product_model.dart';
import 'package:flutter_ecommerce_project_16/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';


//SRP = Single Responsibility Principle

class NewProductController extends GetxController {
  bool _getNewProductsInProgress = false;
  ProductModel _newProductModel = ProductModel();
  String _errorMessage = '';

  bool get getNewProductsInProgress => _getNewProductsInProgress;

  ProductModel get newProductModel => _newProductModel;

  String get errorMessage => _errorMessage;


  Future<bool> getNewProducts() async {
    _getNewProductsInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductsByRemarks('new'));
    _getNewProductsInProgress = false;
    if(response.isSuccess){
      _newProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'New product fetch failed! try again';
      update();
      return false;
    }
  }
}