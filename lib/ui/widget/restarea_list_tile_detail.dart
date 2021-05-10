import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:restarea/model/restbestfoodlist.dart';
import 'package:restarea/model/restfoodlist.dart';
import 'package:restarea/ui/widget/color.dart';

class RestAreaListTileDetail extends StatefulWidget {
  final food_list food;

  RestAreaListTileDetail(this.food);

  @override
  _RestAreaListTileDetailState createState() => _RestAreaListTileDetailState();
}

class _RestAreaListTileDetailState extends State<RestAreaListTileDetail> {
  var season = '';

  @override
  void initState() {
    super.initState();

    if (widget.food.seasonMenu == '4') {
      season = '봄/여름/가을/겨울';
    } else if (widget.food.seasonMenu == 'S') {
      season = '여름';
    } else if (widget.food.seasonMenu == 'W') {
      season = '겨울';
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: b_color,
        title: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 50.0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    widget.food.foodNm + '  ',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  widget.food.bestfoodyn == 'Y'
                      ? Image.asset(
                          './images/best.png',
                          width: 30,
                          height: 30,
                        )
                      : Container(),
                  widget.food.recommendyn == 'Y'
                      ? Image.asset(
                          './images/recommended.png',
                          width: 30,
                          height: 30,
                        )
                      : Container(),
                  widget.food.premiumyn == 'Y'
                      ? Image.asset(
                          './images/premium.png',
                          width: 30,
                          height: 30,
                        )
                      : Container(),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                widget.food.stdRestNm,
                style: TextStyle(
                  color: Colors.grey[350],
                  fontSize: 17.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Container(
          decoration: BoxDecoration(
            color: color_blue,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  '가격',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '   ₩ ${NumberFormat('###,###,###,###').format(int.parse(widget.food.foodCost)).replaceAll(' ', '')}',
                  style: TextStyle(fontSize: 18.0, color: Colors.black54),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '음식 재료 ',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                widget.food.foodMaterial != null
                    ? Html(
                        data: '   ' + widget.food.foodMaterial,
                        defaultTextStyle:
                            TextStyle(fontSize: 18.0, color: Colors.black54),
                      )
                    : Text(
                        '   재료 데이터가 없습니다.',
                        style: TextStyle(fontSize: 18.0, color: Colors.black54),
                      ),

                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '음식 설명 ',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: widget.food.etc != null
                      ? Text('${widget.food.etc}',
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.black54))
                      : Text(' 음식 설명이 없습니다.',
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.black54)),
                ),

                SizedBox(
                  height: 20.0,
                ),

                Text(
                  '시즌메뉴여부',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(season != null ? '    $season' : '',
                    style: TextStyle(fontSize: 18.0, color: Colors.black54)),
                SizedBox(
                  height: 20.0,
                ),

                Text(
                  '휴게소 주소',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('    ${widget.food.svarAddr}',
                    style: TextStyle(fontSize: 18.0, color: Colors.black54)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
