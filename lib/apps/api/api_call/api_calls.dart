// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison, dead_code
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCalls {
  static Future<dynamic> RequestPost(
    String uri,
    Map<String, String> body,
  ) async {
    try {
      final url = Uri.parse(uri);
      final response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: body != null ? jsonEncode(body) : null,
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (ex) {
      throw (ex.toString());
    }
  }

  static Future<dynamic> RequestGet(String uri) async {
    try {
      final url = Uri.parse(uri);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (ex) {
      throw (ex.toString());
    }
  }
}
