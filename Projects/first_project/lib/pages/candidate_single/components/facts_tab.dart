import 'package:first_project/models/candidate.dart';
import 'package:flutter/material.dart';

class FactsTab extends StatelessWidget {
  const FactsTab({
    Key key,
    @required this.candidate,
  }) : super(key: key);

  final Candidate candidate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    child: Text(
                      "Alder",
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    child: Text(
                      "Kommune",
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    child: Text(
                      "Uddannelse",
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    child: Text(
                      "Profession",
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    child: Text(
                      candidate.age,
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    child: Text(
                      candidate.county,
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    child: Text(
                      candidate.education,
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.blue,
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    child: Text(
                      candidate.profession,
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
