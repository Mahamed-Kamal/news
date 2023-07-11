import 'dart:ui';

class CategoryModel{
  String id;
  String imagePath;
  String title;
  Color background;

  CategoryModel(
      {required this.id,
      required this.imagePath,
      required this.title,
      required this.background});
}