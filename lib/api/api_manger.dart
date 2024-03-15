import 'dart:convert';

import 'package:app_news/api/api_constatnts.dart';
import 'package:app_news/model/NewsResponse.dart';
import 'package:app_news/model/SourceResponse.dart';
import 'package:http/http.dart' as http;
class ApiManger {
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri uri = Uri.https(ApiConstants.baseUrl, ApiConstants.sourcesApi,
        {
          'apikey': '0371277408f9488c96c7d876439de322',
          'category':categoryId
        });
    try {
      var response = await http.get(uri);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }


  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi, {
      'apikey': 'e6782d110cdb4e4291b49606c0581115',
      'sources': sourceId
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
