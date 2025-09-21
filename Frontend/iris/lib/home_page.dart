import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[500],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                '🌸 Enter Info 🌸',
                style: TextStyle(fontSize: 35, color: Colors.blue),
              ),

              SizedBox(height: 10),
              buildNumberTextField(
                label: 'Enter Sepal Length (cm)',
                icon: Icons.straighten,
              ),
              SizedBox(height: 20),
              buildNumberTextField(
                label: 'Enter Sepal Width (cm)',
                icon: Icons.swap_horiz,
              ),
              SizedBox(height: 20),
              buildNumberTextField(
                label: 'Enter Petal Length (cm)',
                icon: Icons.straighten,
              ),
              SizedBox(height: 20),
              buildNumberTextField(
                label: 'Enter Petal Width (cm)',
                icon: Icons.swap_horiz,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNumberTextField({required String label, required IconData icon}) {
    return TextField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'^\d*\.?\d{0,2}'),
        ), // allows up to 2 decimals
      ],
      cursorColor: Colors.blue[800],
      style: TextStyle(color: Colors.blue[900]),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.blue[700]),
        fillColor: Colors.blue[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue[800]!, width: 2),
        ),
        prefixIcon: Icon(icon, color: Colors.blue[700]),
      ),
    );
  }
}
