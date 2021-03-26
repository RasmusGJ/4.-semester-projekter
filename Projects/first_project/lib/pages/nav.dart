import 'package:flutter/material.dart';
import 'package:first_project/pages/candidate_tab/candidate_page.dart';
import 'package:first_project/pages/party_tab/party_page.dart';
import 'package:first_project/pages/candidate_test_tab/candidate_test_tab.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currentIndex = 0;
  static CandidatePage candidatePage = CandidatePage();
  static PartyPage partyPage = PartyPage();

  List<Widget> _widgetOptions = [
    candidatePage,
    partyPage,
    CandidateTab(),
  ];

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
        unselectedItemColor: Colors.blueGrey[800],
        selectedItemColor: Colors.blue[500],
        selectedFontSize: 14,
        unselectedFontSize: 11,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people_rounded),
            label: 'Kandidater',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Partier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet),
            label: 'Kandidattest',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
