import 'package:flutter/material.dart';
import 'package:flutter_project/Pages/first.dart';
import 'package:flutter_project/Pages/second.dart';

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
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const MyHomePage(title: "settings"),
        "/first":(context) => const FirstPage(),
        "/second":(context) => const SecondPage()
      },
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    // passing data using push Navigation method
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FirstPage(name: "Emmy"),),
                    );
                  },
                  child: const Text("Click to First Page")
                ),
              TextButton(
                  onPressed: () {
                    // the widget (const second()) should be defined at the routes for the pushNamed method
                    Navigator.pushNamed(context, "/second", arguments: "Davies"
                    );
                  },
                  child: const Text("Click to Second Page")
                )
            ],
          ),
        ));
  }
}
