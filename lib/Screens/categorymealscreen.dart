import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/Models/CategoryClass.dart';
import 'package:meals_app/Widgets/meal_item.dart';
import '../dummy_data.dart';
import '../Models/meals.dart';
class CategoryMealScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);
  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  List<Meal> categoryMeals;
  String CategoryTitle;
  bool _loadedinitdata=false;
  @override
  void didChangeDependencies() {
    // TODO: implement initState
    if(!_loadedinitdata){
    final routeargs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    CategoryTitle = routeargs['title'];
    final CategoryId = routeargs['id'];
    categoryMeals = widget.availableMeals.where(
      (meals) {
        return meals.categories.contains(CategoryId);
      },
    ).toList();
    super.didChangeDependencies();
    _loadedinitdata=true; 
    }
  }
    Function removeItem(String mealid){
    setState(() {
      categoryMeals.removeWhere((element) => element.id==mealid);
      print(mealid);
    });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              removeItem:removeItem,
              id: categoryMeals[index].id,
              title:categoryMeals[index].title,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
