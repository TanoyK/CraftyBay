import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/product_details.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';



class CreateWishListController extends GetxController {
  String _message = '';
  String get message => _message;

  bool _createWishListInProgress = false;
  bool get createWishListInProgress => _createWishListInProgress;

  ProductDetails _createProductWishList = ProductDetails();
  ProductDetails get createProductWishListModel => _createProductWishList;

  Future<bool> setProductInWishList(int productId) async {

    _createWishListInProgress = true;
    update();

    final NetworkResponse response =
    await NetworkCaller.getRequest(Urls.createProductWishList(productId));
    _createWishListInProgress = false;
    update();
    if (response.isSuccess) {
      _createProductWishList =  ProductDetails.fromJson(response.responseJson ?? {});
      return true;
    } else {
      _message = 'Set product wishList failed! Try again';
      return false;
    }
  }

  Future<bool> removeWishList(int productId) async {
    _createWishListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.removeWishlistProduct(productId));
    _createWishListInProgress = false;
    update();
    if (response.isSuccess) {
      _createProductWishList = ProductDetails.fromJson(response.responseJson ?? {});
      return true;
    } else {
      _message = 'Remove wish list data failed! Try again';
      return false;
    }
  }

}