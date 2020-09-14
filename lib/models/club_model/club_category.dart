import 'package:flutter/cupertino.dart';

class ClubCategory {
  String categoryTitle;
  String categotyIconPath;
  bool categoryIscliked = false;
  Color color;
  Color secondary;

  ClubCategory({
    this.categoryTitle,
    this.categotyIconPath,
    this.categoryIscliked  = false,
    this.color,
    this.secondary
  });

  void makeItflase() {
    categoryIscliked = true;
  }
}
