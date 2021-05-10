import 'package:flutter/material.dart';
import 'package:restarea/ui/widget/color.dart';

Widget LoadingWidget(String title) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
        ),
        Text(
          '$title 가져오는 중',
          style: TextStyle(fontSize: 15.0),
        ),
        Padding(padding: EdgeInsets.all(15.0)),
        CircularProgressIndicator(
          backgroundColor: p_color,
        )
      ],
    ),
  );
}
