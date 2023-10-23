import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Welcome To Valorant!'),
        ),
        child: const Center(
          child: Text('Hello Valo Maniac!'),
        ),
    );
  }
}