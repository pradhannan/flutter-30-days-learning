import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_trial_first_app/routes/app_routes.dart';

class Profileedit extends StatelessWidget {
  final String title;
  final String subtitle;

  const Profileedit({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(Icons.person_3, size: 30),
      ),
      title: Text(title, style: TextStyle(fontSize: 20)),
      subtitle: Text(subtitle),
      trailing: GestureDetector(
        onTap: () => Get.toNamed(AppRoutes.editprofile),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.edit, size: 18),
              SizedBox(width: 4),
              Text("Edit", style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
