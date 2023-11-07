import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project_16/data/models/payment_method.dart';
import 'package:flutter_ecommerce_project_16/presentation/state_holders/create_invoice_controller.dart';
import 'package:flutter_ecommerce_project_16/presentation/ui/screens/webview_screen.dart';
import 'package:get/get.dart';


class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {

  bool isCompleted = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CreateInvoiceController>().createInvoice()
          .then((value){
        isCompleted = value;
        if (mounted) {
          setState(() {});
        }
     });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Out'),
      ),
      body: GetBuilder<CreateInvoiceController>(
        builder: (createInvoiceController) {
          if(createInvoiceController.invoiceInProgress){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(!isCompleted){
            return const Center(
              child: Text('Please complete your profile first'),
            );
          }
          return ListView.separated(
              itemCount: createInvoiceController.invoiceCreateResponseModel?.paymentMethod?.length ?? 0,
              itemBuilder:(context, index){
                final PaymentMethod paymentMethod = createInvoiceController.invoiceCreateResponseModel!.paymentMethod![index];
                return ListTile(
                  leading: Image.network(paymentMethod.logo ?? '', width: 60,),
                  title: Text(paymentMethod.name ?? ''),
                  onTap: (){
                    Get.off(() => WebViewScreen(paymentUrl: paymentMethod.redirectGatewayURL!));
                  },
                );
              },
              separatorBuilder: (_, __) => const Divider(),
          );
        }
      ),
    );
  }
}
