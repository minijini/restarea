import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restarea/model/route.dart';
import 'package:restarea/ui/widget/loading_widget.dart';
import 'package:restarea/ui/widget/restarea_list_tile_gas.dart';
import 'package:restarea/viewmodel/RestAreaModel.dart';

class RestAreaGasPage extends StatefulWidget {
  @override
  _RestAreaGasPageState createState() => _RestAreaGasPageState();
}

class _RestAreaGasPageState extends State<RestAreaGasPage> {
  var size;

  String _myroute;
  String _routecodeResult;

  String _restarea;
  String _restareaResult;

  @override
  void initState() {
    super.initState();

    _myroute = '';
    _routecodeResult = '';
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    final restaurantModel = Provider.of<RestAreaModel>(context);

    return Container(
      width: size.width,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  width: 200,
                  padding: EdgeInsets.all(10),
                  child: DropDownFormField(
                    titleText: '노선명',
                    hintText: '노선을 선택해주세요.',
                    value: _myroute,
                    onSaved: (value) {
                      setState(() {
                        _myroute = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _myroute = value;
                        _routecodeResult = _myroute;

                        restaurantModel.gas_check_fetch(_routecodeResult);

                        restaurantModel.gas_list_fetch(_routecodeResult, '');

                        print('onChanged_routecodeResult :' + _routecodeResult);
                      });
                    },
                    dataSource: route.toList()
                      ..sort(
                          (a, b) => a['routename'].compareTo(b['routename'])),
                    textField: 'routename',
                    valueField: 'routecode',
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: restaurantModel.isLoading
                    ? LoadingWidget('휴게소 정보를')
                    : restaurantModel.check_bestfood_check.isNotEmpty
                        ? Container(
                            width: 200,
                            padding: EdgeInsets.all(10),
                            child: DropDownFormField(
                              titleText: '휴게소',
                              hintText: '휴게소를 선택해주세요.',
                              value: _restarea != null ? _restarea : '',
                              onSaved: (value) {
                                setState(() {
                                  _restarea = value;
                                });
                              },
                              onChanged: (value) {
                                setState(() {
                                  _restarea = value;
                                  _restareaResult = _restarea;

                                  restaurantModel.gas_list_fetch(
                                      _routecodeResult, _restareaResult);
                                });
                              },
                              dataSource: restaurantModel.gas_check,
                              textField: 'serviceAreaName',
                              valueField: 'serviceAreaCode2',
                            ),
                          )
                        : AlertDialog(
                            elevation: 1,
                            backgroundColor: Colors.white70,
                            title: Text('휴게소가 없습니다.'),
                          ),
              ),
            ],
          ),
//          restaurantModel.isLoading_list
//              ? LoadingWidget('메뉴를')
//              : Expanded(
//                  flex: 1,
//                  child: ListView(
//                    scrollDirection: Axis.vertical,
//                    shrinkWrap: true,
//                    children: restaurantModel.check_bestfood_result.map((e) {
//                      return RestAreaBestListTile(e);
//                    }).toList(),
//                  ),
//                ),
          restaurantModel.isLoading_gas_list
              ? LoadingWidget('주유소 정보를')
              : Expanded(
                  flex: 5,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: restaurantModel.gas.map((e) {
                      return RestAreaListTileGas(e);
                    }).toList(),
                  ),
                ),
        ],
      ),
    );
  }
}
