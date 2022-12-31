import 'package:flutter/material.dart';
import './categoryscreen.dart';
import './favourite_meal_screen.dart';
import '../Widgets/main_drawer.dart';
import '../Models/meals.dart';
class TabScreen extends StatefulWidget {
  List<Meal> favouriteMeals=[];
  TabScreen(this.favouriteMeals);
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String,Object>> pages;
  @override
  void initState() {
     pages=[{'page':CategoryScreen(),'title':'Category'},
  {'page':FavouriteMealScreen(widget.favouriteMeals),'title':'Favourites'}];
    super.initState();
  }
  int pageindex=0;
  void _selected(int index){
    setState(() {
      pageindex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pages[pageindex]['title']),),
      drawer: MainScreenDrawer(),
      body:pages[pageindex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:Theme.of(context).primaryColor,
        selectedItemColor: Colors.yellow,
        unselectedItemColor:Colors.white ,
        currentIndex: pageindex,
        onTap: _selected,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category),label:'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favourites'),
        ],
      ),
    );
  }
}