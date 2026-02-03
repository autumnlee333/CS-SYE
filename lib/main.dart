import 'package:flutter/material.dart';
import 'package:quiz_app/screen_controller.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
          backgroundColor: Colors.deepOrange,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrange, Colors.pink],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),

          child: const ScreenController(),
        ),
      ),
    ),
  );
}
