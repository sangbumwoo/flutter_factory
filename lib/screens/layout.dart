import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout'),
      ),
      body: Container(
        color: Colors.amber,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Hello Wolrd'),
            Container(
              color: Colors.pinkAccent,
              child: const Text('Hi there'),
            )
          ],
        ),
      ),
    );
  }
}
