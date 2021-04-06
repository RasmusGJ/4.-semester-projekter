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
      padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
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
                Container(
                  width: 355,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Icon(
                          Icons.person_outline,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 140, 0),
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
                            candidate.age,
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 355,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Icon(
                          Icons.school,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
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
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        child: Container(
                          width: 165,
                          child: Text(
                            candidate.education,
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 355,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Icon(
                          Icons.work_outline_outlined,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 50, 0),
                        child: Text(
                          "Profession",
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 15, 0),
                        child: Container(
                          width: 165,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
