import 'package:app_news/api/api_manger.dart';
import 'package:app_news/home/News/news_item.dart';
import 'package:app_news/model/NewsResponse.dart';
import 'package:app_news/model/SourceResponse.dart';
import 'package:app_news/my_theme.dart';
import 'package:flutter/material.dart';
class NewsWidget extends StatefulWidget {
  Sources sources;
  NewsWidget({required this .sources});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManger.getNewsBySourceId(widget.sources.id??""),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
     return Center(
    child: CircularProgressIndicator(
    backgroundColor: MyTheme.primaryLightColor,
    ),
    );
    }else if(snapshot.hasError){
    return Column(
    children: [
    Text('Something went worng'),
    ElevatedButton(
    onPressed: (){
    ApiManger.getNewsBySourceId(widget.sources.id??'');
    setState(() {

    });
    },
    child: Text('try Agein'))
    ],
    );
    }
    if(snapshot.data?.status!='ok'){
    return Column(
    children: [
    Text(snapshot.data!.message ! ),
    ElevatedButton(
    onPressed: (){
    ApiManger.getNewsBySourceId(widget.sources.id??'');
    setState(() {

    });
    },
    child: Text('try Agein'))
    ],
    );
    }
    var newsList = snapshot.data?.articles ??[];
    return ListView.builder(itemBuilder: (context,index){
    return NewsItem(news: newsList[index]);
    },
    itemCount: newsList.length,
    );

   });
  }
}
