import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:first_project/models/Candidate/candidate.dart';

class ComparePage extends StatelessWidget {
  final List<Candidate> compareList;

  ComparePage({@required this.compareList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: Duration(milliseconds: 1000),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        ClipOval(
                          child: Image.network(
                            compareList[0].image,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(
                            "${compareList[0].name}",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                          child: Text(
                            "${compareList[0].party.name}",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
                          child: ClipOval(
                            child: Image.network(
                              compareList[1].image,
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(
                            "${compareList[1].name}",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                          child: Text(
                            "${compareList[1].party.name}",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(60, 10),
                    topRight: Radius.elliptical(60, 10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.3),
                      spreadRadius: 10,
                      blurRadius: 15,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "M??rkesager",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.grey[200],
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    for (var i in compareList[0].keyIssues)
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.lightGreen[700],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              "${i.tag.title}",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  for (var i in compareList[1].keyIssues)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.lightGreen[700],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "${i.tag.title}",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
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
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "CV",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.grey[200],
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    for (var i in compareList[0].cvs)
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 10, 15, 10),
                                        child: Text(
                                          "${i.title}",
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  for (var i in compareList[1].cvs)
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 10, 15, 10),
                                      child: Text(
                                        "${i.title}",
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Stemmer",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.grey[200],
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 0, 15, 0),
                                      child: Text(
                                        "KV19",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 10, 15, 30),
                                      child: Text(
                                        "561",
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 0, 15, 0),
                                      child: Text(
                                        "KV15",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 10, 15, 10),
                                      child: Text(
                                        "561",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    child: Text(
                                      "KV19",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(15, 10, 15, 30),
                                    child: Text(
                                      "760",
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    child: Text(
                                      "KV15",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(15, 10, 15, 10),
                                    child: Text(
                                      "760",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        builder: (context, value, child) {
          return ShaderMask(
            shaderCallback: (rect) {
              return RadialGradient(
                radius: value * 5,
                colors: [
                  Colors.white,
                  Colors.white,
                  Colors.transparent,
                  Colors.transparent,
                ],
                stops: [0.0, 0.6, 0.6, 1.0],
                center: FractionalOffset(0.95, 0.90),
              ).createShader(rect);
            },
            child: child,
          );
        },
      ),
    );
  }
}
