import 'package:flutter/material.dart';

class MensajePage extends StatelessWidget {
  const MensajePage({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments;

    String data = arg as String ?? "";
    print('data : $data');

    return Scaffold(
      appBar: AppBar(
        title: Text('Push App - Mensaje Page'),
      ),
      body: Center(
        child: Text('data : $data'),
      ),
    );
  }
}
