import 'package:flutter/material.dart';
import 'result_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _controller = TextEditingController();
  
  get keyboardType => null;

  @override
  Widget build(BuildContext context) 
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Advertising Spend')),
      body: Center(
        // This centers the Column widget
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize
                .min, // This tells the Column to take up minimal space, which helps centering vertically
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration:
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Placeholder for prediction logic
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ResultScreen(prediction: '1000')));
                },
                child: Text('Predict'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
