import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restarea/model/restfoodlist.dart';

class RestFoodRepository {
  var queryParameters;

  Future<List<food_list>> fetch_food_list(
      String routeCode, String areacode) async {
    final row = List<food_list>();
    queryParameters = {
      'key': '4365475957',
      'type': 'json',
      'pageNo': '1',
      'numOfRows': '300',
      'routeCd': routeCode,
      'stdRestCd': areacode,
    };

    var uri = Uri.https(
        'data.ex.co.kr', '/openapi/restinfo/restBestfoodList', queryParameters);

    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        String bodyString = utf8.decode(response.bodyBytes);
        final body = jsonDecode(bodyString);

        body['list'].forEach((e) {
          final row_json = food_list.fromJson(e);
          row.add(row_json);
        });

        return row.toList();
      } else {
        return [];
      }
    } catch (e) {
      print('http error :: $e');
      return [];
    }
  }
}
