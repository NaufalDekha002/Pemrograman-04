import 'package:flutter/material.dart';
import 'package:ats_1214055/page1.dart';
import 'package:ats_1214055/atsForm.dart';

class DynamicBottomNavbar extends StatefulWidget {
  const DynamicBottomNavbar({super.key});

  @override
  State<DynamicBottomNavbar> createState() => _DynamicBottomNavbarState();
}

class _DynamicBottomNavbarState extends State<DynamicBottomNavbar> {
  int _currentPageIndex = 0;
  final List<Widget> _pages = [
    const MyImage(),
    const MyInputForm1(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
       
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Contact List',
          ),
        ],
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black.withOpacity(.60),
      ),
    );
  }
}