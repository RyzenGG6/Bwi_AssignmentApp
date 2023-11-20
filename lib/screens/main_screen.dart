import 'package:bwi_intern/screens/Category.dart';
import 'package:bwi_intern/screens/home.dart';
import 'package:flutter/material.dart';


class main_screen extends StatefulWidget {
  const main_screen({super.key});

  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  int currentIndex = 0;

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon:Container(
                height: 20,
                child: Image.asset('Assets/images/home_icon.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
                height: 30,
          child: Image.asset('Assets/images/menu_icon.png')),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Container(
                height: 30,
                child: Image.asset('Assets/images/calendar.png')),
            // Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Container(
                height: 30,
                child: Image.asset('Assets/images/messenger.png')),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Container(
                height: 30,
                child: Icon(Icons.person_2_outlined)),
            label: 'Profile',
          ),
        ],
      ),
      body:  Center(
        child: _getPage(_selectedIndex),
      ),
    );
  }
}
Widget _getPage(int index) {
  switch (index) {
    case 0:
      return home();
    case 1:
      return category_page();

    default:
      return Container();
  }
}