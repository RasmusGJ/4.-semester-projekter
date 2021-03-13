import 'package:flutter/material.dart';
import 'package:first_project/pages/loading.dart';
import 'package:first_project/pages/party_tab/party_single.dart';
import 'package:first_project/services/http_proxy.dart';
import 'package:first_project/models/party.dart';

class PartyPage extends StatefulWidget {
  @override
  _PartyPageState createState() => _PartyPageState();
}

class _PartyPageState extends State<PartyPage> {
  List<Party> parties;
  bool loading = true;

  void setUpCandidate() async {
    HttpProxy httpProxy = HttpProxy();
    parties = await httpProxy.getAllParties();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setUpCandidate();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.grey[100],
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: parties.length,
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
                                              width: 150,
                                              child: Text(
                                                parties[index].name,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w700),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),
                                            Text(
                                              parties[index].bloc,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          parties[index].chairman,
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
                                      ]),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: 15,
                                bottom: 17,
                                /*child: Hero(
                                  tag: "assets/1.jpg",*/
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: AssetImage("assets/1.jpg"),
                                    fit: BoxFit.cover,
                                    height: 125,
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
                                    builder: (context) => PartySingle(
                                          party: parties[index],
                                        )));
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
