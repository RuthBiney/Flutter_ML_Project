import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Linear Regression Prediction',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PredictionScreen(),
    );
  }
}

class PredictionScreen extends StatefulWidget {
  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final TextEditingController _controller = TextEditingController();
  List<double> predictions = [];

  Future<void> _makePrediction(List<double> input) async {
    final apiUrl = 'https://regression-api.onrender.com/predict';
    final requestBody = jsonEncode({'X': input});

    final response = await http.post(Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'}, body: requestBody);

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      setState(() {
        predictions = List<double>.from(responseBody['predictions']);
      });
    } else {
      throw Exception('Failed to make prediction');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Linear Regression Prediction'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter input values (comma-separated)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final input = _controller.text
                    .split(',')
                    .map((e) => double.parse(e.trim()))
                    .toList();
                _makePrediction(input);
              },
              child: Text('Make Prediction'),
            ),
            SizedBox(height: 20),
            Text('Predictions:'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: predictions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Prediction: ${predictions[index]}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
