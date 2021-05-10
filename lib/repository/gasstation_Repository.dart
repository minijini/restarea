import 'package:restarea/model/gasstation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GasStationRapository {
  var queryParameters;
  Future<List<gas_list>> fetch_gas_list(
      String routeCode, String areacode) async {
    print('routecode :: $routeCode  //  areacode :: $areacode');
    final row = List<gas_list>();

    queryParameters = {
      'key': '4365475957',
      'type': 'json',
      'pageNo': '1',
      'numOfRows': '300',
      'routeCode': routeCode,
      'serviceAreaCode2': areacode,
    };

    var uri = Uri.https(
        'data.ex.co.kr', '/openapi/business/curStateStation', queryParameters);

    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        String bodyString = utf8.decode(response.bodyBytes);
        final body = jsonDecode(bodyString);

        body['list'].forEach((e) {
          final row_json = gas_list.fromJson(e);
          row.add(row_json);

          print(e);
        });

        return row.toList()
          ..sort((a, b) => a.serviceAreaName.compareTo(b.serviceAreaName));
      } else {
        return [];
      }
    } catch (e) {
      print('http error :: $e');
      return [];
    }
  }

  Future<List> fetch_gas_check(String code) async {
    final row = List();

    queryParameters = {
      'key': '4365475957',
      'type': 'json',
      'pageNo': '1',
      'numOfRows': '300',
      'routeCode': code,
    };

    var uri = Uri.https(
        'data.ex.co.kr', '/openapi/business/curStateStation', queryParameters);

    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        String bodyString = utf8.decode(response.bodyBytes);
        final body = jsonDecode(bodyString);

        body['list'].forEach((e) {
          row.add(e);
        });

        return row.toList()
          ..sort(
              (a, b) => a['serviceAreaName'].compareTo(b['serviceAreaName']));
      } else {
        return [];
      }
    } catch (e) {
      print('http error :: $e');
      return [];
    }
  }
}
