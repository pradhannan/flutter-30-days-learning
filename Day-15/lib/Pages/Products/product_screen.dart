import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/Pages/Products/productdetails.dart';
import 'package:my_trial_first_app/Responsive/responsive.dart';


import 'package:my_trial_first_app/config/app_color.dart';
import 'package:my_trial_first_app/Controllers/pagination_product_controller.dart';

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
        backgroundColor: AppColors.backgoundlightblue,
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
                                icon:  FaIcon(FontAwesomeIcons.magnifyingGlass, size: 18),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: Responsive.width(10)),
                        Container(
                          height: Responsive.height(55),
                          decoration: BoxDecoration(
                           // color: AppColors.greyblue,
                           border: Border.all(
                              color: AppColors.greyblue
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.tune),
                        ),
                      ],
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
              padding: EdgeInsets.symmetric(
                horizontal:Responsive.width(10),
                vertical:Responsive.height(10),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns in a vertical grid
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
                  mainAxisExtent: 280, 
              ),
              controller: _scrollController,
              itemCount: _paginationProductController.product.length + 1,

              itemBuilder: (BuildContext context, int index) {
                if (index == _paginationProductController.product.length) {
                  return Obx(
                    () => _paginationProductController.isMoreLoading.value
                        ? const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(child: CupertinoActivityIndicator()),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                       
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.network(
                              product.images.first,
                              
                          
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: double.infinity,
                                  
                          
                                  color: AppColors.backgoundlightblue,
                                  child: Icon(Icons.image),
                                );
                              },
                            ),
                          ),
                        
                      ),
                     InkWell(
                          onTap: () => Get.to(
                            () => ProductDetails(productId: product.id!),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                Text(
                                        product.title ?? "No Title",
                                        style: GoogleFonts.openSans(
                                          color: AppColors.darktextblue,
                                          fontSize: 14,
                                        ),
                                         maxLines: 1, // only show 1 line
                                        overflow: TextOverflow
                                            .ellipsis, 
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(height: Responsive.height(10),),
                            
                                        Text(
                                        product.description ?? 'No Description',
                                        maxLines: 2, // only show 1 line
                                        overflow: TextOverflow
                                            .fade, // adds "..." if text is too long,
                                        style: GoogleFonts.openSans(
                                          color: AppColors.darktextblue,
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                       SizedBox(height: Responsive.height(10),),
                            
                                       Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$" + "${product.price}",
                                            style: TextStyle(
                                              color: AppColors.darktextblue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                            
                                          ElevatedButton(
                                            onPressed: () => Get.toNamed('/cart'),
                            
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.backgoundlightblue,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadiusGeometry.circular(
                                                      8,
                                                    ),
                                              ),
                                            ),
                                            child: 
                            
                                                Icon(
                                                  Icons.shopping_cart,
                                                  color: AppColors.darktextblue,
                                                  size: 20,
                                                ),
                                              
                                            
                                          ),
                                        ],
                                      ),
                               ],
                            ),
                          ))
                          
                        
                      
                     
                      
                    ],
                  ),
                );
              },
            );
          }),
        
      
    );
  }
}
