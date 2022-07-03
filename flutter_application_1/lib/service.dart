import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_application_1/model.dart';

Future<List<ApiModel>> fetchNotes(String url) async {
  try {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final resultJson = json.decode(response.body) as List;

      return resultJson.map((dynamic json) {
        return ApiModel(title: json['title'] as String, id: json['id'] as int);
      }).toList();
    }
  } catch (e) {
    print(e);
  }
  throw Exception('bad Internet connection');
}
