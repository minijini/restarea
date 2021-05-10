import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restarea/model/drivetime.dart';

class DrivingRepository {
  var queryParameters;

  Future<List<drivetime_list>> fetch() async {
    final row = List<drivetime_list>();

    queryParameters = {
      'key': '4365475957',
      'type': 'json',
    };

    var uri = Uri.https(
        'data.ex.co.kr', '/openapi/safeDriving/forecast', queryParameters);

    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        String bodyString = utf8.decode(response.bodyBytes);
        final body = jsonDecode(bodyString);

        body['list'].forEach((e) {
          final row_json = drivetime_list.fromJson(e);

          row.add(row_json);

          print('DrivingRepository body :: $e');
        });
        print('DrivingRepository list  :: ${body['list']}');

        print('DrivingRepository row  :: ${row.toList()}');
        print('DrivingRepository row length :: ${row.length}');
//                    row.toList()..sort((a, b) => a.serviceAreaName.compareTo(b.serviceAreaName));

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
