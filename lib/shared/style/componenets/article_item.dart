import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../api/model/news_responses/News.dart';
import '../../../screens/details_screen/details_news_screen.dart';

class ArticleItem extends StatelessWidget {
  News? news;

  ArticleItem(this.news);

  @override
  Widget build(BuildContext context) {
    var date = DateTime.parse(news?.publishedAt ?? '');
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsNewsScreen.routeName,
            arguments: news);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              imageUrl: news?.urlToImage ?? '',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 10),
          Text(news?.author ?? '',
              style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 10),
          Text(news?.title ?? '',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF42505C),
              )),
          SizedBox(height: 10),
          Text(
            '${date.year}-${date.month}-${date.day}',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
