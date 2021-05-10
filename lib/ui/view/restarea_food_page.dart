import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';
import 'package:provider/provider.dart';
import 'package:restarea/model/route.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:restarea/repository/restbestfood_repository.dart';
import 'package:restarea/ui/widget/color.dart';
import 'package:restarea/ui/widget/loading_widget.dart';
import 'package:restarea/ui/widget/restarea_list_tile.dart';
import 'package:restarea/ui/widget/restarea_list_tile_best.dart';
import 'package:restarea/viewmodel/RestAreaModel.dart';

class RestAreaFoodPage extends StatefulWidget {
  @override
  _RestAreaFoodPageState createState() => _RestAreaFoodPageState();
}

class _RestAreaFoodPageState extends State<RestAreaFoodPage> {
  var size;

  String _myroute;
  String _routecodeResult;

  String _restarea;
  String _restareaResult;
  final formKey = new GlobalKey<FormState>();

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
//          Center(
//            child: Padding(
//              padding: const EdgeInsets.all(15.0),
//              child: DecoratedBox(
//                decoration: const BoxDecoration(color: s_color),
//                child: AutoSizeText(
//                  '휴게소 별 Best 음식',
//                  style: TextStyle(
//                      color: Colors.grey[850],
//                      fontSize: 25,
//                      fontWeight: FontWeight.bold),
//                ),
//              ),
//            ),
//          ),

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

                        restaurantModel.check_fetch(_routecodeResult);

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

                                  restaurantModel.list_fetch(
                                      _routecodeResult, _restareaResult);

                                  restaurantModel.food_list_fetch(
                                      _routecodeResult, _restareaResult);

                                  print('onChanged _restarea: ' +
                                      _restareaResult);
                                });
                              },
                              dataSource: restaurantModel.check_bestfood_check,
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
          restaurantModel.isLoading_food_list
              ? LoadingWidget('메뉴를')
              : Expanded(
                  flex: 5,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: restaurantModel.food_result.map((e) {
                      return RestAreaListTile(e);
                    }).toList(),
                  ),
                ),
        ],
      ),
    );

//    final Widget normalChildButton = SizedBox(
//      width: 93,
//      height: 40,
//      child: Padding(
//        padding: const EdgeInsets.only(left: 16, right: 11),
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            Flexible(
//              child: Text(
//                selectedKey,
//                overflow: TextOverflow.ellipsis,
//              ),
//            ),
//            SizedBox(
//              width: 12,
//              height: 17,
//              child: FittedBox(
//                fit: BoxFit.fill,
//                child: Icon(
//                  Icons.arrow_drop_down,
//                  color: Colors.grey,
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//
//    return Container(
//      color: Colors.grey[200],
//      child: MenuButton(
//        child: normalChildButton,
//        items: route,
//        dontShowTheSameItemSelected: false,
//        topDivider: true,
//        itemBuilder: (value) => Container(
//          height: 40,
//          alignment: Alignment.centerLeft,
//          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
//          child: Text(value['routecode']),
//        ),
//        toggledChild: Container(
//          color: Colors.white,
//          child: normalChildButton,
//        ),
//        divider: Container(
//          height: 1,
//          color: Colors.grey,
//        ),
//        onItemSelected: (value) {
//          setState(() {
//            selectedKey = value['routecode'];
//          });
//        },
//        decoration: BoxDecoration(
//            border: Border.all(color: Colors.grey[300]),
//            borderRadius: const BorderRadius.all(
//              Radius.circular(3.0),
//            ),
//            color: Colors.white),
//        onMenuButtonToggle: (isToggle) {
//          print(isToggle);
//        },
//      ),
//    );
  }
}
