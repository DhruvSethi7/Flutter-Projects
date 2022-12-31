import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/Models/meals.dart';
import 'package:meals_app/Screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String imageUrl;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  final String title;
  final String id;
  final Function removeItem;
  const MealItem({
    @required this.removeItem,
    @required this.id,
    @required this.title,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
    @required this.imageUrl,
  });
  String get complexityText {
    if (complexity == Complexity.Simple) return 'Simple';
    if (complexity == Complexity.Challenging) return 'Challenging';
    if (complexity == Complexity.Hard) return 'Hard';
  }

  String get affordabilityText {
    if (affordability == Affordability.Affordable) return 'Affordable';
    if (affordability == Affordability.Pricey) return 'Pricey';
    if (affordability == Affordability.Luxurious) return 'Luxurious';
  }

  void selected(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealScreenDetail.routeName,
      arguments: id,
    ).then((mealid){
      if(mealid!=null){
        removeItem(mealid);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selected(context);
      },
      child: Card(
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 270,
                    width: double.infinity,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                Positioned(
                    right: 20,
                    bottom: 15,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 10,
                        ),
                        Text('$duration mins')
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 15,
                          width: 55,
                          child: FittedBox(fit: BoxFit.cover,child: Text(complexityText)))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 10,
                        ),
                        Text(affordabilityText)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
