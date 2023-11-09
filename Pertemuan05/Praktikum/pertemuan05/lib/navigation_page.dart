import 'package:flutter/material.dart';


class FirstScreen extends StatelessWidget{
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: OutlinedButton(
          child: const Text('Pindah Screen!'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen()
            ));
          },
        ),
      ),
    );
  }
}


class SecondScreen extends StatelessWidget{
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: OutlinedButton(
          child: const Text('Go back!'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstScreen()
            ));
          },
        ),
      ),
    );
  }
}