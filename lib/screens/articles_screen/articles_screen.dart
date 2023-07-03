import 'package:flutter/material.dart';

import '../../shared/style/componenets/article_item.dart';
import '../../shared/style/componenets/tap_item.dart';

class ArticlesScreen extends StatefulWidget {
  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  List<String> sources = [
    "BBC News",
    "CBC News",
    "ON News",
    "BEIN News",
    "SKY News",
    "Al jazeera News",
    "Nile News",
  ];
  List<ArticleItem> articleItem = [
    ArticleItem(),
    ArticleItem(),
    ArticleItem(),
    ArticleItem(),
    ArticleItem(),
    ArticleItem(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            tabs: sources
                .map((source) =>
                    TapItem(selectedIndex == sources.indexOf(source), source))
                .toList(),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(12),
              itemBuilder: (context, index) => articleItem[index],
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemCount: articleItem.length,
            ),
          )
        ],
      ),
    );
  }
}
