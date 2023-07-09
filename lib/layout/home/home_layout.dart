import 'package:flutter/material.dart';
import 'package:news/model/category.dart';

import '../../screens/categories_screen/categories_screen.dart';
import '../../screens/home_news_fragment/home_news_fragment.dart';
import '../../screens/setting_screen/setting_screen.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'Home-Layout';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  CategoryModel? selectedCategory;
  bool selectedSetting = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/background.jpg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 110,
                color: Theme.of(context).primaryColor,
                alignment: Alignment.center,
                child: Text('News App!',style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white)),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: () {
                  selectedCategory = null;
                  selectedSetting =false;
                  Navigator.pop(context);
                  setState(() {
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children:[
                      ImageIcon(AssetImage(
                        'assets/images/categories_icon.png',
                      )),
                      SizedBox(width: 10,),
                      Text('Categories',style: Theme.of(context).textTheme.headlineMedium,)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  selectedSetting =true;
                  selectedCategory =null;
                  Navigator.pop(context);
                  setState(() {

                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children:[
                      ImageIcon(AssetImage(
                        'assets/images/settings_icon.png',
                      )),
                      SizedBox(width: 10,),
                      Text('Settings',style: Theme.of(context).textTheme.headlineMedium,)

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            selectedCategory == null
                ? selectedSetting
                    ? 'Setting'
                    : 'News App'
                : selectedCategory!.title,
          ),
          actions: selectedCategory == null
              ? null
              : [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
                ],
        ),
        body: selectedCategory == null
            ? selectedSetting
                ? SettingScreen()
                : CategoriesScreen(SelectCategory)
            : HomeNewsFragment(selectedCategory!),
      ),
    );
  }

  void SelectCategory(CategoryModel category){
    selectedCategory = category;
    setState(() {

    });

  }
}
