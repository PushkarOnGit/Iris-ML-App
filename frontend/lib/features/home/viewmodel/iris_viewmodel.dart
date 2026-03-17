import 'package:flutter/material.dart';
import 'package:frontend/core/services/api_service.dart';
import 'package:frontend/features/home/model/iris_input.dart';

class IrisViewmodel extends ChangeNotifier {
  String prediction = "";
  bool isLoading = false;

  Future<void> predict(IrisInput input) async {
    isLoading = true;
    notifyListeners();

    try {
      final respose = await ApiService.predict(input);
      prediction = respose.prediction;
    } catch (e) {
      prediction = "Error Occurred";
    }

    isLoading = false;
    notifyListeners();
  }
}
