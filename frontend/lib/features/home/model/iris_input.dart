class IrisInput {
  final double sepalLength;
  final double sepalWidth;
  final double petalLength;
  final double petalWidth;

  IrisInput({
    required this.sepalLength,
    required this.sepalWidth,
    required this.petalLength,
    required this.petalWidth,
  });

  Map<String, dynamic> toJson() {
    return {
      "sepal_length": sepalLength,
      "sepal_width": sepalWidth,
      "petal_length": petalLength,
      "petal_width": petalWidth,
    };
  }
}
