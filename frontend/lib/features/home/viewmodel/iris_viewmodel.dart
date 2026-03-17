import 'package:flutter/material.dart';
import 'package:frontend/core/services/api_service.dart';
import 'package:frontend/features/home/model/iris_input.dart';

class IrisViewmodel extends ChangeNotifier {
  String prediction = "";
  bool isLoading = false;
  String? errorMessage;

  Future<void> predict(IrisInput input) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final respose = await ApiService.predict(input);
      prediction = respose.prediction;
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString().replaceAll("Exception: ", "");
      prediction = "";
    }

    isLoading = false;
    notifyListeners();
  }
}
