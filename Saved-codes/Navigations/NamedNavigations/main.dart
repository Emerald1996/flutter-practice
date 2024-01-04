// // This is when there are multiple routes on the page

// import 'package:flutter/material.dart';
// import 'package:flutter_project/Pages/add.dart';
// import 'package:flutter_project/Pages/completed.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
      
//       debugShowCheckedModeBanner: false,
//       routes: {
//         "/": (context) => const MyHomePage(title: "settings"),
//         "/first":(context) => const FirstPage(),
//         "/second":(context) => const SecondPage()
//       },
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           title: Text(widget.title),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextButton(
//                   onPressed: () {
//                     // the context passed in the of function is coming from the widget tree in the MaterialApp having a Navigator state
//                     Navigator.of(context).pushNamed("/first");
//                   },
//                   child: const Text("Click to First Page")
//                 ),
//               TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, "/second");
//                   },
//                   child: const Text("Click to Second Page")
//                 )
//             ],
//           ),
//         ));
//   }
// }
