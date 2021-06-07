import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, bool currentValue, Function updateValue) {
    return SwitchListTile(
      activeColor: Colors.green,
      title: Text(title),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('filter'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListTile('Gluten Free', _glutenFree, (newValue) {
                setState(
                  () {
                    _glutenFree = newValue;
                  },
                );
              }),
              _buildSwitchListTile('Lactose Free', _lactoseFree, (newValue) {
                setState(
                  () {
                    _lactoseFree = newValue;
                  },
                );
              }),
              _buildSwitchListTile('Vegetarian', _vegetarian, (newValue) {
                setState(
                  () {
                    _vegetarian = newValue;
                  },
                );
              }),
              _buildSwitchListTile('Vegan', _vegan, (newValue) {
                setState(
                  () {
                    _vegan = newValue;
                  },
                );
              }),
            ],
          ))
        ],
      ),
    );
  }
}
