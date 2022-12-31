import 'package:flutter/material.dart';
import 'package:meals_app/Models/CategoryClass.dart';
import 'package:meals_app/Screens/categorymealscreen.dart';
import 'package:meals_app/Screens/favourite_meal_screen.dart';
import 'package:meals_app/Screens/filter_screen.dart';
import 'package:meals_app/Screens/meal_detail_screen.dart';
import 'package:meals_app/Screens/tab_screen.dart';
import 'Screens/categoryscreen.dart';
import 'Screens/categorymealscreen.dart';
import '../Models/meals.dart';
import './dummy_data.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> filters={'isglutenFree':false,'islactoseFree':false,'isVegeterian':false,'isVegan':false,};
  List<Meal> favouriteMeals=[];
  List<Meal> availableMeals=DUMMY_MEALS;
  void changeFilters(Map<String,bool> filterdata){
    setState(() {
      filters['isglutenFree']=filterdata['isglutenFree'];
      filters['islactoseFree']=filterdata['islactoseFree'];
      filters['isVegeterian']=filterdata['isVegeterian'];
      filters['isVegan']=filterdata['isVegan'];
      availableMeals=DUMMY_MEALS.where((meal){
      if(filters['isglutenFree'] && !meal.isGlutenFree)return false;
      if(filters['islactoseFree'] && !meal.isLactoseFree)return false;
      if(filters['isVegeterian'] && !meal.isVegetarian)return false;
      if(filters['isVegan'] && !meal.isVegan)return false;
      return true;
    }).toList();
    });}
  void toggleFavourite(String mealid){
    int existingId=favouriteMeals.indexWhere((element) => element.id==mealid);
    if(existingId>=0)setState(() {
      favouriteMeals.removeAt(existingId);
    }); 
    else{
      setState(() {
         favouriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id==mealid));
      });
    }
  }
  bool isFavourite(String mealid){
    int existingId=favouriteMeals.indexWhere((element) => element.id==mealid);
    if(existingId>=0) return true;
    else return false;
  }  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily:'Raleway',
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontFamily:'RobotoCondensed', 
            fontWeight: FontWeight.bold,
            fontSize: 25
          )
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20,51,51,1)
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20,51,51,1))
          ),
        ),
      routes: {
        '/':((context) => TabScreen(favouriteMeals)),
        '/category-meals':(_)=>CategoryMealScreen(availableMeals),
        MealScreenDetail.routeName:(_)=>MealScreenDetail(toggleFavourite,isFavourite),
        FilterScreen.routeName:(_)=>FilterScreen(filters,changeFilters), 
             },
    );
  }
}  