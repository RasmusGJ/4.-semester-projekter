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
              padding: EdgeInsets.all(15.0),
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
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                child: Text(
                  candidate.cvs[index].description,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                child: Text(
                  "Opdateret: ${candidate.cvs[index].updatedAt}",
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 10,
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
