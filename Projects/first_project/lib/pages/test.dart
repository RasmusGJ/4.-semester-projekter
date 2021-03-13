import 'package:flutter/material.dart';
import 'package:first_project/models/candidate.dart';
import 'package:first_project/services/http_proxy.dart';
import 'package:first_project/pages/loading.dart';
import 'package:first_project/pages/candidate_single/candidate_single.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  List<Candidate> candidates = [];
  List<Candidate> _filteredCandidates = [];
  bool loading = true;

  void setUpCandidate() async {
    HttpProxy httpProxy = HttpProxy();
    candidates = _filteredCandidates = await httpProxy.getAllCandidates();
    setState(() {
      loading = false;
    });
  }

  void _filterCandidates(value) {
    setState(() {
      //print(value);
      _filteredCandidates = candidates
          .where((candidate) =>
              candidate.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    setUpCandidate();
    controller = TabController(length: 3, vsync: this);
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
                    title: Container(
                      height: 120,
                      width: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white12,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                  child: Container(
                                    height: 50,
                                    width: 200,
                                    child: Text(
                                      "Hvem vil du gerne\nvide mere om?",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
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
                            child: Column(
                              children: [
                                Text(
                                  "data",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  "data",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  "data",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    automaticallyImplyLeading: false,
                    pinned: false,
                    toolbarHeight: 135,
                    backgroundColor: Colors.white12,
                  ),
                ];
              },
              body: Column(
                children: [
                  Expanded(
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
                                    padding:
                                        EdgeInsets.fromLTRB(100, 20, 20, 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 120,
                                              child: Text(
                                                _filteredCandidates[index].name,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w700),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),
                                            Text(
                                              _filteredCandidates[index].county,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
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
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                    child: Image(
                                      image: AssetImage("assets/1.jpg"),
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
                  ),
                ],
              ),
            ),
          );
  }
}
