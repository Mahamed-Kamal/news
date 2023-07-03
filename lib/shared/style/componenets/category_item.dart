import 'package:flutter/material.dart';

import '../../../model/category.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel catagory;
  int index;
  CategoryItem(this.catagory,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration:BoxDecoration(
        color: catagory.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomRight:index % 2 == 0? Radius.zero: Radius.circular(30),
          bottomLeft:index % 2 == 1? Radius.zero: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Image.asset(catagory.imagePath,height: 100,width: 100),
          SizedBox(height:6),
          Text(catagory.title,style:Theme.of(context).textTheme.bodySmall,)
        ],
      ),
    );
  }
}
