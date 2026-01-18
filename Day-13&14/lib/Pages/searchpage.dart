import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trial_first_app/Controllers/product_search_controller.dart';
import 'package:my_trial_first_app/Pages/productdetails.dart';
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
      appBar: AppBar(
         title: TextField(
          onChanged: (value) {
            // Trigger search as user types
            searchController.searchProducts(value);
          },
          onSubmitted: (value) => searchController.searchProducts(value),
          controller: searchctrl,
          decoration: InputDecoration(
            hintText: 'Search products',

            hintStyle: TextStyle(color: AppColors.greyblue),
            prefixIcon: Icon(Icons.search, color: AppColors.greyblue),
            filled: true,
            fillColor: AppColors.backgoundlightblue,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color.fromARGB(255, 172, 204, 255),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16),
            ), //Adds a border around text field
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.buttonblue, width: 2),
            ),
          ),
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
