import 'package:flutter/material.dart';
import 'package:first_project/models/party.dart';
import 'dart:typed_data';
import 'dart:ui';

class PartyHeader extends StatelessWidget {
  const PartyHeader({
    Key key,
    @required this.party,
  }) : super(key: key);

  final Party party;

  Uint8List getImage(value) {
    final UriData data = Uri.parse(value).data;

    return data.contentAsBytes();
  }

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
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6)
                  ]),

              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 3.0,
                  sigmaY: 3.0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.memory(
                    getImage(party.image),
                    fit: BoxFit.cover,
                  ),
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
                child: Image.memory(
                  getImage(party.image),
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