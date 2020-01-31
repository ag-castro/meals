import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_detail.dart';


class MealItem extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  // final Function removeItem;

  MealItem({
    @required this.id, 
    @required this.title, 
    @required this.imageUrl,
    @required this.duration, 
    @required this.complexity,
    @required this.affordability,
    // @required this.removeItem
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.SIMPLE:
        return 'Simple';
        break;
      case Complexity.CHALLENGING:
        return 'Challengin';
        break;
      case Complexity.HARD:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.AFFORDABLE:
        return 'Affordable';
        break;
      case Affordability.PRICEY:
        return 'Pricey';
        break;
      case Affordability.LUXURIOUS:
        return 'Expensive';
        break;
      
      default:
        return 'Unknown';
    }
  }
  
  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: id
    ).then((result) {
      if(result) {
        // removeItem(result);
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  imageUrl,
                  height: 250, 
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 280,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(
                    vertical: 5, 
                    horizontal: 15
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    
                  ),
                ),
              ),
            ],),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule, color: Colors.lightBlueAccent,),
                      SizedBox(width: 5,),
                      Text('$duration min')
                    ],
                  ),
                  
                  Row(
                    children: <Widget>[
                      Icon(Icons.work, color: Colors.lightBlueAccent,),
                      SizedBox(width: 5,),
                      Text(complexityText)
                    ],
                  ),
                  
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money, color: Colors.lightBlueAccent,),
                      SizedBox(width: 5,),
                      Text(affordabilityText)
                    ],
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}