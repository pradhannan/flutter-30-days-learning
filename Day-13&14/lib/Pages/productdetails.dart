import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:my_trial_first_app/Controllers/product_controller.dart';
import 'package:my_trial_first_app/config/app_color.dart';

class ProductDetails extends StatefulWidget {
  final int productId;

  const ProductDetails({super.key, required this.productId});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final ProductController controller = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    controller.fetchProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.backgoundlightblue,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.navyblue,
            size: 25,
          ),
        ),
        title: Obx(
          () => Text(
            controller.productDescription.value?.title ?? "Loading...",
            style: GoogleFonts.openSans(
              color: AppColors.darktextblue,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Obx(() {
            final product = controller.productDescription.value;
            if (product == null) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,

                  height: MediaQuery.of(context).size.height * 0.5,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.backgoundlightblue,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      product.images.isNotEmpty ? product.images.first : "",
                      fit: BoxFit.fill, // full image visible
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.image,
                            size: 50,
                            color: AppColors.navyblue,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                 const SizedBox(height: 20),

                  // Title
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          product.title ?? "No Title",
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darktextblue,
                          ),
                        ),

                        SizedBox(height: 10),

                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product.price}",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.navyblue,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.navyblue,
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Add to Cart",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
const SizedBox(height: 20),
 Text(
                    product.description ?? "No Description",
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: AppColors.darktextblue,
                    ),
                  ),
                      ],
                    ),
                     

                  // Description
                 
                  ),

                  
                       
                 
              ],
            );
          }),
        ),
      ),
    );
  }
}
