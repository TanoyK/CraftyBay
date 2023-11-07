
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project_16/presentation/state_holders/category_controller.dart';
import 'package:flutter_ecommerce_project_16/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:flutter_ecommerce_project_16/presentation/ui/screens/product_list_screen.dart';
import 'package:flutter_ecommerce_project_16/presentation/ui/widgets/category_card.dart';
import 'package:get/get.dart';



class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Categories', style:  TextStyle(
            color: Colors.black,
          ),),
          elevation: 0,
          leading: IconButton(
            onPressed: (){
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black54,),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryController>().getCategories();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GetBuilder<CategoryController>(
              builder: (categoryController) {
                if(categoryController.getCategoriesInProgress){
                  return const SizedBox(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return GridView.builder(
                  itemCount: categoryController.categoriesModel.data?.length ?? 0,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index){
                    return FittedBox(
                      child: CategoryCard(
                        categoryData:
                            categoryController.categoriesModel.data![index],
                        onTap: () {
                          Get.to(ProductListScreen(
                              categoryId: categoryController
                                  .categoriesModel.data![index].id!));
                        },
                      ),
                    );
                  });
              }
            ),
          ),
        ),
      ),
    );
  }
}
