import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project_16/data/models/product_details.dart';
import 'package:flutter_ecommerce_project_16/presentation/state_holders/add_to_cart_controller.dart';
import 'package:flutter_ecommerce_project_16/presentation/state_holders/product_details_controller.dart';
import 'package:flutter_ecommerce_project_16/presentation/ui/screens/product_review_screen.dart';
import 'package:flutter_ecommerce_project_16/presentation/ui/utility/app_colors.dart';
import 'package:flutter_ecommerce_project_16/presentation/ui/widgets/custom_stepper.dart';
import 'package:flutter_ecommerce_project_16/presentation/ui/widgets/home/product_image_slider.dart';
import 'package:get/get.dart';

import '../../state_holders/create_wishlist_controller.dart';
import '../widgets/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.getProductDetailsInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ProductImageSlider(
                            imageList: [
                              productDetailsController.productDetails.img1 ??
                                  '',
                              productDetailsController.productDetails.img2 ??
                                  '',
                              productDetailsController.productDetails.img3 ??
                                  '',
                              productDetailsController.productDetails.img4 ??
                                  '',
                            ],
                          ),
                          productDetailsAppBar,
                        ],
                      ),
                      productDetails(productDetailsController.productDetails,
                          productDetailsController.availableColors),
                    ],
                  ),
                ),
              ),
              cartToCartBottomContainer(
                  productDetailsController.productDetails,
                  productDetailsController.availableColors,
                  productDetailsController.availableSizes),
            ],
          ),
        );
      }),
    );
  }

  Padding productDetails(ProductDetails productDetails, List<String> colors) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  productDetails.product!.title ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              CustomStepper(
                  lowerLimit: 1,
                  upperLimit: 10,
                  stepValue: 1,
                  value: 1,
                  onChange: (newvalue) {
                   quantity = newvalue;
                  }),
            ],
          ),
          Row(
            children: [
              Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
                const Icon(
                  Icons.star,
                  size: 18,
                  color: Colors.amber,
                ),
                Text(
                  '${productDetails.product!.star ?? 0}',
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey,
                  ),
                ),
              ]),
              TextButton(
                onPressed: () {
                  Get.to(() =>  ProductReviewScreen(productId: widget.productId,));
                },
                child: Text(
                  'Review',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              GetBuilder<CreateWishListController>(
                  builder: (createWishListController) {
                return InkWell(
                  onTap: () {
                    createWishListController
                        .setProductInWishList(productDetails.productId!)
                        .then((value) => {
                              if (value == true)
                                {
                                  if (mounted)
                                    {
                                      Get.snackbar(
                                        'success',
                                        "Product added to wish list \nsuccessfully",
                                      )
                                    }
                                }
                              else
                                {
                                  if (mounted)
                                    {
                                      Get.snackbar(
                                        'Failed',
                                        "Product added to wish list failed",
                                      )
                                    }
                                }
                            });
                  },
                  child: Card(
                          color: AppColors.primaryColor,
                          child: const Padding(
                            padding: EdgeInsets.all(.0),
                            child: Icon(
                              Icons.favorite_border,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                                  ),
                    );
                  }
              ),
            ],
          ),
          const Text(
            'Color',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 28,
            child: SizedBox(
              height: 28,
              child: SizePicker(
                initialSelected: 0,
                onSelected: (int selectedColor) {
                  _selectedColorIndex = selectedColor;
                },
                sizes: productDetails.color?.split(',') ?? [],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Size',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 28,
            child: SizedBox(
              height: 28,
              child: SizePicker(
                initialSelected: 0,
                onSelected: (int selectedSize) {
                  _selectedSizeIndex = selectedSize;
                },
                sizes: productDetails.size?.split(',') ?? [],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(productDetails.des ?? ''),
        ],
      ),
    );
  }

  AppBar get productDetailsAppBar {
    return AppBar(
      leading: const BackButton(
        color: Colors.black54,
      ),
      title: const Text(
        'Product details',
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Container cartToCartBottomContainer(
      ProductDetails details, List<String> colors, List<String> sizes) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Price',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '\$240',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                width: 120,
                child: GetBuilder<AddToCartController>(
                    builder: (addToCartController) {
                  if (addToCartController.addToCartInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ElevatedButton(
                    onPressed: () async {
                      final result = await addToCartController.addToCart(
                        details.id!,
                        colors[_selectedColorIndex].toString(),
                        sizes[_selectedSizeIndex],
                        quantity,
                      );
                      if (result) {
                        Get.snackbar('Added to cart',
                            'This product has been added to cart list',
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                    child: const Text('Add to cart'),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
