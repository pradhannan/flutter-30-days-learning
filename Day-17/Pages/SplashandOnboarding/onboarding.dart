import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/Controllers/onboard_controller.dart';
import 'package:my_trial_first_app/Responsive/responsive.dart';
import 'package:my_trial_first_app/routes/app_routes.dart';
import 'package:my_trial_first_app/widgets/App/app_color.dart';
import 'package:my_trial_first_app/widgets/Buttons/custom_secondarybutton.dart';

class Onboarding extends StatelessWidget {
  final OnboardController controller = Get.put(OnboardController());
   Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "Discover Your Style",
      "Make It Your Own",
      "Shop with Confidence"
    ];
    final List<String> subtitles = [
      "Browse thousands of trendy products and find pieces that speak to your personality.",
      "Mix, match, and create outfits that reflect your unique taste! Just your style, your rules.",
      "Now it's time, join us and start exploring your own style ❤️"
    ];
    final List<String> images = [
      'assets/onboarding1.jpg',
      'assets/onboarding2.jpg',
      'assets/onboarding3.jpg'
    ];

    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        
        child: Obx(
          ()=> Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Image.asset(images[controller.pageIndex.value],),),
                 SizedBox(height: Responsive.height(20),),
                Text(titles[controller.pageIndex.value],
                style: GoogleFonts.roboto(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1
                 
                  
            
                ),
                ),
                SizedBox(height: Responsive.height(40),),
                Text(subtitles[controller.pageIndex.value],
                 style: GoogleFonts.openSans(
                  fontSize: 20,
                 
                  fontWeight: FontWeight.normal,
            
                )
                ),
                 SizedBox(height: Responsive.height(30),),
                Row(
            mainAxisAlignment: MainAxisAlignment.center, // center dots
            children: List.generate(3, (index) {
              return 
                 AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: controller.pageIndex.value == index? 20:10,
          height: 10,
          decoration: BoxDecoration(
             color: controller.pageIndex.value == index
                  ? AppColors.buttonblue
                  : Colors.grey,
              borderRadius: BorderRadius.circular(4), 
          ),
                 );
              
            }),
          ),
           SizedBox(height: Responsive.height(50),),
          
          
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
             
              if (controller.pageIndex.value<2)
                CustomSecondarybutton(text: "Skip", onPressed:()=> Get.offNamed(AppRoutes.welcome), width: 125,),
                SizedBox(width: Responsive.width(20),)   ,
                   
            

                      CustomSecondarybutton(
                        text: controller.pageIndex.value == 2
                            ? "Get Started"
                            : "Next",
                        onPressed: ()=>  controller.nextPage(),
                        width: controller.pageIndex.value == 2 ? 200 : 125,
                      )
              
             
            ],
          ),
          
          
            
              ],
            ),
                  ),
          ),
        )),
    );
  }
}