import 'dart:typed_data';
import 'package:first_project/models/candidate.dart';
import 'package:first_project/pages/candidate_single/candidate_single.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CandidatesList extends StatelessWidget {
  const CandidatesList({
    Key key,
    @required List<Candidate> filteredCandidates,
    @required this.candidates,
  })  : _filteredCandidates = filteredCandidates,
        super(key: key);

  final List<Candidate> _filteredCandidates;
  final List<Candidate> candidates;

  Uint8List getImage(value) {
    final UriData data = Uri.parse(value).data;
    return data.contentAsBytes();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: _filteredCandidates.length,
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
                                  _filteredCandidates[index].name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              Text(
                                _filteredCandidates[index].county,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Text(
                            _filteredCandidates[index].education,
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
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(17, 15, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.memory(
                        getImage(candidates[index].image),
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
                    builder: (context) => CandidateSingle(
                      candidate: candidates[index],
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
