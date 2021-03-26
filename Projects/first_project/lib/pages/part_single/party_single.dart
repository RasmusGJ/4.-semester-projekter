import 'package:flutter/material.dart';
import 'package:first_project/models/party.dart';
import 'components/party_header.dart';

class PartySingle extends StatefulWidget {
  final Party party;

  PartySingle({this.party});
  @override
  _PartySingleState createState() => _PartySingleState();
}

class _PartySingleState extends State<PartySingle>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: false,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(children: [
                  Stack(
                    children: [
                      PartyHeader(party: widget.party),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6.5, vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                icon: Icon(Icons.arrow_back),
                                iconSize: 30,
                                color: Colors.white,
                                onPressed: () => Navigator.pop(context)),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.party.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: 15,
                                  color: Colors.white70,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  widget.party.age,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white70,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              expandedHeight: 365,
              bottom: TabBar(
                controller: controller,
                unselectedLabelColor: Colors.grey[800],
                labelColor: Colors.blue,
                tabs: [
                  Tab(
                    text: "Mærkesager",
                  ),
                  Tab(
                    text: "CV",
                  ),
                  Tab(
                    text: "Fakta",
                  )
                ],
              ),
            )
          ];
        },
        body: TabBarView(
          controller: controller,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Card(child: Icon(Icons.copy)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Card(child: Icon(Icons.copy)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Card(child: Icon(Icons.copy)),
            ),
          ],
        ),
      ),
    );
  }
}
