import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../api/model/news_responses/News.dart';

class ArticleItem extends StatelessWidget {
  News? news;

  ArticleItem(this.news);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            width: double.infinity,
            height: 250,
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
          news?.publishedAt ?? '',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
