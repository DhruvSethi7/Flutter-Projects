import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealScreenDetail extends StatelessWidget {
  static const String routeName = './meal_detail';
  Function toggleFavourite;
  Function isFavourite;
  MealScreenDetail(this.toggleFavourite,this.isFavourite);
  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (meals) {
        return meals.id == mealid;
      },
    );
    Widget titleBuilder(String title, BuildContext context) {
      return Container(
        child: Text(title, style: Theme.of(context).primaryTextTheme.headline6),
      );
    }

    Widget ContainerBuilder(BuildContext context, Widget child) {
      return Container(
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: child,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: 400,
                margin: EdgeInsets.only(top: 10),
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                )),
            titleBuilder('Ingridients', context),
            ContainerBuilder(
              context,
              ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(selectedMeal.ingredients[index])),
                    );
                  })),
            ),
            titleBuilder('Steps', context),
            ContainerBuilder(
                context,
                ListView.builder(
                    itemCount: selectedMeal.steps.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        ListTile(
                          leading: CircleAvatar(child: Text('${index + 1}')),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider()
                      ]);
                    }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleFavourite(mealid);
        },
        child:isFavourite(mealid)?Icon(Icons.star):Icon(Icons.star_border),
      ),
    );
  }
}
