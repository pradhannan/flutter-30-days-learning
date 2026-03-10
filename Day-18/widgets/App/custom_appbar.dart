import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/widgets/App/app_color.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppbar({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // height of AppBar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () =>Navigator.pop(context),
        child: Icon(Icons.arrow_back_ios),
      ),
      centerTitle: true,
      
      backgroundColor: Colors.white,

      title: Text(
        title,
        style: GoogleFonts.openSans(
          color: AppColors.darktextblue,
          fontSize: 19,
          fontWeight: FontWeight.w700,
        ),
        
      ),
    );
  }
}
