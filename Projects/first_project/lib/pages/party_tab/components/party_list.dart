import 'dart:typed_data';

import 'package:first_project/pages/part_single/party_single.dart';
import 'package:flutter/material.dart';
import 'package:first_project/models/party.dart';

class PartyList extends StatefulWidget {
  const PartyList({
    Key key,
    @required this.parties,
    @required this.filteredParties,
  }) : super(key: key);

  final List<Party> parties;
  final List<Party> filteredParties;

  @override
  _PartyListState createState() => _PartyListState();
}

class _PartyListState extends State<PartyList> {
  Uint8List getImage(value) {
    final UriData data = Uri.parse(value).data;
    return data.contentAsBytes();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: widget.filteredParties.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(100, 20, 20, 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 150,
                                  child: Text(
                                    widget.parties[index].name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                Text(
                                  widget.parties[index].bloc,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Text(
                              widget.parties[index].age,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[100],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text("Pleje"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[100],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text("Miljø"),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(17, 15, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.memory(
                        getImage(widget.parties[index].image),
                        fit: BoxFit.cover,
                        height: 150,
                        width: 100,
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PartySingle(
                      party: widget.parties[index],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
