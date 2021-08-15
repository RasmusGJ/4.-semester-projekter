import 'package:first_project/models/Candidate/candidate.dart';
import 'package:flutter/material.dart';

class KeyIssueTab extends StatelessWidget {
  const KeyIssueTab({
    Key key,
    @required this.index,
    @required this.candidate,
  }) : super(key: key);

  final Candidate candidate;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Container(
                child: Text(
                  candidate.keyIssues[index].title,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[700],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                      child: Text(
                        candidate.keyIssues[index].tag.title,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
              child: Container(
                child: Text(
                  candidate.keyIssues[index].description,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 15,
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
