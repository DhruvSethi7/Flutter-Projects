import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../Models/meals.dart';
import '../Widgets/meal_item.dart';
class FavouriteMealScreen extends StatelessWidget {
  static const routeName='./favouritemealscreen';
  List<Meal> favouriteMeals;
  FavouriteMealScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    return favouriteMeals.isEmpty?Center(child: Text('No Favourites Yet!',style: TextStyle(
      fontSize: 28
    ),),):ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: favouriteMeals[index].id,
              title:favouriteMeals[index].title,
              affordability: favouriteMeals[index].affordability,
              complexity: favouriteMeals[index].complexity,
              duration: favouriteMeals[index].duration,
              imageUrl: favouriteMeals[index].imageUrl);
        },
        itemCount: favouriteMeals.length,
      );   
  }
}