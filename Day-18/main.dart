import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:flutter/rendering.dart';

import 'package:get_storage/get_storage.dart';
import 'package:my_trial_first_app/Controllers/notification_controller.dart';

import 'package:my_trial_first_app/Responsive/responsive.dart';
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
   Get.put(NotificationController());

// debugPaintSizeEnabled = true;
// debugPaintBaselinesEnabled = true;
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       builder: (context, child) {
        Responsive.init(context); 
        return child!;
       },
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      
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

      getPages: AppPages.routes,

    );
  }
}
