import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_trial_first_app/Controllers/product_search_controller.dart';
import 'package:my_trial_first_app/Pages/Products/productdetails.dart';
import 'package:my_trial_first_app/Responsive/responsive.dart';
import 'package:my_trial_first_app/config/app_color.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  final ProductSearchController searchController = Get.put(
    ProductSearchController(),
  );
  final TextEditingController searchctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: Responsive.width(20),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.darktextblue),
          onPressed: () => Get.back(),
        ),
         title: Row(
           children: [
             Expanded(
               child: Container(
                 height: Responsive.height(55),
                            decoration: BoxDecoration(
                              //color: AppColors.greyblue,
                               border: Border.all(
                              color: AppColors.greyblue
                            ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.only(
                              left: Responsive.width(10),
                            ),
                 child: TextField(
                  onChanged: (value) {
                    // Trigger search as user types
                    searchController.searchProducts(value);
                  },
                  onSubmitted: (value) => searchController.searchProducts(value),
                  controller: searchctrl,
                  decoration: InputDecoration(
                                hintText: 'Search a  product',
                                border: InputBorder.none,
                                icon: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 18),
                              ),
                         ),
               ),
             ),
              SizedBox(width: Responsive.width(10)),
                        Container(
                          height: Responsive.height(55),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.greyblue
                            ),
                            // color: AppColors.greyblue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.tune),
                        ),
                        SizedBox(width: Responsive.width(10)),
                        Container(
                          height: Responsive.height(55),
                          decoration: BoxDecoration(
                            // color: AppColors.greyblue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.shopping_cart_rounded),
                        ),
           ],
         ),
      ),
       
        body:  Obx(() {
      if (searchController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (searchController.products.isEmpty) {
        return const Center(child: Text("No results found"));
      } else {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: searchController.products.length,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final product = searchController.products[index];
            return ListTile(
              onTap: () {
    // Navigate to product details
    Get.to(() => ProductDetails(productId: product.id!));
  },
              leading: Image.network(
                product.images.isNotEmpty ? product.images.first : "",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product.title ?? "No Title"),
              subtitle: Text("\$${product.price}"),
            );
          },
        );
   } })
    );
  
  }
}
