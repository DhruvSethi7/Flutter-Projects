import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/Screens/filter_screen.dart';

class MainScreenDrawer extends StatelessWidget {
  Widget builddraweritem(IconData icon, String title, Function selectedPage) {
    return ListTile(
      onTap: selectedPage,
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Container(
                color: Theme.of(context).accentColor,
                padding: EdgeInsets.all(20),
                height: 100,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Cooking Up',
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'RobotoCondensed',
                    fontSize: 35,
                  ),
                )),
          ),
          builddraweritem(Icons.restaurant, 'Meals', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          builddraweritem(Icons.settings, 'Filter', () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          })
        ],
      ),
    );
  }
}
