import 'package:flutter/material.dart';
import 'package:first_project/pages/loading.dart';
import 'package:first_project/services/http_proxy.dart';
import 'package:first_project/models/Party/party.dart';
import 'package:first_project/pages/party_tab/components/party_list.dart';

class PartyPage extends StatefulWidget {
  @override
  _PartyPageState createState() => _PartyPageState();
}

class _PartyPageState extends State<PartyPage> {
  static List<Party> parties = [];
  List<Party> _filteredParties = [];
  bool loading = true;
  bool nameIsSelected = true;

  void setUpCandidate() async {
    HttpProxy httpProxy = HttpProxy();
    parties = _filteredParties = await httpProxy.getAllParties();
    if (this.mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  void _filterParties(value) {
    if (nameIsSelected) {
      setState(
        () {
          _filteredParties = parties
              .where((party) =>
                  party.name.toLowerCase().contains(value.toLowerCase()))
              .toList();
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (parties.length == 0) {
      setUpCandidate();
    } else {
      _filteredParties = parties;
      loading = false;
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
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Container(
                        height: 100,
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
                                      "Hvilket parti vil du gerne\nvide mere om?",
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
                                      _filterParties(value);
                                    },
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
                    toolbarHeight: 135,
                    backgroundColor: Colors.white12,
                  ),
                ];
              },
              body: Column(
                children: [
                  PartyList(
                    filteredParties: _filteredParties,
                    parties: parties,
                  ),
                ],
              ),
            ),
          );
  }
}
