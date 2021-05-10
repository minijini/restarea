import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restarea/ui/view/restarea_bus_traffic_page.dart';
import 'package:restarea/ui/view/restarea_car_traffic_page.dart';
import 'package:restarea/ui/widget/color.dart';
import 'package:restarea/viewmodel/RestAreaModel.dart';

class RestAreaTrafficPage extends StatefulWidget {
  @override
  _RestAreaTrafficPageState createState() => _RestAreaTrafficPageState();
}

class _RestAreaTrafficPageState extends State<RestAreaTrafficPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final restaurantModel = Provider.of<RestAreaModel>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: b_color,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                restaurantModel.driving_list_fetch();
              },
            ),
          ],
          flexibleSpace: SafeArea(
            child: getTabBar(),
          ),
        ),
        body: getTabBarPages());
  }

  Widget getTabBar() {
    return TabBar(
        indicatorColor: s_color,
        unselectedLabelColor: Colors.white,
        labelColor: s_color,
        controller: tabController,
        tabs: [
          Tab(text: "자동차도로", icon: Icon(Icons.directions_car)),
          Tab(text: "버스전용도로", icon: Icon(Icons.directions_bus)),
        ]);
  }

  Widget getTabBarPages() {
    return TabBarView(
        controller: tabController,
        children: <Widget>[CarTrafficPage(), BusTrafficPage()]);
  }
}
