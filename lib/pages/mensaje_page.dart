import 'package:flutter/material.dart';

class MensajePage extends StatelessWidget {
  const MensajePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Push App'),
      ),
      body: const Center(
        child: Text('Mensaje Page'),
      ),
    );
  }
}
