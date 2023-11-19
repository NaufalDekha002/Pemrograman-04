import 'package:flutter/material.dart';

class MyImage extends StatelessWidget{
  const MyImage ({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATS Pemrograman Mobile'),
        backgroundColor: Colors.deepOrangeAccent,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar
            Image.asset(
              'images/logo.jpg', // Gantilah dengan path gambar Anda
              width: 200.0, // Sesuaikan dengan lebar yang diinginkan
              height: 200.0, // Sesuaikan dengan tinggi yang diinginkan
              fit: BoxFit.cover, // Sesuaikan dengan mode penyesuaian gambar
            ),
            SizedBox(height: 20.0), // Jarak antara gambar dan teks
            // Teks di bawah gambar
            Text(
              'Naufal Dekha Widana',
              style: TextStyle(fontSize: 32.0),
            ),
            Text(
              '1214055',
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              '3B-D4 Teknik Informatika',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}

