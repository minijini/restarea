import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:restarea/model/drivetime.dart';
import 'package:restarea/model/gasstation.dart';
import 'package:restarea/model/restbestfoodlist.dart';
import 'package:restarea/model/restfoodlist.dart';
import 'package:restarea/repository/driving_repository.dart';
import 'package:restarea/repository/gasstation_Repository.dart';
import 'package:restarea/repository/restbestfood_repository.dart';
import 'package:restarea/repository/restfood_repository.dart';
import 'package:restarea/ui/view/restarea_food_page.dart';
import 'package:restarea/ui/view/restarea_home_page.dart';
import 'package:restarea/ui/view/restarea_toll_page.dart';
import 'package:restarea/ui/view/restarea_traffic_page.dart';

class RestAreaModel with ChangeNotifier {
  List<BFood> check_bestfood = [];
  List<BFood> check_bestfood_result = [];

  List<food_list> food = [];
  List<food_list> food_result = [];

  List<drivetime_list> drivetime = [];

  List<gas_list> gas = [];

  int index;

  var check_bestfood_check = List();
  var gas_check = List();
  final _restbestfoodRepository = RestBestFoodRepository();
  final _restfoodRepository = RestFoodRepository();
  final _drivingRepository = DrivingRepository();
  final _gasRepository = GasStationRapository();

  var isLoading = false;
  var isLoading_list = false;
  var isLoading_food_list = false;
  var isLoading_drive_list = false;
  var isLoading_gas_list = false;

  RestAreaModel() {
    check_fetch('first');
    driving_list_fetch();
    gas_check_fetch('');
  }

  Future check_fetch(String code) async {
    var routecode;

    isLoading = true;
    check_bestfood_check.clear();
    notifyListeners();

    if (code == 'first') {
      routecode = 'first';
    } else {
      routecode = code;
    }

    check_bestfood_check = await _restbestfoodRepository.fetch(routecode, '');

    isLoading = false;
    notifyListeners();
  }

  Future list_fetch(String routecode, String areacode) async {
    isLoading_list = true;
    check_bestfood_result.clear();
    notifyListeners();

    check_bestfood =
        await _restbestfoodRepository.fetch_bestfood_list(routecode, areacode);

    check_bestfood.forEach((e) {
      check_bestfood_result.add(e);
    });

    isLoading_list = false;
    notifyListeners();
  }

  Future food_list_fetch(String routecode, String areacode) async {
    isLoading_food_list = true;
    food_result.clear();
    notifyListeners();

    food = await _restfoodRepository.fetch_food_list(routecode, areacode);

    food.forEach((e) {
      food_result.add(e);
    });

    isLoading_food_list = false;
    notifyListeners();
  }

  Future driving_list_fetch() async {
    isLoading_drive_list = true;
    drivetime.clear();
    notifyListeners();

    drivetime = await _drivingRepository.fetch();

    isLoading_drive_list = false;
    notifyListeners();
  }

  Future gas_list_fetch(String routecode, String areacode) async {
    isLoading_gas_list = true;
    gas.clear();
    notifyListeners();

    gas = await _gasRepository.fetch_gas_list(routecode, areacode);

    print('gas_check :: $gas_check');
    isLoading_gas_list = false;
    notifyListeners();
  }

  Future gas_check_fetch(String code) async {
    isLoading_gas_list = true;
    gas_check.clear();
    notifyListeners();

    gas_check = await _gasRepository.fetch_gas_check(code);

    print('gas_check :: $gas_check');
    isLoading_gas_list = false;
    notifyListeners();
  }
}
