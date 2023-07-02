import 'package:flutter/material.dart';

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
    );
  }
}
