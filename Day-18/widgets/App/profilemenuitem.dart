import 'package:flutter/material.dart';
//import 'package:my_trial_first_app/widgets/App/app_color.dart';

class ProfileMenuItem  extends StatelessWidget {
   final String title;
  final IconData icon;
  final VoidCallback? onTap;
  const ProfileMenuItem ({super.key, required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
     return ListTile(
        leading: Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Icon(icon, size: 18,)
          ),
        title: Text(title, style:  TextStyle(fontSize: 18),),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18,),
        onTap: onTap,
      );
  }
}