import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:flutter/rendering.dart';

import 'package:get_storage/get_storage.dart';
import 'package:my_trial_first_app/Controllers/User/login_controller.dart';
import 'package:my_trial_first_app/Controllers/Notification/notification_controller.dart';

import 'package:my_trial_first_app/Responsive/responsive.dart';
import 'package:my_trial_first_app/Storage/get_storage.dart';
import 'package:my_trial_first_app/firebase_options.dart';
import 'package:my_trial_first_app/routes/app_pages.dart';
import 'package:my_trial_first_app/routes/app_routes.dart';




Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {

  
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessaging.onBackgroundMessage(
    firebaseMessagingBackgroundHandler,
  );

  await GetStorage.init();
  final token = TokenStorage.getAccessToken;
final userName = TokenStorage.getUserName;

String initialRoute= AppRoutes.splash;
if (token != null && userName != null) {
  initialRoute = AppRoutes.home; // user already logged in
} else {
  initialRoute = AppRoutes.login; // user not logged in
}
   Get.put(NotificationController());
   Get.put(LoginController());

// debugPaintSizeEnabled = true;
// debugPaintBaselinesEnabled = true;

  // WebViewPlatform.instance = WebWebViewPlatform(); 
runApp(MyApp(initialRoute: initialRoute));
  
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       builder: (context, child) {
        Responsive.init(context); 
        return child!;
       },
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
       getPages: AppPages.routes,
     // initialRoute: AppRoutes.splash,

      
      
      // routes: {
      //   '/':(context) =>WelcomePage(),
      //   '/login': (context)=>LoginPage(),
      //   '/signup':(context) =>SignupPage(),
      //   '/search':(context)=>Searchpage(),
      //   '/Navbar':(context)=>BottomNavBar(),
      //   '/products':(context)=>ProductScreen(),
      //   '/home':(context)=> Homepage(),

      //   '/cart':(context)=>Cartpage(),        
        
      // },

     

    );
  }
}
