import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text('IMC Calculator'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      body: Container(),
    );
  }
}
