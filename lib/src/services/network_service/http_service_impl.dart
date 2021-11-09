import 'dart:convert';
import 'dart:io';

import 'package:acumen_task/src/services/base/api.dart';
import 'package:acumen_task/src/shared/models/failure.dart';
import 'package:acumen_task/src/shared/models/http_service_exception.dart';
import 'package:http/http.dart' as http;

import 'i_network_service.dart';

class HttpServiceImpl implements INetworkService {
  @override
  API get getAPI => API();

  void _throwOnFail(http.Response res) {
    if (res.statusCode != 201 && res.statusCode != 200) {
      print('Error Code: ${res.statusCode}');
      final errorString = res.body;
      print(errorString);
      final exception = HttpServiceException.fromJson(json.decode(errorString));
      print(
        'HttpServiceException: StatusCode {${exception.success}}, Message {${exception.message}}',
      );
      throw exception;
    }
  }

  @override
  Future<dynamic> get(Uri uri) async {
    try {
      final response = await http.get(uri);
      _throwOnFail(response);
      return jsonDecode(response.body);
    } on SocketException {
      throw Failure('Please check your internet connection');
    } on FormatException {
      throw Failure('Bad response format');
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Future<dynamic> post(
    Uri uri, {
    required Map<String, dynamic> inputJson,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.post(uri, body: inputJson, headers: headers);
      _throwOnFail(response);

      return response.body;
    } on SocketException {
      throw Failure('Please check your internet connection');
    } on FormatException {
      throw Failure('Bad response format');
    } catch (e) {
      throw Failure('An error occured, kindly check your details');
    }
  }

  @override
  Future<dynamic> put(
    Uri uri, {
    required Map<String, dynamic> inputJson,
  }) async {
    try {
      final response = await http.put(uri, body: inputJson);

      _throwOnFail(response);
      return jsonDecode(response.body);
    } on SocketException {
      throw Failure('Please check your internet connection');
    } on FormatException {
      throw Failure('Bad response format');
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Future<dynamic> delete(Uri uri) async {
    try {
      final response = await http.delete(uri);
      _throwOnFail(response);
      return jsonDecode(response.body);
    } on SocketException {
      throw Failure('Please check your internet connection');
    } on FormatException {
      throw Failure('Bad response format');
    } catch (e) {
      throw Failure(e.toString());
    }
  }
}
