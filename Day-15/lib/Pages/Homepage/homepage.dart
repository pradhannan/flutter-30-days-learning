import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/Controllers/product_controller.dart';
import 'package:my_trial_first_app/Pages/Homepage/featuredlist.dart';
import 'package:my_trial_first_app/Pages/Products/productdetails.dart';
import 'package:my_trial_first_app/Responsive/responsive.dart';
import 'package:my_trial_first_app/config/app_color.dart';
import 'package:get/route_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ProductController _productController = Get.put(ProductController());
  final PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   _productController.fetchProducts(); // explicitly call fetch
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: Responsive.height(20)),
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Responsive.width(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "WELCOME!",
                              style: GoogleFonts.openSans(
                                color: AppColors.darktextblue,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "User",
                              style: GoogleFonts.openSans(
                                color: AppColors.darktextblue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Badge(
                          label: Text(
                            '0',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.greyblue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Get.snackbar(
                                  "Notifications",
                                  "No new notifications yet",
                                );
                              },
                              icon: Icon(
                                Icons.notifications,
                                color: AppColors.darktextblue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Responsive.height(30)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Responsive.height(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                             height: Responsive.height(55),
                            decoration: BoxDecoration(
                              color: AppColors.greyblue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.only(
                              left: Responsive.width(20),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search a  product',
                                border: InputBorder.none,
                                icon: Icon(Icons.search),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: Responsive.width(15)),
                        Container(
                           height: Responsive.height(55),
                          decoration: BoxDecoration(
                            color: AppColors.greyblue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.tune),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Responsive.height(20)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Responsive.height(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Featured Products",
                          style: GoogleFonts.openSans(
                            color: AppColors.darktextblue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "see more...",
                          style: GoogleFonts.openSans(
                            color: AppColors.darktextblue,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Responsive.height(20)),
                  SizedBox(
                    height: Responsive.height(200),
                    child: PageView.builder(
                      itemCount: 5,
                      controller: controller,
                      itemBuilder: (context, index) {
                        final product = _productController.product[index];

                        return GestureDetector(
                          onTap: () {},
                          child: Featuredlist(
                            title: product.title ?? 'No title',
                            description:
                                product.description ?? 'No description',
                            images: product.images.first,
                            category: product.category?.name ?? 'Others',
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: Responsive.height(20)),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 5,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.green,
                      dotWidth: 10,
                      dotHeight: 10,
                      dotColor: Colors.grey.shade300,
                    ),
                  ),
                  SizedBox(height: Responsive.height(20)),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.width(20),
                vertical: Responsive.height(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Products',
                    style: TextStyle(
                      color: AppColors.darktextblue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/products');
                    },
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: AppColors.darktextblue,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => _productController.isLoading.value
                ? SliverToBoxAdapter(
                    child: Center(child: CupertinoActivityIndicator()),
                  )
                : SliverList.builder(
                    itemCount: 10,

                    itemBuilder: (context, index) {
                      final product = _productController.product[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => ProductDetails(productId: product.id!));
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(
                            right: 20,
                            left: 20,
                            bottom: 20,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.backgoundlightblue,
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.backgoundlightblue,
                                ),
                                width: Responsive.width(100),
                                height: Responsive.height(80),

                                child: Image.network(
                                  product.images.first,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: Responsive.width(100),
                                      height: Responsive.height(80),

                                      color: AppColors.backgoundlightblue,
                                      child: Icon(Icons.image),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: Responsive.width(15)),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title ?? "No Title",
                                      style: GoogleFonts.openSans(
                                        color: AppColors.darktextblue,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),

                                    Text(
                                      product.description ?? 'No Description',
                                      maxLines: 1, // only show 1 line
                                      overflow: TextOverflow
                                          .ellipsis, // adds "..." if text is too long,
                                      style: GoogleFonts.openSans(
                                        color: AppColors.darktextblue,
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
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
                                          child: Row(
                                            children: [
                                              Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                  color: AppColors.darktextblue,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(width: 2),

                                              Icon(
                                                Icons.shopping_cart,
                                                color: AppColors.darktextblue,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
