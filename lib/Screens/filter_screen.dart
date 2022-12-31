import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../Widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filterscreen';
  final Map<String, bool> filters;
  final Function changeFilters;
  FilterScreen(this.filters, this.changeFilters);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isglutenFree;
  bool islactoseFree;
  bool isVegeterian;
  bool isVegan;
  @override
  void initState() {
    // TODO: implement initState
    isglutenFree = widget.filters['isglutenFree'];
    islactoseFree = widget.filters['islactoseFree'];
    isVegeterian = widget.filters['isVegeterian'];
    isVegan = widget.filters['isVegan'];
    super.initState();
  }

  Widget builderSwitchListTiles(
      {@required Function onTap,
      @required String title,
      @required String description,
      bool value}) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: value,
        onChanged: onTap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  widget.changeFilters({
                    'isglutenFree': isglutenFree,
                    'islactoseFree': islactoseFree,
                    'isVegeterian': isVegeterian,
                    'isVegan': isVegan
                  });
                },
                icon: Icon(Icons.save)),
          ],
        ),
        drawer: MainScreenDrawer(),
        body: Container(
          height: 400,
          width: double.infinity,
          child: Column(
            children: [
              builderSwitchListTiles(
                onTap: (TapUpDetails) {
                  setState(() {
                    isglutenFree = TapUpDetails;
                  });
                },
                title: 'Gluten Free',
                description: 'Includes meals which not contain gluten',
                value: isglutenFree,
              ),
              builderSwitchListTiles(
                  onTap: (TapUpDetails) {
                    setState(() {
                      islactoseFree = TapUpDetails;
                    });
                  },
                  title: 'Lactos Free',
                  description: 'Includes meals which not contain lactos',
                  value: islactoseFree),
              builderSwitchListTiles(
                  onTap: (TapUpDetails) {
                    setState(() {
                      isVegeterian = TapUpDetails;
                    });
                  },
                  title: 'Vegterian',
                  description: 'Includes meals which are Vegeterian',
                  value: isVegeterian),
              builderSwitchListTiles(
                onTap: (TapUpDetails) {
                  setState(() {
                    isVegan = TapUpDetails;
                  });
                },
                title: 'Vegan',
                description: 'Includes meals which are Vegan',
                value: isVegan,
              ),
            ],
          ),
        ));
  }
}
