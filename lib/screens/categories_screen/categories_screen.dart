import 'package:flutter/material.dart';

import '../../model/category.dart';
import '../../shared/style/componenets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  Function callBack;
  CategoriesScreen(this.callBack);

  List<CategoryModel> categories = [
    CategoryModel(
        id: 'sports',
        imagePath: 'assets/images/sports.png',
        title: 'Sports',
        background: Color(0xFFC91C22)),
    CategoryModel(
        id: 'general',
        imagePath: 'assets/images/Politics.png',
        title: 'General',
        background: Color(0xFF003E90)),
    CategoryModel(
        id: 'health',
        imagePath: 'assets/images/health.png',
        title: 'Health',
        background: Color(0xFFED1E79)),
    CategoryModel(
        id: 'business',
        imagePath: 'assets/images/bussines.png',
        title: 'Business',
        background: Color(0xFFCF7E48)),
    CategoryModel(
        id: 'technology',
        imagePath: 'assets/images/environment.png',
        title: 'Technology',
        background: Color(0xFF4882CF)),
    CategoryModel(
        id: 'science',
        imagePath: 'assets/images/science.png',
        title: 'Science',
        background: Color(0xFFF2D352)),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pick your category\nof interest',
              style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1 / 1.1,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        callBack(categories[index]);
                      },
                        child: CategoryItem(categories[index], index)),
                itemCount: categories.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
