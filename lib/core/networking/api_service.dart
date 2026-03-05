import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://api.themoviedb.org/';
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get1({required String endPoint}) async {
    final response = await http.get(Uri.parse('$_baseUrl$endPoint'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> get2({required String endPoint}) async {
    final response = await http.get(Uri.parse('$_baseUrl$endPoint'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> get3({required String endPoint}) async {
    final response = await http.get(Uri.parse('$_baseUrl$endPoint'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }
}
