import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/Pages/productdetails.dart';

import 'package:my_trial_first_app/config/app_color.dart';
import 'package:my_trial_first_app/pagination_product_controller.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final PaginationProductController _paginationProductController = Get.put(
    PaginationProductController(),
  );
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose(); //always declared below
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        _paginationProductController.fetchProducts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Products",
          style: GoogleFonts.openSans(
            color: AppColors.darktextblue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: 
            
            Obx(() {
              if (_paginationProductController.isLoading.value &&
                  _paginationProductController.product.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
            
              return GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns in a vertical grid
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                controller: _scrollController,
                itemCount: _paginationProductController.product.length + 1,
            
                itemBuilder: (BuildContext context, int index) {
                  if (index == _paginationProductController.product.length) {
                    return Obx(
                      () => _paginationProductController.isMoreLoading.value
                          ? const Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : const SizedBox(),
                    );
                  }
                  final product = _paginationProductController.product[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.network(
                            product.images.first,
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: double.infinity,
                                height: 100,
            
                                color: AppColors.backgoundlightblue,
                                child: Icon(Icons.image),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: InkWell(
                            onTap: () => Get.to(
                              () => ProductDetails(productId: product.id!),
                            ),
                            child: Text(
                              product.title ?? "No title",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.openSans(
                                color: AppColors.textblue,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${product.price}", // or whatever currency
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.darktextblue, // makes it pop
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
            
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.buttonblue,
                                  elevation: 2,
                                  
            
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Text(
                                  "Add to Cart",
                                  style: GoogleFonts.openSans(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
         
    );
  }
}
