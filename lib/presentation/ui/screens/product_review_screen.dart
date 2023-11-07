import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project_16/presentation/state_holders/product_review_controller.dart';
import 'package:get/get.dart';

import '../../state_holders/read_profile_controller.dart';
import '../utility/app_colors.dart';
import '../widgets/review_cart.dart';
import 'create_review_screen.dart';



class ProductReviewScreen extends StatefulWidget {
  final int productId;

  const ProductReviewScreen({super.key, required this.productId});

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<ProductReviewController>()
          .getProductReviews(widget.productId);
    });
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Review'),
      ),
      body: GetBuilder<ProductReviewController>(
          builder: (productReviewController) {
            if (productReviewController.getProductReviewInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: productReviewController
                          .productReviewModel.data?.length ??
                          0,
                      itemBuilder: (BuildContext context, int index) {
                        return ReviewsCard(
                          productReviewListData: productReviewController
                              .productReviewModel.data![index],
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reviews (${productReviewController.productReviewModel.data?.length ?? 0})',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black54),
                      ),
                      InkWell(
                        onTap: () async {
                          await Get.find<ReadProfileController>().readProfileData();
                          Get.to(() => CreateReviewScreen(
                            productId: widget.productId,
                          ));
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.primaryColor,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                            weight: 50,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}