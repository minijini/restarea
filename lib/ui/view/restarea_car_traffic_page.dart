import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restarea/ui/widget/color.dart';
import 'package:restarea/ui/widget/loading_widget.dart';
import 'package:restarea/viewmodel/RestAreaModel.dart';

class CarTrafficPage extends StatelessWidget {
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
                        Text('소요시간 (시:분)',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                listtile('서울->대전', '${restaurantModel.drivetime[0].csudj}'),
                listtile('서울->대구', '${restaurantModel.drivetime[0].csudg}'),
                listtile('서울->울산', '${restaurantModel.drivetime[0].csuus}'),
                listtile('서울->부산', '${restaurantModel.drivetime[0].csubs}'),
                listtile('서울->광주', '${restaurantModel.drivetime[0].csugj}'),
                listtile('서울->목포', '${restaurantModel.drivetime[0].csump}'),
                listtile('서울->강릉', '${restaurantModel.drivetime[0].csukr}'),
                listtile('대전->서울', '${restaurantModel.drivetime[0].cdjsu}'),
                listtile('대구->서울', '${restaurantModel.drivetime[0].cdgsu}'),
                listtile('울산->서울', '${restaurantModel.drivetime[0].cussu}'),
                listtile('부산->서울', '${restaurantModel.drivetime[0].cbssu}'),
                listtile('광주->서울', '${restaurantModel.drivetime[0].cgjsu}'),
                listtile('목포->서울', '${restaurantModel.drivetime[0].cmpsu}'),
                listtile('강릉->서울', '${restaurantModel.drivetime[0].ckrsu}'),
                listtile('남양주->양양', '${restaurantModel.drivetime[0].csuyy}'),
                listtile('양양->남양주', '${restaurantModel.drivetime[0].cyysu}'),
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
          padding: EdgeInsets.only(left: 40.0, right: 60.0),
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
