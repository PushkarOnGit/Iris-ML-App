import 'dart:convert';

import 'package:frontend/features/home/model/iris_input.dart';
import 'package:frontend/features/home/model/prediction_response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseURL = "http://127.0.0.1:8000/predict";

  static Future<PredictionResponse> predict(IrisInput input) async {
    try {
      final response = await http
          .post(
            Uri.parse(baseURL),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(input.toJson()),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return PredictionResponse.fromJson(jsonResponse);
      } else {
        throw Exception(
          "Server error: ${response.statusCode} - ${response.body}",
        );
      }
    } catch (e) {
      throw Exception("Connection error: $e");
    }
  }
}
