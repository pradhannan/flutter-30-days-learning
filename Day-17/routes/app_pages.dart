
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_trial_first_app/Navbar/bottom_nav_bar.dart';
import 'package:my_trial_first_app/Pages/Homepage/homepage.dart';
import 'package:my_trial_first_app/Pages/Products/add_product_screen.dart';
import 'package:my_trial_first_app/Pages/Products/product_screen.dart';
import 'package:my_trial_first_app/Pages/SplashandOnboarding/onboarding.dart';
import 'package:my_trial_first_app/Pages/SplashandOnboarding/splash_screen.dart';
import 'package:my_trial_first_app/Pages/User/editprofile_page.dart';
import 'package:my_trial_first_app/Pages/User/login_page.dart';
import 'package:my_trial_first_app/Pages/User/profilepage.dart';
import 'package:my_trial_first_app/Pages/User/signup_page.dart';
import 'package:my_trial_first_app/Pages/searchpage.dart';
import 'package:my_trial_first_app/Pages/welcomepage.dart';
import 'package:my_trial_first_app/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page:()=> SplashScreen()),
    GetPage(name: AppRoutes.login, page:()=> LoginPage()),
    GetPage(name: AppRoutes.onboard, page:()=> Onboarding()),
    GetPage(name: AppRoutes.welcome, page: ()=> WelcomePage()),
    GetPage(name: AppRoutes.home, page:()=> Homepage()),
    GetPage(name: AppRoutes.signup, page:()=> SignupPage()),
    GetPage(name: AppRoutes.search, page:()=> Searchpage()),
    GetPage(name: AppRoutes.navbar, page:()=> BottomNavBar()),
    GetPage(name: AppRoutes.products, page:()=> ProductScreen()),
    GetPage(name: AppRoutes.addproducts, page:()=> AddProductScreen()),
    GetPage(name: AppRoutes.profile, page: ()=> Profilepage()),

    GetPage(name: AppRoutes.editprofile, page: ()=> EditprofilePage())

  ];
}