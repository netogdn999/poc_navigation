import 'dart:convert';

import 'dart:typed_data';

import 'package:http/http.dart';

class FinanceClientFake implements Client {
  String shouldResponse = '';
  int withStatusCode = 200;
  Exception? shouldThrownException;

  @override
  void close() {}

  @override
  Future<Response> delete(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    try {
      if(shouldThrownException != null) {
        throw shouldThrownException!;
      }
      return Response(shouldResponse, withStatusCode);
    } finally {
      shouldThrownException = null;
    }
  }

  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) async {
    try {
      if(shouldThrownException != null) {
        throw shouldThrownException!;
      }
      return Response(shouldResponse, withStatusCode);
    } finally {
      shouldThrownException = null;
    }
  }

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) async {
    try {
      if(shouldThrownException != null) {
        throw shouldThrownException!;
      }
      return Response(shouldResponse, withStatusCode);
    } finally {
      shouldThrownException = null;
    }
  }

  @override
  Future<Response> patch(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    try {
      if(shouldThrownException != null) {
        throw shouldThrownException!;
      }
      return Response(shouldResponse, withStatusCode);
    } finally {
      shouldThrownException = null;
    }
  }

  @override
  Future<Response> post(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    try {
      if(shouldThrownException != null) {
        throw shouldThrownException!;
      }
      return Response(shouldResponse, withStatusCode);
    } finally {
      shouldThrownException = null;
    }
  }

  @override
  Future<Response> put(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    try {
      if(shouldThrownException != null) {
        throw shouldThrownException!;
      }
      return Response(shouldResponse, withStatusCode);
    } finally {
      shouldThrownException = null;
    }
  }

  @override
  Future<String> read(Uri url, {Map<String, String>? headers}) async {
    try {
      if(shouldThrownException != null) {
        throw shouldThrownException!;
      }
      return shouldResponse;
    } finally {
      shouldThrownException = null;
    }
  }

  @override
  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) async {
    try {
      if(shouldThrownException != null) {
        throw shouldThrownException!;
      }
      return Uint8List.fromList(shouldResponse.codeUnits);
    } finally {
      shouldThrownException = null;
    }
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    try {
      if(shouldThrownException != null) {
        throw shouldThrownException!;
      }
      return StreamedResponse(Stream.value(shouldResponse.codeUnits), withStatusCode);
    } finally {
      shouldThrownException = null;
    }
  }

}