import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restarea/model/route.dart';
import 'package:restarea/ui/view/restarea_food_page.dart';
import 'package:restarea/ui/view/restarea_gas_page.dart';
import 'package:restarea/ui/view/restarea_home_page.dart';
import 'package:restarea/ui/view/restarea_toll_page.dart';
import 'package:restarea/ui/view/restarea_traffic_page.dart';
import 'package:restarea/ui/widget/color.dart';
import 'package:restarea/viewmodel/RestAreaModel.dart';

class RestAreaMainPage extends StatefulWidget {
  @override
  _RestAreaMainPageState createState() => _RestAreaMainPageState();
}

class _RestAreaMainPageState extends State<RestAreaMainPage> {
  int _selectedIndex = 0;
  Widget _currentPage;
  List<Widget> _pages;
  RestAreaModel restaurantModel;

  var title = '휴게소';

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _currentPage = homepage();

    _pages = [
      homepage(),
      RestAreaFoodPage(),
      RestAreaTrafficPage(),
      RestAreaGasPage(),
    ];
  }

  void onItemTapped(int index) {
    print('=========');
    setState(() {
//      restaurantModel.index = index;
      _selectedIndex = index;
      _currentPage = _pages[index];

      if (index == 0) {
        title = '휴게소';
      } else if (index == 1) {
        title = '휴게소 맛집';
      } else if (index == 2) {
        title = '고속도로 교통상황';
      } else if (index == 3) {
        title = '주유소 요금';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
//    restaurantModel = Provider.of<RestAreaModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: b_color,
        title: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        onTap: (index) => onItemTapped(index),
        elevation: 0, //그림자제거
        items: [
          TabItem(icon: Icons.home, title: 'HOME'),
          TabItem(icon: Icons.fastfood, title: 'FOOD'),
          TabItem(icon: Icons.directions_car, title: '교통상황'),
          TabItem(icon: Icons.local_gas_station, title: '주유소'),
        ],

        activeColor: s_color,
        initialActiveIndex: _selectedIndex,
        style: TabStyle.reactCircle,
        backgroundColor: b_color,
      ),
      body: _currentPage,
    );
  }

  Widget homepage() {
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
                    onItemTapped(2);
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
                  onTap: () {
                    onItemTapped(2);
                  },
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
                  onTap: () {
                    onItemTapped(3);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//import 'package:convex_bottom_bar/convex_bottom_bar.dart';
//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:restarea/model/route.dart';
//import 'package:restarea/ui/view/restarea_food_page.dart';
//import 'package:restarea/ui/view/restarea_home_page.dart';
//import 'package:restarea/ui/view/restarea_toll_page.dart';
//import 'package:restarea/ui/view/restarea_traffic_page.dart';
//import 'package:restarea/ui/widget/color.dart';
//import 'package:restarea/viewmodel/RestAreaModel.dart';
//
//class RestAreaMainPage extends StatefulWidget {
//  @override
//  _RestAreaMainPageState createState() => _RestAreaMainPageState();
//}
//
//class _RestAreaMainPageState extends State<RestAreaMainPage> {
//  int _selectedIndex = 0;
//  Widget _currentPage;
//  List<Widget> _pages;
//  RestAreaModel restaurantModel;
//
//  var title = '휴게소';
//
//  @override
//  void initState() {
//    super.initState();
//    _selectedIndex = 0;
//    _currentPage = RestAreaHomePage();
//
//    _pages = [
//      RestAreaHomePage(),
//      RestAreaFoodPage(),
//      RestAreaTrafficPage(),
//      RestAreaTollPage(),
//    ];
//  }
//
//  void _onItemTapped(int index) {
//    setState(() {
//      restaurantModel.index = index;
//      _selectedIndex = index;
//      _currentPage = _pages[restaurantModel.index];
//
//      if (index == 0) {
//        title = '휴게소';
//      } else if (index == 1) {
//        title = '휴게소 맛집';
//      } else if (index == 2) {
//        title = '고속도로 교통상황';
//      } else if (index == 3) {
//        title = '고속도로 통행료';
//      }
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    restaurantModel = Provider.of<RestAreaModel>(context);
//
//    print('index :: ${restaurantModel.index}');
//    print('currentPage ::${restaurantModel.currentPage}');
//
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: b_color,
//        title: Center(
//          child: Text(
//            restaurantModel.title,
//            style: TextStyle(
//                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
//          ),
//        ),
//      ),
//      bottomNavigationBar: ConvexAppBar(
//        elevation: 0, //그림자제거
//        items: [
//          TabItem(icon: Icons.home, title: 'HOME'),
//          TabItem(icon: Icons.fastfood, title: 'FOOD'),
//          TabItem(icon: Icons.directions_car, title: '교통상황'),
//          TabItem(icon: Icons.attach_money, title: '통행료'),
//        ],
//        onTap: restaurantModel.onItemTapped,
//        activeColor: s_color,
//        initialActiveIndex: restaurantModel.index,
//        style: TabStyle.reactCircle,
//        backgroundColor: b_color,
//      ),
//      body: restaurantModel.currentPage,
//    );
//  }
//}
