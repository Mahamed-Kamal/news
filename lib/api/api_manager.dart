import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/model/news_responses/NewsResponse.dart';
import 'package:news/api/model/sources_responses/SourcesResponse.dart';

class ApiManager {
  static const baseUrl = 'newsapi.org';
  static const String apiKey = '2ab29b9f0770427c9873c86e7ed5c9b0';

  static Future<SourcesResponse> getNewsSources(String categoryId) async {
    //1-Server or NameServer  2-Function or Api  3-QuaryParameter
    var uri = Uri.https(baseUrl, 'v2/top-headlines/sources',
        {'apiKey': apiKey, 'category': categoryId});
    var response = await http.get(uri);
    return SourcesResponse.fromJson(jsonDecode(response.body));
  }

  static Future<NewsResponse> getNews({String? sourceId, String? q}) async {
    var url = Uri.https(baseUrl, 'v2/everything',
        {'apiKey': apiKey, 'sources': sourceId, 'q': q});
    var response = await http.get(url);
    return NewsResponse.fromJson(jsonDecode(response.body));
  }
}
