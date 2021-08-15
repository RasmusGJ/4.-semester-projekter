import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_project/models/Candidate/candidate.dart';
import 'package:first_project/pages/candidate_single/candidate_single.dart';

class CandidatesList extends StatefulWidget {
  final List<Candidate> _filteredCandidates;
  final List<Candidate> candidates;
  final Function notifyParent;
  final Function refreshOnScroll;

  const CandidatesList({
    Key key,
    @required List<Candidate> filteredCandidates,
    @required this.candidates,
    @required this.notifyParent,
    @required this.refreshOnScroll,
  })  : _filteredCandidates = filteredCandidates,
        super(key: key);

  @override
  _CandidatesListState createState() => _CandidatesListState();
}

class _CandidatesListState extends State<CandidatesList> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: RefreshIndicator(
          child: ListView.builder(
            itemCount: widget._filteredCandidates.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(40, 5, 10, 5),
                      height: 220,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(100, 20, 20, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_sharp,
                                        color: Colors.grey[600],
                                      ),
                                      Text(
                                        widget
                                            ._filteredCandidates[index].county,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Text(
                                widget._filteredCandidates[index].party.name,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 200,
                                  child: Wrap(
                                    spacing: 3.5,
                                    runSpacing: 3.5,
                                    children: [
                                      for (var i in widget
                                          ._filteredCandidates[index].keyIssues)
                                        SizedBox(
                                          height: 29,
                                          child: Chip(
                                            padding: EdgeInsets.zero,
                                            label: Text(
                                              i.tag.title,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                              ),
                                            ),
                                            shadowColor: Colors.white70,
                                            backgroundColor:
                                                Colors.lightGreen[700],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 75, 0, 0),
                                  child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.lightGreen[700],
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Icon(
                                          Icons.compare_arrows_rounded,
                                          color: Colors.white,
                                          size: 27,
                                        ),
                                        onPressed: () {
                                          widget.notifyParent(
                                            widget._filteredCandidates[index],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(17, 37, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          widget._filteredCandidates[index].image,
                          fit: BoxFit.cover,
                          height: 160,
                          width: 110,
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
          onRefresh: widget.refreshOnScroll,
        ),
      ),
    );
  }
}
