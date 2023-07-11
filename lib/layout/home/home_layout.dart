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
  bool isSearch = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/background.jpg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        drawer: isSearch
            ? null
            : Drawer(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 110,
                      color: Theme.of(context).primaryColor,
                      alignment: Alignment.center,
                      child: Text('News App!',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
          title: isSearch
              ? TextField(
                  controller: controller,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                      ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            controller.clear();
                            isSearch = false;
                          });
                        },
                        icon: Icon(Icons.clear,
                            color: Theme.of(context).primaryColor),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: Icon(Icons.search,
                            color: Theme.of(context).primaryColor),
                      ),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 20),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Search...'),
                )
              : Text(
                  selectedCategory == null
                      ? selectedSetting
                          ? 'Setting'
                          : 'News App'
                      : selectedCategory!.title,
                ),
          actions: !isSearch
              ? selectedCategory != null
                  ? [
                      IconButton(
                          onPressed: () {
                            // showSearch(context: context, delegate: SearchNews());
                            setState(() {
                              isSearch = true;
                            });
                          },
                          icon: Icon(Icons.search_rounded))
                    ]
                  : null
              : null,
        ),
        body: selectedCategory == null
            ? selectedSetting
                ? SettingScreen()
                : CategoriesScreen(SelectCategory)
            : HomeNewsFragment(selectedCategory!, controller.text),
      ),
    );
  }

  void SelectCategory(CategoryModel category){
    selectedCategory = category;
    setState(() {
    });
  }
}
