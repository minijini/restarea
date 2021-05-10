import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restarea/ui/widget/color.dart';
import 'package:restarea/ui/widget/loading_widget.dart';
import 'package:restarea/viewmodel/RestAreaModel.dart';

class BusTrafficPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurantModel = Provider.of<RestAreaModel>(context);

    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.grey[300],
      child: restaurantModel.isLoading_drive_list
          ? LoadingWidget('정보를')
          : ListView(
              children: [
                Container(
                  height: 50,
                  color: color_blue,
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '출발지 -> 도착지',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text('소요시간',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                listtile('서울->대전', '${restaurantModel.drivetime[0].csudjBus}'),
                listtile('서울->대구', '${restaurantModel.drivetime[0].csudgBus}'),
                listtile('서울->울산', '${restaurantModel.drivetime[0].csuusBus}'),
                listtile('서울->부산', '${restaurantModel.drivetime[0].csubsBus}'),
                listtile('서울->광주', '${restaurantModel.drivetime[0].csugjBus}'),
                listtile('서울->목포', '${restaurantModel.drivetime[0].csumpBus}'),
                listtile('서울->강릉', '${restaurantModel.drivetime[0].csukrBus}'),
                listtile('대전->서울', '${restaurantModel.drivetime[0].cdjsuBus}'),
                listtile('대구->서울', '${restaurantModel.drivetime[0].cdgsuBus}'),
                listtile('울산->서울', '${restaurantModel.drivetime[0].cussuBus}'),
                listtile('부산->서울', '${restaurantModel.drivetime[0].cbssuBus}'),
                listtile('광주->서울', '${restaurantModel.drivetime[0].cgjsuBus}'),
                listtile('목포->서울', '${restaurantModel.drivetime[0].cmpsuBus}'),
                listtile('강릉->서울', '${restaurantModel.drivetime[0].ckrsuBus}'),
                listtile('남양주->양양', '${restaurantModel.drivetime[0].csuyyBus}'),
                listtile('양양->남양주', '${restaurantModel.drivetime[0].cyysuBus}'),
              ],
            ),
    );
  }

  Widget listtile(String nodename, String time) {
    return Column(
      children: [
        Container(
          height: 50,
          color: Colors.grey[50],
          padding: EdgeInsets.only(left: 40.0, right: 40.0),
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(nodename),
                Text(time),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
      ],
    );
  }
}
