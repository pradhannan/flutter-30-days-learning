import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_trial_first_app/Pages/cartpage.dart';
import 'package:my_trial_first_app/Pages/homepage.dart';
import 'package:my_trial_first_app/Pages/profilepage.dart';
import 'package:my_trial_first_app/Pages/searchpage.dart';
import 'package:my_trial_first_app/config/app_color.dart';
import 'package:my_trial_first_app/config/navbar_contoller.dart';
import 'package:my_trial_first_app/pagination_product_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavbarContoller navbarContoller =  Get.put(NavbarContoller());
    final pages = [
     const Homepage(),
      PaginationProductScreen(),
     const Cartpage(),
     const Profilepage(),
    ];
    return Obx(() => Scaffold(
      body: pages[navbarContoller.index.value],
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: navbarContoller.changeIndex,
        backgroundColor: AppColors.backgoundlightblue,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house,color: AppColors.buttonblue,),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.productHunt,color: AppColors.buttonblue,),
            label: "Product",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.cartShopping,color: AppColors.buttonblue,),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user,color: AppColors.buttonblue,),
            label: "Profile",
          ),
        ],
      ),
    )
    );
  }
}
