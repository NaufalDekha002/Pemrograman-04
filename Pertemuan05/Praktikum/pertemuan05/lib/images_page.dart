import 'package:flutter/material.dart';

class MyImage extends StatelessWidget{
  const MyImage ({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5'),
        backgroundColor: Colors.deepOrangeAccent,
      ),

      body: Center(
        child: Image.asset('images/logo.jpg',
        width: 400,
        height: 400,
        ),
      ),
    );
  }
}

class MyFont extends StatelessWidget{
  const MyFont ({Key? key}) : super(key: key);


  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5'),
        backgroundColor: Colors.deepOrangeAccent,
      ),

      body: Center(
        child: Text(
          'Custom Font',
          style: TextStyle(
            fontFamily: 'Agbalumo',
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}