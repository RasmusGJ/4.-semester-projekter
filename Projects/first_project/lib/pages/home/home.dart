import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                            Colors.purple[900],
                            Colors.purple[800]
                          ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 50, 0),
                            child: Text(
                              "DANMARKS POLITISKE SAMLESTED",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 50, 0),
                            child: Text(
                              "Politisk platform med henblik på læring og information til valg",
                              style: TextStyle(
                                  fontSize: 40,
                                  height: 1.15,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 50, 25),
                            child: Text(
                              "Politikeren samler alt Dansk politik og " +
                                  "giver et let overblik over hvordan det politisike landskab ser ud",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  height: 1.25,
                                  color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(30.0),
                    margin: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EN PLATFORM DER LÆRER DIG SOM UNG OM POLITIK",
                          style: TextStyle(
                            color: Colors.orange[800],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "ANSVAR FOR FREMTIDENS DANMARK",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Hvad er politik? Hvad er det for en størrelse? Hvad bestemmer det over? Hvad har det med mig at gøre? Hvorfor skal man stemme personligt? Hvordan finder man ud af hvem man skal stemme på?\n\n" +
                              "Hos Politikeren stræber vi efter at besvarer disse spørgsmål for alle i danmark. Og dette gælder især de unge. Vi har derfor lavet en hel sektion hvor vi lærer netop de unge om hvad det betyder at gå til valg og hvor vigtigt det er for danmarks fremtid at de sætter sig ind i det.",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                          image: AssetImage("assets/stock.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(30.0),
                    margin: EdgeInsets.all(15.0),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EN PLATFORM DER LÆRER DIG SOM UNG OM POLITIK",
                          style: TextStyle(
                            color: Colors.orange[800],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "ANSVAR FOR FREMTIDENS DANMARK",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Hvad er politik? Hvad er det for en størrelse? Hvad bestemmer det over? Hvad har det med mig at gøre? Hvorfor skal man stemme personligt? Hvordan finder man ud af hvem man skal stemme på?\n\n" +
                              "Hos Politikeren stræber vi efter at besvarer disse spørgsmål for alle i danmark. Og dette gælder især de unge. Vi har derfor lavet en hel sektion hvor vi lærer netop de unge om hvad det betyder at gå til valg og hvor vigtigt det er for danmarks fremtid at de sætter sig ind i det.",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
