import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'settings'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Image.network(
                  "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
              const Text("Hello"),
              const Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Username"),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Notification"),
                  Switch(
                      value: value,
                      onChanged: (newValue) {
                        setState(() {
                          value = newValue;
                        });
                  }),

                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Save'),
              ),
            ],
          ),
        ));
  }
}
