import 'package:first_project/pages/candidate_single/components/facts_tab.dart';
import 'package:flutter/material.dart';
import 'package:first_project/models/candidate.dart';
import 'components/candidate_header.dart';
import 'components/cv_tab.dart';

class CandidateSingle extends StatefulWidget {
  final Candidate candidate;

  CandidateSingle({this.candidate});
  @override
  _CandidateSingleState createState() => _CandidateSingleState();
}

class _CandidateSingleState extends State<CandidateSingle>
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
                background: Column(
                  children: [
                    CandidateHeader(candidate: widget.candidate),
                  ],
                ),
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
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.candidate.cvs.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          CVTab(
                            index: index,
                            candidate: widget.candidate,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.candidate.cvs.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          CVTab(
                            index: index,
                            candidate: widget.candidate,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: FactsTab(
                    candidate: widget.candidate,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
