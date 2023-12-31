import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project_16/presentation/state_holders/auth_controller.dart';
import 'package:flutter_ecommerce_project_16/presentation/state_holders/category_controller.dart';
import 'package:flutter_ecommerce_project_16/presentation/state_holders/home_slider_controller.dart';
import 'package:flutter_ecommerce_project_16/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:flutter_ecommerce_project_16/presentation/state_holders/popular_product_controller.dart';
import 'package:flutter_ecommerce_project_16/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:flutter_ecommerce_project_16/presentation/ui/screens/product_list_screen.dart';
import 'package:flutter_ecommerce_project_16/presentation/ui/utility/image_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../state_holders/new_product_controller.dart';
import '../../state_holders/read_profile_controller.dart';
import '../../state_holders/special_product_controller.dart';
import '../widgets/CircularIconButton.dart';
import '../widgets/category_card.dart';
import '../widgets/home/home_slider.dart';
import '../widgets/home/section_header.dart';
import '../widgets/product_card.dart';
import 'auth/update_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              SvgPicture.asset(ImageAssets.craftyBayNavLogoSVG),
              const Spacer(),
              CircularIconButton(
                icon: Icons.light_mode_outlined,
                onTap: () {
                //  themeModeController.toggleThemeMode();
                  if(Get.isDarkMode){
                   Get.changeThemeMode(ThemeMode.light);
                  } else {
                    Get.changeThemeMode(ThemeMode.dark);
                  }
                },
              ),
              const SizedBox(
                width: 8,
              ),
              CircularIconButton(
                icon: Icons.person,
                onTap: ()  async {
                  await Get.find<ReadProfileController>().readProfileData();
                  Get.to(() => const UpdateProfileScreen());
                },
              ),
              const SizedBox(
                width: 8,
              ),
              CircularIconButton(
                icon: Icons.call,
                onTap: () {
                  const Text('Call Tanoy');
                  launchUrlString("tel:${008801914980970}");
                },
              ),
              const SizedBox(
                width: 8,
              ),
              CircularIconButton(
                icon: Icons.notifications_none,
                onTap: () {},
              ),
              const SizedBox(
                width: 8,
              ),
              CircularIconButton(
                icon: Icons.logout_outlined,
                onTap: () async {
                  await AuthController.clear();
                  await AuthController.getAccessToken();
                  Get.snackbar('Success', 'Logout successful',
                  borderRadius: 10,
                  snackPosition: SnackPosition.BOTTOM);
                  Get.offAll(() => const EmailVerificationScreen());
                },
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<HomeSlidersController>(
                  builder: (homeSliderController) {
                if (homeSliderController.getHomeSlidersInProgress) {
                  return const SizedBox(
                    height: 180,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return HomeSlider(
                  sliders: homeSliderController.sliderModel.data ?? [],
                );
              }),
              SectionHeader(
                title: 'Categories',
                onTap: () {
                  Get.find<MainBottomNavController>().changeScreen(1);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 90,
                child: GetBuilder<CategoryController>(
                    builder: (categoryController) {
                  if (categoryController.getCategoriesInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      itemCount:
                          categoryController.categoriesModel.data?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          categoryData:
                              categoryController.categoriesModel.data![index],
                          onTap: () {
                            Get.to(ProductListScreen(
                              categoryId: categoryController
                                  .categoriesModel.data![index].id!,
                            ));
                          },
                        );
                      });
                }),
              ),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'Popular',
                onTap: () {
                  Get.to(ProductListScreen(
                    productModel: Get.find<PopularProductController>()
                        .popularProductModel,
                  ));
                },
              ),
              SizedBox(
                height: 165,
                child: GetBuilder<PopularProductController>(
                    builder: (popularProductController) {
                  if (popularProductController.getPopularProductsInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularProductController
                              .popularProductModel.data?.length ??
                          0,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: popularProductController
                              .popularProductModel.data![index],
                        );
                      });
                }),
              ),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'Special',
                onTap: () {
                  Get.to(ProductListScreen(
                    productModel: Get.find<SpecialProductController>()
                        .specialProductModel,
                  ));
                },
              ),
              SizedBox(
                height: 165,
                child: GetBuilder<SpecialProductController>(
                  builder: (specialProductController) {
                    if (specialProductController.getSpecialProductsInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: specialProductController
                                .specialProductModel.data?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            product: specialProductController
                                .specialProductModel.data![index],
                          );
                        });
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'New',
                onTap: () {
                  Get.to(ProductListScreen(
                    productModel:
                        Get.find<NewProductController>().newProductModel,
                  ));
                },
              ),
              SizedBox(
                height: 165,
                child: GetBuilder<NewProductController>(
                  builder: (newProductController) {
                    if (newProductController.getNewProductsInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            newProductController.newProductModel.data?.length ??
                                0,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            product: newProductController
                                .newProductModel.data![index],
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
