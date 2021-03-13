import 'package:flutter/material.dart';
import 'package:first_project/pages/candidate_tab/candidate_page.dart';
import 'package:first_project/pages/home/home.dart';
import 'package:first_project/pages/party_tab/party_page.dart';
import 'package:first_project/pages/test.dart';
import 'candidate_test/candidate_test_page.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currentIndex = 0;
  List<Widget> _widgetOptions = [Home(), CandidatePage(), CandidateTestPage()];

  void _onItemTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_currentIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Hjem',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_rounded),
            label: 'Kandidater',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Partier',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
