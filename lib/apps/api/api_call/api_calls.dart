// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison, dead_code
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:taskmanagement/core/path/path.dart';

class ApiCalls {
  static Future<http.Response> RequestPost({
    required String uri,
    required Map<String, String> body,
    String? token,
  }) async {
    try {
      final url = Uri.parse(uri);
      final response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "token": token ?? "",
        },
        body: body != null ? jsonEncode(body) : null,
      );
      debugPrint(response.statusCode.toString());

      return response;
    } catch (ex) {
      throw (ex.toString());
    }
  }

  static Future<http.Response> RequestGet({
    required String uri,
    String? token,
  }) async {
    try {
      final url = Uri.parse(uri);
      final response = await http.get(url, headers: {"token": token ?? ""});

      return response;
    } catch (ex) {
      throw (ex.toString());
    }
  }
}
