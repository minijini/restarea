import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restarea/ui/view/restarea_main_page.dart';
import 'package:restarea/viewmodel/RestAreaModel.dart';

void main() {
  runApp(ChangeNotifierProvider.value(value: RestAreaModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RestAreaMainPage(),
    );
  }
}
