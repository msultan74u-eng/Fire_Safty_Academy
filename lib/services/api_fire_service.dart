import 'dart:convert';
import 'package:flutter/services.dart';

class ApiService {
  Future<Map<String, dynamic>> getSections() async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/local_data/Fire_Systems.json',
      );

      final data = jsonDecode(jsonString);
      return data;
    } catch (e) {
      throw Exception("Failed to load local API: $e");
    }
  }
}
