import 'package:app_news/drawer/home_drawer.dart';
import 'package:app_news/home/category/category_details.dart';
import 'package:app_news/home/category/category_fragment.dart';
import 'package:app_news/model/category.dart';
import 'package:app_news/my_theme.dart';
import 'package:app_news/setting/settings_tap.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homescreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            color: MyTheme.whiteColor,
            child: Image.asset(
              'assets/images/pattern.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                selectedMenuItem == HomeDrawer.settings?
                    'Setting':
                    selectedCategory == null?
                'News App':
                selectedCategory!.title ,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge,
              ),
            ),
            drawer: Drawer(
              child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick ),
            ),
            body:selectedMenuItem == HomeDrawer.settings ?
                SettingTap():
            selectedCategory == null?
            CategoryFragment(onCategoryItemClick: onCategoryItemClick,):
            CategoryDetails(category: selectedCategory!),

          )
        ]);
  }

  CategoryDM ? selectedCategory ;

  void onCategoryItemClick(CategoryDM newSelectedCategory){
    selectedCategory = newSelectedCategory ;
    setState(() {

    });
  }

  int  selectedMenuItem = HomeDrawer.categories;
  void onSideMenuItemClick (int  newSelectedMenuItem){
    selectedMenuItem = newSelectedMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {
      
    });

  }
}