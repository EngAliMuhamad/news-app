import 'package:app_news/model/SourceResponse.dart';
import 'package:app_news/my_theme.dart';
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Sources sources;
  TabItem({required this .isSelected,required this .sources});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(top: 12) ,
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 12),
      decoration: BoxDecoration(
        border:Border.all(
          color: MyTheme.primaryLightColor,
              width: 2
        ) ,
        borderRadius: BorderRadius.circular(15),
        color: isSelected ?MyTheme.primaryLightColor :Colors.transparent
      ),
      child: Text(sources.name ?? '',
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: isSelected ? MyTheme.whiteColor :MyTheme.primaryLightColor,
        fontSize: 18
      ),
      ),
    );
  }
}
