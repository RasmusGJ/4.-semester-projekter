import 'package:flutter/material.dart';
import 'components/body.dart';

class CandidateTestPage extends StatefulWidget {
  @override
  _CandidateTestPageState createState() => _CandidateTestPageState();
}

class _CandidateTestPageState extends State<CandidateTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
        ],
      ),
      body: Body(),
    );
  }
}
