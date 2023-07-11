import 'package:flutter/material.dart';
import 'package:news/screens/details_screen/details_news_screen.dart';
import 'package:news/screens/web_screen/web_screen.dart';
import 'package:news/shared/style/theme/my_theme.dart';

import 'layout/home/home_layout.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
        DetailsNewsScreen.routeName: (context) => DetailsNewsScreen(),
        WebScreen.routeName: (context) => WebScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
    );
  }
}
