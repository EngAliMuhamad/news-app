import 'package:app_news/api/api_manger.dart';
import 'package:app_news/category/tab_widget.dart';
import 'package:app_news/home/category/tab_widget.dart';
import 'package:app_news/model/SourceResponse.dart';
import 'package:app_news/model/category.dart';
import 'package:app_news/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CategoryDetails extends StatefulWidget {
  CategoryDM category;
  CategoryDetails({required this .category});
  static const String routeName = 'category details';

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<SourceResponse?>(
                future: ApiManger.getSources(widget.category.id),
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
                              ApiManger.getSources(widget.category.id);
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
                              ApiManger.getSources(widget.category.id);
                              setState(() {

                              });
                            },
                            child: Text('try Agein'))
                      ],
                    );
                  }
                  var sourcesList = snapshot.data?.sources ??[];
                  return TabWidget(sourcesList: sourcesList);
                });
    }
}