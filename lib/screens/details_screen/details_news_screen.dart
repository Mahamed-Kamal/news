import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../api/model/news_responses/News.dart';
import '../web_screen/web_screen.dart';

class DetailsNewsScreen extends StatelessWidget {
  static const String routeName = 'Details-News-Screen';

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)?.settings.arguments as News;
    var date = DateTime.parse(article.publishedAt ?? '');
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/background.jpg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(article.title ?? ''),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                    imageUrl: article.urlToImage ?? '',
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(height: 10),
                Text(article.source?.name ?? '',
                    style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: 10),
                Text(article.title ?? '',
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
                SizedBox(height: 10),
                Text(article.description ?? '',
                    style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, WebScreen.routeName,
                        arguments: article);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('View Full Article',
                          style: Theme.of(context).textTheme.headlineSmall),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_right),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
