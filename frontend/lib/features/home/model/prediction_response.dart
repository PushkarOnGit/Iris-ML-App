class PredictionResponse {
  final String prediction;

  PredictionResponse({required this.prediction});

  factory PredictionResponse.fromJson(Map<String, dynamic> json) {
    return PredictionResponse(prediction: json["prediction"]);
  }
}
