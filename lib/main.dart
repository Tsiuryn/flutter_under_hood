import 'package:flutter/material.dart';
import 'package:flutter_under_hood/widgets/flutter_architecture.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          color: Colors.grey,
        ),
        const Expanded(
            child: SizedBox(
          child: FlutterArchitecture(),
        ))
      ],
    );
  }
}
