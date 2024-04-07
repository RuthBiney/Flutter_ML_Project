import 'package:flutter/material.dart';
import 'input_screen.dart';

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Welcome to the TV Sales Predictor!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text(
                  'Get started by entering your advertising spend to predict TV sales.',
                  textAlign: TextAlign.center),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputScreen())),
                child: Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
