import 'package:first_project/models/Candidate/tag.dart';
import 'package:first_project/models/Party/party.dart';
import 'package:flutter/material.dart';
import 'package:first_project/models/Candidate/candidate.dart';
import 'package:first_project/services/http_proxy.dart';
import 'package:first_project/pages/loading.dart';
import 'components/candidates_list.dart';
import 'components/compare_box.dart';
import 'components/filter_panel.dart';
import 'package:first_project/models/party_filter.dart';
import 'package:google_fonts/google_fonts.dart';

class CandidatePage extends StatefulWidget {
  @override
  _CandidatePageState createState() => _CandidatePageState();
}

class _CandidatePageState extends State<CandidatePage> {
  double compareboxHeight = 0;

  static List<Candidate> candidates = [];
  static List<Party> parties = [];
  static List<Tag> tags = [];
  List<Candidate> _filteredCandidates = [];
  List<Candidate> _compareList = [];

  String _selectedKommune;

  List<PartyFilter> partyFilter = [];

  bool loading = true;

  HttpProxy httpProxy = HttpProxy();

  void setUpCandidate() async {
    candidates = _filteredCandidates = await httpProxy.getAllCandidates();
    parties = await httpProxy.getAllParties();
    for (var i in candidates) {
      for (var j in parties) {
        if (j.id == i.partyId) {
          i.party = j;
        }
      }
    }
    await setUpKeyIssueTags();
    if (partyFilter == null || partyFilter.length == 0) {
      fillFilterList();
    }
    if (this.mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> setUpKeyIssueTags() async {
    tags = await httpProxy.getAllTags();
    for (var i in candidates)
      for (var j in tags) {
        for (var k in i.keyIssues)
          if (k.tagId == j.id) {
            k.tag = j;
          }
      }
  }

  void fillFilterList() {
    for (var i in parties) {
      PartyFilter _partyFilter = new PartyFilter();
      _partyFilter.id = i.id;
      _partyFilter.isSelected = false;
      partyFilter.add(_partyFilter);
    }
  }

  void _filterCandidates(value) {
    setState(() {
      _filteredCandidates = candidates
          .where((candidate) =>
              candidate.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  applyKommuneFilter(String selectedKommune) {
    _selectedKommune = selectedKommune;
    if (selectedKommune.toLowerCase() != "intet valg") {
      setState(() {
        _filteredCandidates = candidates
            .where((candidate) => candidate.county
                .toLowerCase()
                .contains(selectedKommune.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        _filteredCandidates = candidates;
      });
    }
  }

  applyPartyFilter(List<PartyFilter> partyFilter) {
    _filteredCandidates = [];
    setState(() {
      int count = 0;
      for (var party in parties) {
        for (var filterElement in partyFilter) {
          if (party.id == filterElement.id &&
              filterElement.isSelected == true) {
            _filteredCandidates += candidates
                .where((candidate) =>
                    candidate.party.id
                        .toLowerCase()
                        .contains(filterElement.id.toLowerCase()) &&
                    !_filteredCandidates.contains(candidate))
                .toList();
            print("start: ${filterElement.id}");
          } else if (!partyFilter.contains(false)) {
            count++;
            print(count);
            print(partyFilter.length);
            if ((partyFilter.length * 10) == count) {
              resetFilter();
              print("RESET");
            }
          }
        }
      }
    });
  }

  resetFilter() {
    setState(() {
      _filteredCandidates = candidates;
      _selectedKommune = null;
      for (var i in partyFilter) {
        i.isSelected = false;
      }
    });
  }

  void _showFilterPanel() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return FilterPanel(
            parties: parties,
            notifyParentKommune: applyKommuneFilter,
            notifyParentParty: applyPartyFilter,
            resetFilter: resetFilter,
            selectedLocation: _selectedKommune,
            partyFilter: partyFilter,
            tags: tags,
          );
        });
  }

  refresh(Candidate selectedCand) {
    setState(() {
      if (_compareList.length < 2) {
        _compareList.add(selectedCand);
        compareboxHeight = 75;
        print("Added: ${selectedCand.name}");
      } else {
        print("You already have 2 candidates");
      }
    });
  }

  Future<void> refreshOnScroll() async {
    setState(() {
      loading = true;
      setUpCandidate();
      resetFilter();
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
                                      style: GoogleFonts.rubik(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
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
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                                child: TextButton(
                                  style: TextButton.styleFrom(),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.sort,
                                        size: 40,
                                        color: Colors.black54,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    _showFilterPanel();
                                  },
                                ),
                              ),
                            )
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
                      refreshOnScroll: refreshOnScroll),
                  CompareBox(
                    compareList: _compareList,
                    animateheight: compareboxHeight,
                  ),
                ],
              ),
            ),
          );
  }
}
