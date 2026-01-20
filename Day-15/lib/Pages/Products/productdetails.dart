import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:my_trial_first_app/Controllers/product_controller.dart';
import 'package:my_trial_first_app/Responsive/responsive.dart';
import 'package:my_trial_first_app/config/app_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetails extends StatefulWidget {
  final int productId;

  const ProductDetails({super.key, required this.productId});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final ProductController controller = Get.put(ProductController());
 final PageController pageController= PageController();
  @override
  void initState() {
    super.initState();
    controller.fetchProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: Responsive.width(20),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.darktextblue),
          onPressed: () => Get.back(),
        ),
        
        title:  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Responsive.width(8),
                    ),
                    child: Row(
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
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Obx((){
           final product = controller.productDescription.value;
            if (product == null) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: Responsive.height(450),
                      width: double.infinity,
                      decoration: BoxDecoration(

                      ),
                  child:PageView.builder(
                    controller: pageController,
                    itemCount: product.images.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                          product.images.isNotEmpty ? product.images[index] : "",
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
                        );
                    }
                  ),

                ),
                
                Container(
                  height: Responsive.height(40),
                  color: Colors.white,
                  width: double.infinity,
                  child: Center(
                    child: SmoothPageIndicator(
                        controller: pageController,
                        count:  product.images.length,
                        effect: ScrollingDotsEffect(
                          activeDotColor: Colors.green,
                          dotWidth: 10,
                          dotHeight: 10,
                          dotColor: Colors.grey.shade300,
                        ),
                      ),
                  ),
                ),
                
                
                  SizedBox(height: Responsive.height(10)),
                 Container(
                  width: double.infinity,
                  color: Colors.white,
                  
                   padding: const EdgeInsets.all(16.0),
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                               
                 Text(
                          product.title ?? "No Title",
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darktextblue,
                          ),
                        ),
                           SizedBox(height: Responsive.height(20)),
                            Text(
                              "\$${product.price}",
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                
                                fontWeight: FontWeight.bold,
                                color: AppColors.navyblue,
                              ),
                            ),
                      

                      
                       Text("Product Details",
                       style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                           
                          ),
                       ),
                        SizedBox(height: Responsive.height(20), child: Divider(
                          color: Colors.grey,
                        ),),
                       Text("Cateogory : ${product.category?.name?? "Not specified"}",
                       style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                           
                          ),
                       ),
                      
                        SizedBox(height: Responsive.height(10),),

                       Text("Description",
                       style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                           
                          ),
                       ),
                          SizedBox(height: Responsive.height(10)),
                       Text(
                    product.description ?? "No Description",
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      color: AppColors.darktextblue,
                    ),
                  ),
                     
                       
                       
                    ],
                  ),
                 ),
                  

              ],
            );
        })
          
      )),
      bottomNavigationBar: Container(
        color: Colors.white,
        width: double.infinity,
        height: 50,
        child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.backgoundlightblue
        ),
         child: Text("Add to cart")
         ),
      
      )
     
    );
  }
}
