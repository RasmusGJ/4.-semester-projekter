import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  @override
  _ResultsPageState createState() => _ResultsPageState();

  final int score;

  ResultsPage({this.score});
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
              widget.score.toString(),
              style: TextStyle(color: Colors.grey[800], fontSize: 25),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            color: Colors.white,
            child: Container(
              height: 200,
              width: 200,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 35, 0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(75, 0, 75, 0),
            child: ElevatedButton(
              onPressed: () {},
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
