import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:team_app/chatpage.dart';
import 'package:team_app/controllers/deal_controller.dart';
import 'package:team_app/deal_page.dart';
import 'package:team_app/profile.dart';
import 'package:team_app/around_you.dart';

class Nav extends StatefulWidget {
  final DealController controller;
  const Nav({Key? key, required this.controller}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  int dealNoti = 3;

  final tabs = [
    /*ปลั๊กหน้า เหมือน routing*/
    // DealPage(
    //   controller: controller,
    // ),
    LocationPage(),
    ProfilePage(),
    ChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        iconSize: 30.0,
        selectedFontSize: 14.0,
        items: [
          BottomNavigationBarItem(
            icon: buildCustomBadge(
              counter: dealNoti,
              child: Icon(Icons.home),
            ),
            label: 'Home',
            backgroundColor: Colors.deepPurple[900],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.near_me),
            label: 'Around You',
            backgroundColor: Colors.deepPurple[900],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.deepPurple[900],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
            backgroundColor: Colors.deepPurple[900],
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget buildCustomBadge({required int counter, required Icon child}) {
    final text = counter.toString();

    return Stack(
      children: [
        child,
        Positioned(
          top: -3,
          right: -2,
          child: CircleAvatar(
            backgroundColor: Colors.red[600],
            radius: 10,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
