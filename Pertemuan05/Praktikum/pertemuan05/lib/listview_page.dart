import 'package:flutter/material.dart';


class MyListView extends StatelessWidget{
  const MyListView ({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return Scaffold(
       body: ListView(
        children:<Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '1',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '2',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '3',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ],
       ), 
    );
  }
}