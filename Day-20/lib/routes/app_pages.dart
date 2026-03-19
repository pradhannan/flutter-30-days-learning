
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_trial_first_app/Navbar/bottom_nav_bar.dart';
import 'package:my_trial_first_app/Pages/Homepage/homepage.dart';
import 'package:my_trial_first_app/Pages/Products/add_product_screen.dart';
import 'package:my_trial_first_app/Pages/Products/product_screen.dart';
import 'package:my_trial_first_app/Pages/SplashandOnboarding/onboarding.dart';
import 'package:my_trial_first_app/Pages/SplashandOnboarding/splash_screen.dart';
import 'package:my_trial_first_app/Pages/User/Profile/editprofile_page.dart';
import 'package:my_trial_first_app/Pages/User/LoginSignup/login_page.dart';
import 'package:my_trial_first_app/Pages/User/Notification/notification_page.dart';
import 'package:my_trial_first_app/Pages/User/Profile/profilepage.dart';
import 'package:my_trial_first_app/Pages/User/Setting/Help/accessibility.dart';
import 'package:my_trial_first_app/Pages/User/Setting/Others/aboutapp.dart';
import 'package:my_trial_first_app/Pages/User/Setting/Others/appversion.dart';
import 'package:my_trial_first_app/Pages/User/Setting/Others/sendfeedback.dart';
import 'package:my_trial_first_app/Pages/User/Setting/Others/webview.dart';
import 'package:my_trial_first_app/Pages/User/Setting/Page/setttingpage.dart';
import 'package:my_trial_first_app/Pages/User/LoginSignup/signup_page.dart';
import 'package:my_trial_first_app/Pages/User/CartandPayment/cartpage.dart';
import 'package:my_trial_first_app/Pages/User/Search/searchpage.dart';
import 'package:my_trial_first_app/Pages/SplashandOnboarding/welcomepage.dart';
import 'package:my_trial_first_app/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page:()=> SplashScreen()),
    GetPage(name: AppRoutes.onboard, page:()=> Onboarding()),

    GetPage(name: AppRoutes.login, page:()=> LoginPage()),
    GetPage(name: AppRoutes.signup, page:()=> SignupPage()),

    GetPage(name: AppRoutes.welcome, page: ()=> WelcomePage()),
    GetPage(name: AppRoutes.home, page:()=> Homepage()),
   
    GetPage(name: AppRoutes.search, page:()=> Searchpage()),
    GetPage(name: AppRoutes.navbar, page:()=> BottomNavBar()),

    GetPage(name: AppRoutes.products, page:()=> ProductScreen()),
    GetPage(name: AppRoutes.addproducts, page:()=> AddProductScreen()),

    GetPage(name: AppRoutes.profile, page: ()=> Profilepage()),
   GetPage(name: AppRoutes.settings, page: ()=> Setttingpage()),
    GetPage(name: AppRoutes.editprofile, page: ()=> EditprofilePage()),

    GetPage(name: AppRoutes.notification, page: ()=> NotificationPage()),

    GetPage(name: AppRoutes.cart, page: ()=> Cartpage()),

    GetPage(name: AppRoutes.accessibility, page:()=> AccessibilityPage()),

    //others
    GetPage(name: AppRoutes.appversion, page: ()=> AppVersionPage()),
    GetPage(name: AppRoutes.aboutapp, page: ()=>AboutAppPage()),
    GetPage(name: AppRoutes.sendfeedback, page: ()=>SendFeedbackPage()),
    GetPage(name: AppRoutes.privacypolicy, page: ()=>WebViewPage(url: "https://pradhannan.github.io/flutter-30-days-learning/privacy_policy.html", title: "PRIVACY POLICY",)),
    GetPage(name: AppRoutes.termsandconditions, page: ()=>WebViewPage(url: "https://pradhannan.github.io/flutter-30-days-learning/terms.html", title: "TERMS AND CONDITIONS",)),
    GetPage(name: AppRoutes.helpcenter, page: ()=> WebViewPage(url: "https://pradhannan.github.io/flutter-30-days-learning/help_center.html", title: "HELP CENTER"))

  ];
}