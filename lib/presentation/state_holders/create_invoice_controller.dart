
import 'package:flutter_ecommerce_project_16/data/models/invoice_create_response_model.dart';
import 'package:get/get.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class CreateInvoiceController extends GetxController {

  bool _invoiceInProgress = false;
  String _message = '';

  InvoiceCreateResponseModel _invoiceCreateResponseModel = InvoiceCreateResponseModel();

  bool get invoiceInProgress => _invoiceInProgress;

  String get message => _message;

  InvoiceCreateData? get invoiceCreateResponseModel => _invoiceCreateResponseModel.data?.first;

  Future<bool> createInvoice() async {
    _invoiceInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.createInvoice,);
    _invoiceInProgress = false;
    update();
    if(response.isSuccess /*&& response.responseJson!['msg'] == ' success'*/){
      _invoiceCreateResponseModel = InvoiceCreateResponseModel.fromJson(response.responseJson!);
      return true;
    } else {
      _message = 'Invoice creation failed! Try again';
      return false;
    }
  }
}