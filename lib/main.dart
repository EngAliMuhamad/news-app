import 'package:app_news/home/News/home_screen.dart';
import 'package:app_news/my_theme.dart';
import 'package:flutter/material.dart';

import 'home/category/category_details.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName : (context) => HomeScreen(),
        },
        theme: MyTheme.lightTheme,
        );
    }
}