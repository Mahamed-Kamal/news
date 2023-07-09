import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/news_responses/NewsResponse.dart';

import '../../api/model/sources_responses/Source.dart';
import '../../shared/style/componenets/article_item.dart';

class NewsListFragment extends StatelessWidget {
  Source? source;

  NewsListFragment(this.source);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNews(source?.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(
                    onPressed: () {},
                    child: Text('Error loading data..Try Again'))
              ],
            ),
          );
        }
        var response = snapshot.data;
        if (response?.status == 'error') {
          return Center(
            child: Column(
              children: [
                Text(response?.message ?? ''),
                ElevatedButton(
                    onPressed: () {}, child: Text('Server error..Try Again'))
              ],
            ),
          );
        }
        return Expanded(
          child: ListView.separated(
            padding: EdgeInsets.all(12),
            itemBuilder: (context, index) =>
                ArticleItem(response?.articles?[index]),
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemCount: response?.articles?.length ?? 0,
          ),
        );
      },
    );
  }
}
