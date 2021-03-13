import 'package:flutter/material.dart';
import 'package:first_project/models/party.dart';

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
              backgroundColor: Colors.white10,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(children: [
                  Stack(
                    children: [
                      Container(
                        //height: MediaQuery.of(context).size.width,
                        height: 275,
                        width: 800,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 6)
                            ]),
                        /*child: Hero(
                      tag: "assets/1.jpg",*/
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image(
                              image: AssetImage("assets/1.jpg"),
                              fit: BoxFit.cover),
                        ),
                      ),
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
                            Row(
                              children: [
                                IconButton(
                                    icon: Icon(Icons.sort),
                                    iconSize: 30,
                                    color: Colors.white,
                                    onPressed: () {}),
                              ],
                            ),
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
              expandedHeight: 310,
              bottom: TabBar(
                controller: controller,
                unselectedLabelColor: Colors.grey[800],
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blueAccent),
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
            Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                            //child: Text("YOO"),
                            )
                      ],
                    );
                  },
                )),
              ],
            ),
            Icon(Icons.ac_unit_outlined),
            Icon(Icons.gps_fixed),
          ],
        ),
      ),
    );
  }
}
