import 'package:flutter/material.dart';
import 'package:first_project/pages/candidate_test_tab/components/test_page.dart';

class CandidateTab extends StatefulWidget {
  @override
  _CandidateTabState createState() => _CandidateTabState();
}

class _CandidateTabState extends State<CandidateTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Tag kandidattesten her",
              style: TextStyle(color: Colors.grey[800], fontSize: 25),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(75, 0, 75, 0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red[400],
                onPrimary: Colors.white,
                padding: EdgeInsets.fromLTRB(85, 15, 85, 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text("Klik her!"),
            ),
          ),
        ],
      ),
    );
  }
}
