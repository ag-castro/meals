import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwicherListTile(
    String title, 
    String description, 
    bool currentValue,
    Function updateValue
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              'Adjust you meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwicherListTile(
                  'Gluten-free', 
                  'Only includes gluten-free meals.', 
                  _glutenFree, 
                  (newValue) => setState(() => _glutenFree = newValue)
                ),
                _buildSwicherListTile(
                  'Lactose-free', 
                  'Only includes lactose-free meals.', 
                  _lactoseFree, 
                  (newValue) => setState(() => _lactoseFree = newValue)
                ),
                _buildSwicherListTile(
                  'Vegetarian', 
                  'Only includes vegetarian meals.', 
                  _vegetarian, 
                  (newValue) => setState(() => _vegetarian = newValue)
                ),
                _buildSwicherListTile(
                  'Vegan', 
                  'Only includes vegan meals.', 
                  _vegan, 
                  (newValue) => setState(() => _vegan = newValue)
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}