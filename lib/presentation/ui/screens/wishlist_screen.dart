


import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project_16/presentation/ui/screens/product_details_screen.dart';
import 'package:get/get.dart';

import '../../state_holders/main_bottom_nav_controller.dart';
import '../../state_holders/wishlist_controller.dart';
import '../widgets/wishlist_product_card.dart';



class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<WishListScreenController>().getWishlistProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text( 'Wishlist'),
        ),

        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(kToolbarHeight),
        //   child: AppBar(
        //     title: 'WishList',
        //     elevation: 1,
        //   ),
        //),
        body: GetBuilder<WishListScreenController>(
            builder: (wishListScreenController) {
              if (wishListScreenController.getWishListProductsInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (wishListScreenController.wishListProductModel.data != null &&
                  wishListScreenController.wishListProductModel.data!.isEmpty) {
                return const Center(
                  child: Text('WishList is empty!'),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  itemCount:
                  wishListScreenController.wishListProductModel.data?.length ??
                      0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ProductDetailsScreen(
                          productId: wishListScreenController
                              .wishListProductModel.data![index].productId!,
                        ));
                      },
                      child: FittedBox(
                        child: WishListProductCard(
                          productData: wishListScreenController
                              .wishListProductModel.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
      ),
    );
  }
}