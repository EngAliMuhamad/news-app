import 'package:app_news/my_theme.dart';
import 'package:flutter/material.dart';
class CategoryDM {
  String id;
  String title;
  String imagepath;
  Color color;

  CategoryDM({required this .id,
  required this .title,required this .imagepath,required this .color});
  static List<CategoryDM>getcategores(){

return[
  CategoryDM(id: 'sports', title: 'Sports',
      imagepath: 'assets/images/sports.png', color: MyTheme.redColor),

  CategoryDM(id: 'general', title: 'General',
      imagepath: 'assets/images/Politics.png', color: MyTheme.darkBlueColor),

  CategoryDM(id: 'health', title: 'Health',
      imagepath: 'assets/images/health.png', color: MyTheme.pinkColor),

  CategoryDM(id: 'business', title: 'Business',
      imagepath: 'assets/images/bussines.png', color: MyTheme.brownColor),

  CategoryDM(id: 'entertainment', title: 'Entertainment',
      imagepath: 'assets/images/environment.png', color: MyTheme.blueColor),

  CategoryDM(id: 'science', title: 'Science',
      imagepath: 'assets/images/science.png', color: MyTheme.yellowColor),


    ];
  }
}