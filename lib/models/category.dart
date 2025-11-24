//enum categories
import 'package:flutter/material.dart';

enum Categories{
  vegetables,
  fruit,
  meat,
  diary,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other
}
//class category
class Category{
  const Category(this.title, this.color);
  final String title;
  final Color color;
}