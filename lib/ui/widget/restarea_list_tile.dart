import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restarea/model/restbestfoodlist.dart';
import 'package:restarea/model/restfoodlist.dart';
import 'package:restarea/ui/widget/color.dart';
import 'package:restarea/ui/widget/restarea_list_tile_best_detail.dart';
import 'package:restarea/ui/widget/restarea_list_tile_detail.dart';

class RestAreaListTile extends StatelessWidget {
  final food_list food;

  RestAreaListTile(this.food);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (food.foodNm != null && food.foodCost != null) {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          color: food.bestfoodyn == 'Y' ? color_blue : Colors.grey[300],
          child: ListTile(
              title: Row(
                children: [
                  Container(
                      width: 150, child: AutoSizeText(food.foodNm + '  ')),
                  Text(
                      "₩ ${NumberFormat('###,###,###,###').format(int.parse(food.foodCost)).replaceAll(' ', '')}    "),
                  food.bestfoodyn == 'Y'
                      ? Image.asset(
                          './images/best.png',
                          width: 30,
                          height: 30,
                        )
                      : Container(),
                  food.recommendyn == 'Y'
                      ? Image.asset(
                          './images/recommended.png',
                          width: 30,
                          height: 30,
                        )
                      : Container(),
                  food.premiumyn == 'Y'
                      ? Image.asset(
                          './images/premium.png',
                          width: 30,
                          height: 30,
                        )
                      : Container(),
                ],
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(food.stdRestNm),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return RestAreaListTileDetail(food);
                }));
              }),
        ),
      );
    } else {
      return Container();
    }
  }
}
