
import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';



class CreateReviewController extends GetxController {
  bool _createReviewInProgress = false;
  String _message = '';

  bool get createReviewInProgress => _createReviewInProgress;

  String get message => _message;

  Future<bool> createReview(
      String description, int productId, double rating) async {
    _createReviewInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
        Urls.createProductReview, {
      "description": description,
      "product_id": productId,
      "rating": rating
    });
    _createReviewInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Create review failed! Try again';
      return false;
    }
  }
}