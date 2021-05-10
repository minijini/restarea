import 'package:flutter/material.dart';
import 'package:restarea/model/gasstation.dart';

class RestAreaListTileGas extends StatelessWidget {
  final gas_list gas;

  RestAreaListTileGas(this.gas);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(gas.serviceAreaName),
      ),
    );
  }
}
