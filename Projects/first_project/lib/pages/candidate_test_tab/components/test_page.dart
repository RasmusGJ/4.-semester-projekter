import 'package:first_project/pages/candidate_test_tab/components/results_page.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final List<String> questions = [
    "Afgiften på cigaretter skal sættes op ",
    "Privathospitaler skal i højere grad udføre behandlinger for det offentlige sundhedsvæsen",
    "Topskatten skal fjernes",
    "Det offentlige tilskud til privatskoler skal sænkes"
  ];

  PageController _controller = PageController(initialPage: 0, keepPage: false);

  int selectedRadio;

  int score;
  int tempScore;

  changePage(int indx) {
    _controller.animateToPage(
      indx + 1,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
    );
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
      tempScore = val;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    score = 0;
    tempScore = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: PageView.builder(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      "${questions[index]}",
                      style: TextStyle(
                        color: Colors.blueGrey[800],
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Row(
                              children: [
                                Radio(
                                  activeColor: Colors.red[300],
                                  value: 1,
                                  groupValue: selectedRadio,
                                  onChanged: (value) {
                                    setSelectedRadio(value);
                                  },
                                ),
                                Text(
                                  "Meget Enig",
                                  style: TextStyle(
                                    color: Colors.blueGrey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Row(
                              children: [
                                Radio(
                                  activeColor: Colors.red[300],
                                  value: 2,
                                  groupValue: selectedRadio,
                                  onChanged: (value) {
                                    setSelectedRadio(value);
                                  },
                                ),
                                Text(
                                  "Enig",
                                  style: TextStyle(
                                    color: Colors.blueGrey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Row(
                              children: [
                                Radio(
                                  activeColor: Colors.red[300],
                                  value: 3,
                                  groupValue: selectedRadio,
                                  onChanged: (value) {
                                    setSelectedRadio(value);
                                  },
                                ),
                                Text(
                                  "Ved Ikke",
                                  style: TextStyle(
                                    color: Colors.blueGrey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Row(
                              children: [
                                Radio(
                                  activeColor: Colors.red[300],
                                  value: 4,
                                  groupValue: selectedRadio,
                                  onChanged: (value) {
                                    setSelectedRadio(value);
                                  },
                                ),
                                Text(
                                  "Uenig",
                                  style: TextStyle(
                                    color: Colors.blueGrey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Row(
                              children: [
                                Radio(
                                  activeColor: Colors.red[300],
                                  value: 5,
                                  groupValue: selectedRadio,
                                  onChanged: (value) {
                                    setSelectedRadio(value);
                                  },
                                ),
                                Text(
                                  "Meget Uenig",
                                  style: TextStyle(
                                    color: Colors.blueGrey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        if (questions[index] == questions.last) {
                          setState(() {
                            score += tempScore;
                            print(score);
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultsPage(score: score),
                            ),
                          );
                        } else {
                          changePage(index);
                          setState(() {
                            score += tempScore;
                            print(score);
                          });
                        }
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[Colors.red[300], Colors.red[400]],
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Næste"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
