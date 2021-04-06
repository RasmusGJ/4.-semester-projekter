import 'package:first_project/models/candidate.dart';
import 'package:flutter/material.dart';

class CVTab extends StatelessWidget {
  const CVTab({
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
                  candidate.cvs[index].title,
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
                  padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
                  child: Container(
                    child: Text(
                      "${candidate.cvs[index].fromDate} · ",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    candidate.cvs[index].toDate,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
              child: Container(
                child: Text(
                  candidate.cvs[index].description,
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
