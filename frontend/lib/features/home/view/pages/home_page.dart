import 'package:flutter/material.dart';
import 'package:frontend/features/home/model/iris_input.dart';
import 'package:frontend/features/home/view/widgets/custom_text_field.dart';
import 'package:frontend/features/home/viewmodel/iris_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final vm = IrisViewmodel();

  //controllers
  final TextEditingController sepalLengthController = TextEditingController();
  final TextEditingController sepalWidthController = TextEditingController();
  final TextEditingController petalLengthController = TextEditingController();
  final TextEditingController petalWidthController = TextEditingController();

  @override
  void dispose() {
    sepalLengthController.dispose();
    sepalWidthController.dispose();
    petalLengthController.dispose();
    petalWidthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
        title: const Text('Iris Classifier'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: sepalLengthController,
              hintText: "Sepal Length",
              icon: Icons.straighten,
            ),

            CustomTextField(
              controller: sepalWidthController,
              hintText: "Sepal Width",
              icon: Icons.straighten,
            ),

            CustomTextField(
              controller: petalLengthController,
              hintText: "Petal Length",
              icon: Icons.local_florist,
            ),

            CustomTextField(
              controller: petalWidthController,
              hintText: "Petal Width",
              icon: Icons.local_florist,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                final input = IrisInput(
                  sepalLength: double.parse(sepalLengthController.text),
                  sepalWidth: double.parse(sepalWidthController.text),
                  petalLength: double.parse(petalLengthController.text),
                  petalWidth: double.parse(petalWidthController.text),
                );
                await vm.predict(input);

                setState(() {});
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Prediction'),
                    content: Text(vm.prediction),
                  ),
                );
              },
              child: const Text("Predict"),
            ),
          ],
        ),
      ),
    );
  }
}
