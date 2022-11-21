import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Center(
        child: Text('The Recipes For The Category!'),
      ),
    );
  }
}
