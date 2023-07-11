import 'package:flutter/material.dart';

import '../api/api_manager.dart';
import '../api/model/news_responses/NewsResponse.dart';
import '../shared/style/componenets/article_item.dart';

class SearchNews extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(
            Icons.clear,
            color: Theme.of(context).primaryColor,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          color: Theme.of(context).primaryColor,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/background.jpg'),
        fit: BoxFit.cover,
      )),
      child: FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(q: query),
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
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/background.jpg'),
        fit: BoxFit.cover,
      )),
    );
  }
}
