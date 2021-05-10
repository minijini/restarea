import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restarea/model/restbestfoodlist.dart';

class RestBestFoodRepository {
  var queryParameters;

  Future<List> fetch(String routeCode, String areacode) async {
    final row = List();

    if (routeCode == 'first') {
      queryParameters = {
        'key': '4365475957',
        'type': 'json',
        'pageNo': '1',
        'numOfRows': '300',
      };
    } else {
      queryParameters = {
        'key': '4365475957',
        'type': 'json',
        'pageNo': '1',
        'numOfRows': '300',
        'routeCode': routeCode,
        'serviceAreaCode2': areacode,
      };
    }

    var uri = Uri.https('data.ex.co.kr',
        '/openapi/business/representFoodServiceArea', queryParameters);

    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        String bodyString = utf8.decode(response.bodyBytes);
        final body = jsonDecode(bodyString);

        body['list'].forEach((e) {
//          final row_json = BFood.fromJson(e);

          row.add(e);

          print('body :: $e');
        });
        print('RestaurantRepository list  :: ${body['list']}');

        print('RestaurantRepository row  :: ${row.toList()}');
        print('RestaurantRepository row length :: ${row.length}');
//                    row.toList()..sort((a, b) => a.serviceAreaName.compareTo(b.serviceAreaName));

        return row.where((e) => e['serviceAreaName'] != '행담도휴게소').toList()
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

  Future<List<BFood>> fetch_bestfood_list(
      String routeCode, String areacode) async {
    final row = List<BFood>();
    queryParameters = {
      'key': '4365475957',
      'type': 'json',
      'pageNo': '1',
      'numOfRows': '300',
      'routeCode': routeCode,
      'serviceAreaCode2': areacode,
    };

    var uri = Uri.https('data.ex.co.kr',
        '/openapi/business/representFoodServiceArea', queryParameters);

    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        String bodyString = utf8.decode(response.bodyBytes);
        final body = jsonDecode(bodyString);

        body['list'].forEach((e) {
          final row_json = BFood.fromJson(e);
          row.add(row_json);
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
}
