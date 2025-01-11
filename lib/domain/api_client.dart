import 'package:http/http.dart' as http;

abstract class APIClient {
  Future<http.Response> get(String url, {Map<String, String>? headers});
  Future<http.Response> post(String url, {Map<String, String>? headers, dynamic body});
}
