import 'package:flutter/material.dart';
import 'package:restarea/model/restbestfoodlist.dart';
import 'package:restarea/ui/widget/color.dart';
import 'package:restarea/ui/widget/restarea_list_tile_best_detail.dart';

class RestAreaBestListTile extends StatelessWidget {
  final BFood bFood;

  RestAreaBestListTile(this.bFood);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (bFood.batchMenu != null && bFood.salePrice != null) {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          color: color_blue,
          child: ListTile(
              title: Row(
                children: [
                  Text(bFood.batchMenu + '  '),
                  Text(bFood.salePrice + '  '),
                  Image.asset(
                    './images/best.png',
                    width: 30,
                    height: 30,
                  ),
                ],
              ),
              subtitle: Text(bFood.serviceAreaName),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return RestAreaListTileBestDetail(bFood);
                }));
              }),
        ),
      );
    } else {
      return Container();
    }
  }
}
