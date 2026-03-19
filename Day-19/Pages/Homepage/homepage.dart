import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/Controllers/Products/product_controller.dart';
import 'package:my_trial_first_app/Controllers/User/login_controller.dart';
import 'package:my_trial_first_app/Navbar/bottom_nav_bar.dart';
import 'package:my_trial_first_app/Pages/Homepage/featuredlist.dart';
import 'package:my_trial_first_app/Pages/Products/productdetails.dart';
import 'package:my_trial_first_app/Responsive/responsive.dart';
import 'package:my_trial_first_app/Storage/get_storage.dart';
import 'package:my_trial_first_app/routes/app_routes.dart';
import 'package:my_trial_first_app/Theme/app_color.dart';
import 'package:get/route_manager.dart';
import 'package:my_trial_first_app/widgets/Buttons/custom_primarybutton.dart';
import 'package:my_trial_first_app/widgets/Buttons/custom_secondarybutton.dart';
import 'package:my_trial_first_app/widgets/Product/custom_productcard.dart';
import 'package:my_trial_first_app/widgets/App/Search/custom_searchbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final LoginController _loginController = Get.find<LoginController>();
  final ProductController _productController = Get.put(ProductController());
  final PageController controller = PageController();

  

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _productController.fetchProducts(); // explicitly call fetch
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: AppColors.backgoundlightblue,
        
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Obx(
                () => Text(
                  _loginController.name.value.isEmpty
                      ? 'Guest'
                      : _loginController.name.value,
                ),
              ),
              accountEmail: Obx(() => Text(_loginController.email.value)),
              currentAccountPicture: Obx(
                () => CircleAvatar(
                  // backgroundImage: _loginController.avatar.value.isEmpty
                  //     ? NetworkImage(
                  //        "",
                  //       )
                  //     : NetworkImage(_loginController.avatar.value)
                  //           as ImageProvider,
                  backgroundColor: Colors.grey.shade500,

                  backgroundImage: _loginController.avatar.value.isEmpty? null:
                  NetworkImage(_loginController.avatar.value),
                  
                ),
              ),
            ),
            DrawerItem(
              title: "Home",
              leading: Icon(Icons.home),
              onTap: () => Get.toNamed(AppRoutes.navbar[0]),
            ),
        DrawerItem(title: "Products", leading: Icon(Icons.shopping_bag), onTap: ()=> Get.toNamed(AppRoutes.products)),
        DrawerItem(title: "Cart", leading: Icon(Icons.shopping_cart), onTap: ()=> Get.toNamed(AppRoutes.cart)),
        DrawerItem(title: "Notifications", leading: Icon(Icons.notifications), onTap: ()=> Get.toNamed(AppRoutes.notification)),
        DrawerItem(title: "Profile", leading: Icon(Icons.person), onTap: ()=> Get.toNamed(AppRoutes.profile)),
        DrawerItem(title: "Logout", leading: Icon(Icons.logout), onTap: (){ _showLogoutDialog(context, _loginController);
          })



          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("HOME",style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold),),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: Responsive.height(20),left: Responsive.width(10),right: Responsive.width(10),),
              color: Colors.white,
              child: Column(
                children: [
                 Row(
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
                            Obx(()=>
                               Text(
                                 _loginController.name.isEmpty
                                    ? 'Guest'
                                    : _loginController.name.value,
                                style: GoogleFonts.openSans(
                                  color: AppColors.darktextblue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
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
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                             // color: AppColors.greyblue,
                              border: Border.all(
                              color: AppColors.greyblue
                            ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Get.toNamed(AppRoutes.notification);
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
                  
                  SizedBox(height: Responsive.height(30)),
                  CustomSearchbar(showCartIcon: false),
                 
                  SizedBox(height: Responsive.height(20)),
                  Row(
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
                  
                  SizedBox(height: Responsive.height(20)),
                  SizedBox(
                    height: Responsive.height(200),
                    child: Obx(()=>
                    _productController.product.isEmpty
    ? Center(child: CupertinoActivityIndicator()):
                      PageView.builder(
                        itemCount: 5,
                        controller: controller,
                        itemBuilder: (context, int index) {
                          final product = _productController.product[index];
                      
                          return GestureDetector(
                            onTap: () {},
                            child: Featuredlist(
                              title: product.title ?? 'No title',
                              description:
                                  product.description ?? 'No description',
                              images: product.images.first,
                              category: product.category?.name ?? 'Others',
                              onpressed: ()=> Get.to(() => ProductDetails(productId: product.id!)
                            ),
                          ));
                        },
                      ),
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
                horizontal: Responsive.width(10),
                vertical: Responsive.height(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'For You',
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
                : SliverPadding(
                  padding: EdgeInsets.symmetric(
                horizontal: Responsive.width(10),),
                  sliver: SliverGrid.builder(
                     
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns in a vertical grid
                  crossAxisSpacing: 10,
                   mainAxisSpacing: 10,
                  childAspectRatio: 1,
                    mainAxisExtent: 270, 
                                ),
                      itemCount: 10,
                  
                      itemBuilder: (context,  index) {
                        final product = _productController.product[index ];
                        return   CustomProductcard(product: product);
                      },
                    ),
                ),
          ),
        ],
      ),
    //  bottomNavigationBar: BottomNavBar(),
    );
  }
}

class DrawerItem extends StatelessWidget{
  final String title;
  final Icon leading;
  final VoidCallback onTap;

  const DrawerItem({super.key, required this.title, required this.leading, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: leading,
        title: Text(title,
         style: GoogleFonts.openSans(
        color: AppColors.darktextblue,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),),
        onTap: onTap,
    );
  }
}

void _showLogoutDialog(BuildContext context, LoginController _loginController){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      icon: Icon(Icons.logout),
      backgroundColor: AppColors.backgoundlightblue,
      title: Text("LOG OUT?", style: GoogleFonts.openSans(fontSize:18, fontWeight: FontWeight.bold),),
      content: Text("Are you sure you want to logout?",style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.normal),),
      actions: [
        
        CustomPrimarybutton(onPressed:()=> Navigator.pop(context), text : "Cancel now"),
        CustomPrimarybutton(text: "LOG OUT", onPressed: (){_loginController.token.value = '';
          _loginController.name.value = '';
          _loginController.email.value = '';
          _loginController.avatar.value = '';
          TokenStorage.clear();
          Get.offAllNamed('/login');} , )
      ],
      actionsAlignment: MainAxisAlignment.spaceBetween,
    );
  });
}