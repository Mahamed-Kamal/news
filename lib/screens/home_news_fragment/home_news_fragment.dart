import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/screens/articles_screen/articles_screen.dart';

import '../../api/api_manager.dart';
import '../../api/model/sources_responses/SourcesResponse.dart';

class HomeNewsFragment extends StatelessWidget {
  CategoryModel category;

  HomeNewsFragment(this.category);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManager.getNewsSources(category.title),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(onPressed: () {}, child: Text('Try Again')),
              ],
            ),
          );
        }
        ;
        var response = snapshot.data;
        if (response?.status == 'error') {
          return Center(
            child: Column(
              children: [
                Text(response?.message ?? ""),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            ),
          );
        }
        ;
        return ArticlesScreen(response?.sources);
      },
    );
  }
}
