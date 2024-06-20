import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:aduan/global.dart';

class AduanProvider extends GetConnect {
  Future<http.Response> getAduan() async {
    var url = Uri.parse('$baseUrl/api/auth/aduans');
    try {
      var response = await http.get(url);
      if (kDebugMode) {
        print('Get Aduan Response: ${response.body}');
      }
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching Aduan: $e');
      }
      rethrow;
    }
  }

  Future<http.Response> updateLike(
      int id, int newLikeCount, String token, bool statusLike) async {
    var url = Uri.parse('$baseUrl/api/auth/aduans/$id');
    try {
      var response = await http.put(url,
          body: jsonEncode({'like': newLikeCount, 'status_like': statusLike}),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });
      if (kDebugMode) {
        print('Update Like Response: ${response.body}');
      }
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error updating Like: $e');
      }
      rethrow;
    }
  }

  Future<http.Response> updateStatus(
      int id, String status, String token) async {
    var url = Uri.parse('$baseUrl/api/auth/aduans/$id/status');
    try {
      var response =
          await http.put(url, body: jsonEncode({'status': status}), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (kDebugMode) {
        print('Update Status Response: ${response.body}');
      }
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error updating Status: $e');
      }
      rethrow;
    }
  }
}
