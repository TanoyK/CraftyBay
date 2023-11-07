import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project_16/presentation/state_holders/cart_list_controller.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';



class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, required this.paymentUrl});

  final String paymentUrl;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _webViewController = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
  NavigationDelegate(
  onProgress: (int progress) {
  // Update loading bar.
  },
  onPageStarted: (String url) {
    // print('from onPageStarted');
    // print(url);
  },
  onPageFinished: (String url) {
    // print('from onPageFinished');
    // print(url);
  },
  onWebResourceError: (WebResourceError error) {},
  onNavigationRequest: (NavigationRequest request) {
    if(request.url.contains('tran_type=success')){
      Get.snackbar('Payment successful', 'Your order has been confirm',
      snackPosition: SnackPosition.BOTTOM);
      Get.find<CartListController>().getCartList();
      Get.back();
    }
  if (request.url.startsWith('https://www.youtube.com/')) {
  return NavigationDecision.prevent;
  }
  return NavigationDecision.navigate;
  },
  ),
  )
  ..loadRequest(Uri.parse(widget.paymentUrl));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: WebViewWidget(
        controller: _webViewController,
      ),
    );
  }
}
