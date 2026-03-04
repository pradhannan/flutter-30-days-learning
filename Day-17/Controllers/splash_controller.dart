import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:my_trial_first_app/routes/app_routes.dart';

class SplashController extends GetxController{
  
  @override
  void onInit(){
    super.onInit();
    _navigateToNext();
  }

  void _navigateToNext() async{
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed(AppRoutes.onboard);
  }
}