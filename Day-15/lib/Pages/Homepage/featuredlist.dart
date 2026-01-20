import 'package:flutter/material.dart';
import 'package:my_trial_first_app/Responsive/responsive.dart';
import 'package:my_trial_first_app/config/app_color.dart';

class Featuredlist extends StatelessWidget {
  final String title;
  final String  images;
  final String description;
  final String category;
  const Featuredlist({super.key,  required this.title,
    required this.description, required this.images, required this.category});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.navyblue,
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage(
            "assets/pattern.png",
          ),
          repeat: ImageRepeat.repeat,
        ),
        
      ),
      margin: EdgeInsets.symmetric(horizontal: Responsive.width(10)),
      padding: EdgeInsets.all(20),
      child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                
                decoration: BoxDecoration(
                  color: Colors.white,
                
                ),
               width: Responsive.width(60),
                height: Responsive.height(60),
                child: Image.network(images,
                fit: BoxFit.cover,), //for image 
              ),
              SizedBox(width: Responsive.width(15)),
              Expanded(
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1, // only show 1 line
                     overflow: TextOverflow
                                          .ellipsis,
                      style: TextStyle(
                        color: AppColors.textblue,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        
                      ),
                    ),
                    Text(
                      description,
                      maxLines: 2, // only show 1 line
                         overflow: TextOverflow
                                          .ellipsis,
                      style: TextStyle(
                        color: AppColors.greyblue,
                      ),
                    ),
                  ],
                 
                ),
              ),
              Spacer(),
              Icon(
                Icons.bookmark_add,
                color: Colors.grey.shade300,
              ),
            ],
          ),
           SizedBox(height: 15),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                 padding: EdgeInsets.symmetric(horizontal: Responsive.width(10), vertical: Responsive.width(8)),
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
               
                child: Text(
                  category,
                  style: TextStyle(color: AppColors.textblue,fontSize: 12),
                ),
              ),
              Container(
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20,),
                ),
                 padding: EdgeInsets.symmetric(horizontal: Responsive.width(10), vertical: Responsive.width(8)),
                child: Text(
                  'One time Offer',
                  style: TextStyle(color:AppColors.textblue,fontSize: 12),
                ),
              ),
              Container(
               
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                 padding: EdgeInsets.symmetric(horizontal: Responsive.width(10), vertical: Responsive.width(8)),
                 child: Text(
                  'Big-Deal',
                  style: TextStyle(color:AppColors.textblue,fontSize: 12),
                ),
              ),
            ],
           
          ),
         
        ]
    ));
  }
}