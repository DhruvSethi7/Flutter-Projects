import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../Screens/categorymealscreen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem({@required this.color, @required this.title,@ required this.id});
  void selectedCategory(BuildContext ctx){
    //Here using navigator class to go to new Page, Flutter app pages works like a stack on each other when we add a new page it means we are adding a new item on stack
     Navigator.of(ctx).pushNamed('/category-meals',arguments:{'id':id,'title':title});
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        selectedCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius:BorderRadius.circular(10) ,
      child: Container(
        padding: EdgeInsets.all(20),
          child: Text(title,style:Theme.of(context).primaryTextTheme.headline6,),
          decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius:BorderRadius.circular(10)
          )
      ),
    );
  }
}
