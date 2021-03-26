import 'package:flutter/material.dart';
import 'package:first_project/pages/nav.dart';

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.red[700],
              Colors.blue[800],
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 120,
            ),
            Text(
              "Find kandidaten der passer \nperfekt til dig.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Image(
              image: AssetImage("assets/logo.png"),
              fit: BoxFit.cover,
              height: 100,
              width: 200,
            ),
            SizedBox(
              height: 200,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(120, 0, 120, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black54,
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Nav(),
                    ),
                  );
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Kom igang",
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
