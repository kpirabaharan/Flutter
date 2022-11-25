import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/meal.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late Category routeArgs;
  late List<Meal> displayedMeals;
  // Need this because didChangeDependencies overwrites _removeMeal
  var _loadedInitData = false;

  // Initstate is called when an object for a stateful widgets is created and
  // inserted inside the widget tree; entry point for stateful widgets
  // @override
  // void initState() {
  //   super.initState();
  // }

  // Initstate cannot be used because we are getting routeArgs from category
  // screen which requires context, initState is being executed too fast
  // didChangeDependencies gets called whenever dependencies are changed,
  // req for routeArgs
  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      routeArgs = ModalRoute.of(context)!.settings.arguments as Category;

      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(routeArgs.id);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(routeArgs.title),
        ),
        body: ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                  item: displayedMeals[index], removeItem: _removeMeal);
            },
            itemCount: displayedMeals.length));
  }
}
