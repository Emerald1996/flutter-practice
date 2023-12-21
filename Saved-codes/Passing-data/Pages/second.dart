import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    // the route passed in the widget should be retrieved here
    final name = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("Hello, $name")),
      body: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text("Back"),
      ),
    );
  }
}
