import 'package:http/http.dart' as http;
import 'package:todo_list/domain/api_client.dart';

class HttpNetworkClient implements APIClient {
  final http.Client httpClient;

  HttpNetworkClient(this.httpClient);

  @override
  Future<http.Response> get(String url, {Map<String, String>? headers}) {
    return httpClient.get(Uri.parse(url), headers: headers);
  }

  @override
  Future<http.Response> post(String url, {Map<String, String>? headers, dynamic body}) {
    return httpClient.post(Uri.parse(url), headers: headers, body: body);
  }
}
