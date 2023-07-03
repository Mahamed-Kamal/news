import 'package:flutter/material.dart';
import 'package:news/shared/style/theme/my_theme.dart';
import 'layout/home/home_layout.dart';

void main (){
  runApp(MyApplication());
}


class MyApplication extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName:(context) => HomeLayout(),
      },
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
    );
  }
}
