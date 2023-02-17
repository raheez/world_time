import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'this is the app bro'
        ),
      ),

      body: Container(
        child: const Text(
          'hello brother',style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
