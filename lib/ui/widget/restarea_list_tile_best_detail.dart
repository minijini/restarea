import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restarea/model/restbestfoodlist.dart';
import 'package:restarea/ui/widget/color.dart';

class RestAreaListTileBestDetail extends StatelessWidget {
  final BFood bFood;

  RestAreaListTileBestDetail(this.bFood);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: b_color,
        title: Center(
            child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 50.0, 0),
          child: Text(bFood.batchMenu),
        )),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.0,
              ),
//              Text(
//                bFood.batchMenu,
//                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
//              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '가격 : ' + bFood.salePrice,
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '휴게소 : ' + bFood.serviceAreaName,
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '휴게소 주소 : ' + bFood.svarAddr,
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
