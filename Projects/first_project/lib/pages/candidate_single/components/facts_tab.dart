import 'package:first_project/models/Candidate/candidate.dart';
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
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      child: Wrap(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Icon(
                                Icons.person_outline,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Født i ",
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              candidate.age,
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Wrap(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Icon(
                                Icons.school,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Har studeret ",
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            width: 165,
                            child: Text(
                              candidate.education,
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Wrap(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Icon(
                                Icons.work_outline_outlined,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          Text(
                            "Arbejder som ",
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            width: 165,
                            child: Text(
                              candidate.profession,
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Wrap(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          Text(
                            "Stiller op i ",
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            width: 165,
                            child: Text(
                              candidate.county,
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Wrap(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Icon(
                                Icons.people_outline,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          Text(
                            "Civil status - ",
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            width: 165,
                            child: Text(
                              "ikke angivet",
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
