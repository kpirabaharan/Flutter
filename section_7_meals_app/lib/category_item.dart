import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem(this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      Platform.isIOS
          ? CupertinoPageRoute(
              builder: (_) {
                return CategoryMealsScreen();
              },
            )
          : MaterialPageRoute(
              builder: (_) {
                return CategoryMealsScreen();
              },
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(title, style: Theme.of(context).textTheme.headline6),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.5),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
