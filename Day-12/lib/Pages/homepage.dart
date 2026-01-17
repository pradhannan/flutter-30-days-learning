import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/Controllers%20&%20client/product_controller.dart';
import 'package:my_trial_first_app/Pages/productdetails.dart';
import 'package:my_trial_first_app/config/app_color.dart';
import 'package:get/route_manager.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ProductController _productController = Get.put(ProductController());
  // @override
  // void initState() {
  //   super.initState();
  //   _productController.fetchProducts(); // explicitly call fetch
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Profile icon
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.navyblue,
                    ),
                    Text(
                      "HOME",
                      style: GoogleFonts.poppins(
                        color: AppColors.darktextblue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.notifications,
                        color: AppColors.navyblue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColors.backgoundlightblue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Banner / Promo",
                      style: GoogleFonts.openSans(
                        color: AppColors.darktextblue,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Explore",
                  style: GoogleFonts.openSans(
                    color: AppColors.darktextblue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                Obx(
                  () => _productController.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap:
                              true, // Makes ListView.builder take only the space it needs
                          physics:
                              NeverScrollableScrollPhysics(), // Prevent inner scroll
                          itemCount: _productController.product.length,

                          itemBuilder: (context, index) {
                            final product = _productController.product[index];

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Container(
                                height: 150, // increase height
                                decoration: BoxDecoration(
                                  color: AppColors.backgoundlightblue,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                   contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                  
                                  leading: Container(
                                     decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: AppColors.backgoundlightblue,
  ),
                                    width: 100,
                                    height: 350,
                                    child: Image.network(
                                      product.images.first, fit: BoxFit.contain,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Container(
                                          width: 100,
                                          height: 150,
                                    
                                          color: AppColors.backgoundlightblue,
                                          child: Icon(Icons.image),
                                        );
                                      },
                                    ),
                                  ),
                                  title: Text(
                                    product.title ?? "No Title",
                                    style: GoogleFonts.openSans(
                                      color: AppColors.darktextblue,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  subtitle: Text(
                                    product.description ?? 'No Description',
                                    maxLines: 1, // only show 1 line
                                    overflow: TextOverflow
                                        .ellipsis, // adds "..." if text is too long,
                                    style: GoogleFonts.openSans(
                                      color: AppColors.darktextblue,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  onTap: () {
                                    Get.to(
                                      () => ProductDetails(
                                        productId: product.id!,
                                      ),
                                    );
                                  },
                                  trailing: Container(
                                    width: 75,
                                    height: 75,
                                    
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,

                                   
                                    ),
                                    child:  Icon(Icons.arrow_forward),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
