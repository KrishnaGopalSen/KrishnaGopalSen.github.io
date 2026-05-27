import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../features/datamodel/loginresponsemodel.dart';

class ApiService {

  /// =========================
  /// BASE URL
  /// =========================

  static String get baseUrl {

    /// Android Emulator
    if (!kIsWeb &&
        defaultTargetPlatform == TargetPlatform.android) {
      return "http://10.0.2.2:8000/api";
    }

    /// iOS Simulator + Web + Mac
    return "http://localhost:8000/api";

    /// Real Device Example
    /// return "http://192.168.1.5:8000/api";
  }

  /// =========================
  /// LOGIN API
  /// =========================

  static Future<LoginResponseModel?> login({
    required String email,
    required String password,
    required String endPoint,
  }) async {

    try {

      final response = await http.post(
        Uri.parse("$baseUrl$endPoint"),
        headers: {
          "Content-Type": "application/json",
        },

        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      final data = jsonDecode(response.body);
     log("Login Response >>>>>>>>.... $data");
      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(data);
      } else {
        return LoginResponseModel.fromJson(data);
      }
    } catch (e) {
      log("Error :    $e");
      return null;
    }
  }

}