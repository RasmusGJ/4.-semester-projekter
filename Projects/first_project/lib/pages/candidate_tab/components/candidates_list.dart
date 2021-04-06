import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:first_project/models/candidate.dart';
import 'package:first_project/pages/candidate_single/candidate_single.dart';

class CandidatesList extends StatefulWidget {
  final List<Candidate> _filteredCandidates;
  final List<Candidate> candidates;
  final Function notifyParent;

  const CandidatesList({
    Key key,
    @required List<Candidate> filteredCandidates,
    @required this.candidates,
    @required this.notifyParent,
  })  : _filteredCandidates = filteredCandidates,
        super(key: key);

  @override
  _CandidatesListState createState() => _CandidatesListState();
}

class _CandidatesListState extends State<CandidatesList> {
  bool isPressed = false;

  Uint8List getImage(value) {
    final UriData data = Uri.parse(value).data;
    return data.contentAsBytes();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: widget._filteredCandidates.length,
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
                                width: 120,
                                child: Text(
                                  widget._filteredCandidates[index].name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              Text(
                                widget._filteredCandidates[index].county,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Text(
                            widget._filteredCandidates[index].education,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            maxLines: 1,
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
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue[200],
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  ///////////////////
                                  onPressed: () {
                                    widget.notifyParent(
                                      widget._filteredCandidates[index],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(17, 15, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.memory(
                        getImage(widget._filteredCandidates[index].image),
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
                  CupertinoPageRoute(
                    builder: (context) => CandidateSingle(
                      candidate: widget.candidates[index],
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
