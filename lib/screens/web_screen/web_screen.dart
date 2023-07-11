import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../api/model/news_responses/News.dart';

class WebScreen extends StatelessWidget {
  static const String routeName = 'WebView-Screen';

  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)?.settings.arguments as News;
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate())
      ..loadRequest(Uri.parse(article.url ?? ''));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(article.title ?? ''),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
