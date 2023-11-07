import 'package:flutter_ecommerce_project_16/data/models/category_model.dart';
import 'package:flutter_ecommerce_project_16/data/models/network_response.dart';
import 'package:flutter_ecommerce_project_16/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class CategoryController extends GetxController{
  bool _getCategoriesInProgress = false;
  CategoryModel _categoryModel = CategoryModel();
  String _message = '';

  CategoryModel get categoriesModel => _categoryModel;

  bool get getCategoriesInProgress => _getCategoriesInProgress;

  String get message => _message;

  Future<bool> getCategories() async {
    _getCategoriesInProgress = true;
    update();
    final NetworkResponse response =await NetworkCaller.getRequest(Urls.getCategories);
    _getCategoriesInProgress = false;
    if(response.isSuccess){
      _categoryModel = CategoryModel.fromJson(response.responseJson ?? {} );
      update();
      return true;
    } else {
      _message = 'Category list data fetch failed';
      update();
      return false;
    }
  }
}