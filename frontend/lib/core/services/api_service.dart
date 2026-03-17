import 'dart:convert';

import 'package:frontend/features/home/model/iris_input.dart';
import 'package:frontend/features/home/model/prediction_response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseURL = "http://10.0.0.0:8000/predict";

  static Future<PredictionResponse> predict(IrisInput input) async {
    final response = await http.post(
      Uri.parse(baseURL),
      headers: {"ContentType": "Application/json"},
      body: jsonEncode(input.toJson()),
    );

    if (response.statusCode == 200) {
      return PredictionResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("API Failed");
    }
  }
}
