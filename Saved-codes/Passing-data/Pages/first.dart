import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  // Create the variable passed in the main.dart

  final String? name;
  // pass the variable name here using "this" keyword
  const FirstPage({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello, $name")),
      body: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("Back"),
      ),
    );
  }
}
