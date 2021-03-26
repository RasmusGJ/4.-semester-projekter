import 'package:flutter/material.dart';
import 'package:first_project/models/candidate.dart';
import 'package:first_project/services/http_proxy.dart';
import 'package:first_project/pages/loading.dart';
import 'components/candidates_list.dart';
import 'components/compare_box.dart';

class CandidatePage extends StatefulWidget {
  @override
  _CandidatePageState createState() => _CandidatePageState();
}

class _CandidatePageState extends State<CandidatePage> {
  static List<Candidate> candidates = [];
  List<Candidate> _filteredCandidates = [];
  List<Candidate> _compareList = [];

  bool loading = true;
  bool keyIsSelected = false;
  bool countyIsSelected = false;
  bool nameIsSelected = true;
  bool tagIsSelected = false;

  void setUpCandidate() async {
    HttpProxy httpProxy = HttpProxy();
    candidates = _filteredCandidates = await httpProxy.getAllCandidates();
    if (this.mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  void _filterCandidates(value) {
    if (nameIsSelected) {
      setState(() {
        _filteredCandidates = candidates
            .where((candidate) =>
                candidate.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      });
    }
    if (countyIsSelected) {
      setState(() {
        _filteredCandidates = candidates
            .where((candidate) =>
                candidate.county.toLowerCase().contains(value.toLowerCase()))
            .toList();
      });
    }
    if (countyIsSelected || nameIsSelected) {
      setState(() {
        _filteredCandidates = candidates
            .where((candidate) =>
                candidate.county.toLowerCase().contains(value.toLowerCase()) ||
                candidate.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      });
    }
  }

  refresh(Candidate selectedCand) {
    setState(() {
      if (_compareList.length < 2) {
        _compareList.add(selectedCand);
        print("Added: ${selectedCand.name}");
      } else {
        print("You already have 2 candidates");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (candidates.length == 0) {
      setUpCandidate();
    } else {
      setState(() {
        _filteredCandidates = candidates;
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    title: Padding(
                      padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: Container(
                        height: 115,
                        width: 500,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white12,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "Hvem vil du gerne\nvide mere om?",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  TextField(
                                    style: TextStyle(fontSize: 14, height: 1),
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.search),
                                        labelText: "Søg her...",
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(0)),
                                    onChanged: (value) {
                                      _filterCandidates(value);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Column(
                                      children: [
                                        ChoiceChip(
                                          selected: keyIsSelected,
                                          label: Text(
                                            "Mærkesager",
                                          ),
                                          onSelected: (selected) {
                                            setState(() {
                                              keyIsSelected = selected;
                                            });
                                          },
                                        ),
                                        ChoiceChip(
                                          selected: countyIsSelected,
                                          label: Text(
                                            "Kommune",
                                          ),
                                          onSelected: (selected) {
                                            setState(() {
                                              countyIsSelected = selected;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Column(
                                      children: [
                                        ChoiceChip(
                                          selected: nameIsSelected,
                                          label: Text(
                                            "Navn",
                                          ),
                                          onSelected: (selected) {
                                            setState(() {
                                              nameIsSelected = selected;
                                            });
                                          },
                                        ),
                                        ChoiceChip(
                                          selected: tagIsSelected,
                                          label: Text(
                                            "Tags",
                                          ),
                                          onSelected: (selected) {
                                            setState(() {
                                              tagIsSelected = selected;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    automaticallyImplyLeading: false,
                    pinned: false,
                    toolbarHeight: 140,
                    backgroundColor: Colors.white12,
                  ),
                ];
              },
              body: Column(
                children: [
                  CandidatesList(
                    filteredCandidates: _filteredCandidates,
                    candidates: candidates,
                    notifyParent: refresh,
                  ),
                  CompareBox(compareList: _compareList),
                ],
              ),
            ),
          );
  }
}
