import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/Responsive/responsive.dart';

import 'package:my_trial_first_app/widgets/App/AppBar/custom_appbar.dart';

class AccessibilityPage extends StatelessWidget {
  const AccessibilityPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:CustomAppbar(title: "Accessibility Page"),
      body: SingleChildScrollView(
       child: Column(
          children: [
            SizedBox(height: Responsive.height(20),),
            ContainerBox(title: "App Navigation", subtitle: "Use the bottom navigation bar to switch between Home, Cart, and Profile.", leadingicon: Icons.navigation)
        
            ,
             ContainerBox(
              leadingicon : Icons.image,
              title:  "Viewing Products",
              subtitle: "Tap on a product to see more details and images.",
            
            ),

           
             ContainerBox(
              leadingicon : Icons.text_fields,
              title: "Readability",
              subtitle:"Product information is displayed clearly in the product details page.",
),
             ContainerBox(
              leadingicon : Icons.help_outline,
              title: "Need Help?",
              subtitle:  "Contact support if you face any issues while using the app.",),
    
        
       
        
          ],
        ),
      ),
    );
  }
}

class ContainerBox extends StatelessWidget{
  final String title;
  final String subtitle;
  final IconData leadingicon;
  const ContainerBox({super.key, required this.title, required this.subtitle, required this.leadingicon});
  @override
  Widget build(BuildContext context){
    return Container(
  padding: EdgeInsets.all(12),
 
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(leadingicon),
      SizedBox(width: 12),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: GoogleFonts.openSans(
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

  }

  
}