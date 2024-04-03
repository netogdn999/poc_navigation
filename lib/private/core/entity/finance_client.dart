import 'dart:convert';

import 'package:http/http.dart' as http;

const int _basePort = 8000;
const String ipHost = "192.168.15.185";
const String _baseHost = "$ipHost:$_basePort";

enum FinanceStatusCode {
  ok(200),
  notFound(404);

  const FinanceStatusCode(this.code);

  final int code;

}

final _baseHeader = {
  "Content-Type": "application/json",
};

http.Client? _client; 
configDefaultClient(http.Client value) => _client = value;

Future<http.Response> get({required String path, Map<String, dynamic>? queryParameters, Map<String, String>? headers}) =>
  _withClient((client) => client.get(Uri.http(_baseHost, path, queryParameters), headers: _baseHeader..addAll(headers ?? {})));

Future<http.Response> post({required String path, Map<String, dynamic>? queryParameters, Map<String, String>? headers, Map<String, dynamic>? body}) =>
  _withClient((client) => client.post(Uri.http(_baseHost, path, queryParameters), headers: _baseHeader..addAll(headers ?? {}), body: jsonEncode(body)));

Future<T> _withClient<T>(Future<T> Function(http.Client) fn) async {
  var client = _client ?? http.Client();
  try {
    return await fn(client);
  } finally {
    client.close();
  }
}