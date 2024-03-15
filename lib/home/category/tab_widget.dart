
import 'package:app_news/home/News/news_widget.dart';
import 'package:app_news/home/category/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:app_news/model/SourceResponse.dart';
class TabWidget extends StatefulWidget {
List<Sources>sourcesList;

TabWidget({required this .sourcesList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: widget.sourcesList.length,
        child:Column(
          children: [
            TabBar(
              onTap: (index){
                selectedIndex =index;
                setState(() {

                });
              },
              isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs:widget.sourcesList.map((Sources) => TabItem(
                    isSelected: selectedIndex ==widget.sourcesList.indexOf(Sources),
                    sources: Sources
                )).toList()
            ),
            Expanded(child: NewsWidget(sources: widget.sourcesList[selectedIndex] ))
          ],
        ),
    );
  }
}
