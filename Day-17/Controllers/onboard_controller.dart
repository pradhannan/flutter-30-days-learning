import 'package:get/get.dart';
import 'package:my_trial_first_app/routes/app_routes.dart';

class OnboardController extends GetxController{
  var pageIndex= 0.obs;

  void nextPage(){
    if(pageIndex.value<2){
      pageIndex.value++;
    }
    else{
      Get.offNamed(AppRoutes.welcome);
    }
  }

}