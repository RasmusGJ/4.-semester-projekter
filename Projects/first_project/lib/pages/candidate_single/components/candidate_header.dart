import 'dart:typed_data';
import 'package:bordered_text/bordered_text.dart';
import 'package:first_project/models/candidate.dart';
import 'package:flutter/material.dart';

class CandidateHeader extends StatelessWidget {
  const CandidateHeader({
    Key key,
    @required this.candidate,
  }) : super(key: key);

  final Candidate candidate;

  Uint8List getImage(value) {
    final UriData data = Uri.parse(value).data;

    return data.contentAsBytes();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //height: MediaQuery.of(context).size.width,
          height: 275,
          width: 800,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, offset: Offset(0, 2), blurRadius: 6)
              ]),
          /*child: Hero(
      tag: "assets/1.jpg",*/
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.memory(getImage(candidate.image), fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 30,
                  color: Colors.grey[800],
                  onPressed: () => Navigator.pop(context)),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.sort),
                      iconSize: 30,
                      color: Colors.grey[800],
                      onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 20,
          bottom: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.175),
                  spreadRadius: 4,
                  blurRadius: 5,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    candidate.name,
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        candidate.county,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
