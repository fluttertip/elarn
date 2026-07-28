import 'dart:convert';
import 'package:flutter/services.dart';

abstract final class JsonLoader {
  static Future<List<T>> loadList<T>(String assetPath, T Function(dynamic value) parser) async {
    final raw = await rootBundle.loadString(assetPath);
    final decoded = jsonDecode(raw);
    if (decoded is! List) {
      throw const FormatException('Expected a JSON list.');
    }
    return decoded.map(parser).toList();
  }

  static Future<Map<String, dynamic>> loadMap(String assetPath) async {
    final raw = await rootBundle.loadString(assetPath);
    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Expected a JSON object.');
    }
    return decoded;
  }
}
