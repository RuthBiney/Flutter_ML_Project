import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String prediction;

  const ResultScreen({super.key, required this.prediction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prediction Result')),
      body: Center(
        // This centers its child widget
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Predicted TV Sales: $prediction units',
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign
                .center, // This ensures the text itself is centered if it wraps to a new line
          ),
        ),
      ),
    );
  }
}
