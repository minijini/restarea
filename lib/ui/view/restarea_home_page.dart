import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restarea/ui/view/restarea_food_page.dart';
import 'package:restarea/viewmodel/RestAreaModel.dart';

class RestAreaHomePage extends StatefulWidget {
  @override
  _RestAreaHomePageState createState() => _RestAreaHomePageState();
}

class _RestAreaHomePageState extends State<RestAreaHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Color.fromARGB(225, 243, 240, 235),
              child: Center(
                child: ListTile(
                  title: Text(
                    'FOOD',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  trailing: Icon(
                    Icons.fastfood,
                    size: 40,
                  ),
                  onTap: () {
//                    restaurantModel.index = 1;
//                    Navigator.of(context).push(MaterialPageRoute(
//                        builder: (context) => RestAreaFoodPage()));
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Color.fromARGB(255, 143, 188, 219),
              child: Center(
                child: ListTile(
                  title: Text(
                    '교통상황',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  trailing: Icon(
                    Icons.directions_car,
                    size: 40,
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Color.fromARGB(225, 170, 186, 204),
              child: Center(
                child: ListTile(
                  title: Text(
                    '통행료',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  trailing: Icon(
                    Icons.attach_money,
                    size: 40,
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
