import 'package:flutter/material.dart';
import 'package:first_project/models/Party/party.dart';
import 'dart:ui';

class PartyHeader extends StatelessWidget {
  const PartyHeader({
    Key key,
    @required this.party,
  }) : super(key: key);

  final Party party;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              //height: MediaQuery.of(context).size.width,
              height: 235,
              width: 800,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6)
                ],
              ),
              child: ClipRRect(
                child: Image.network(
                  party.images.banner,
                  fit: BoxFit.cover,
                ),
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
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(115, 95, 0, 0),
              child: CircleAvatar(
                radius: 95,
                backgroundColor: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(120, 100, 0, 0),
              child: ClipOval(
                child: Image.network(
                  party.images.profile,
                  width: 180,
                  height: 180,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  party.name,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    party.bloc,
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
      ],
    );
  }
}
