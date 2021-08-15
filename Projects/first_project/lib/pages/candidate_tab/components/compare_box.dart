import 'package:flutter/material.dart';
import 'package:first_project/models/Candidate/candidate.dart';
import 'package:first_project/pages/compare_page.dart';
import 'package:dotted_border/dotted_border.dart';

class CompareBox extends StatefulWidget {
  CompareBox({
    Key key,
    @required double animateheight,
    @required List<Candidate> compareList,
  })  : _compareList = compareList,
        _height = animateheight,
        super(key: key);

  final List<Candidate> _compareList;

  double _height;

  @override
  _CompareBoxState createState() => _CompareBoxState();
}

class _CompareBoxState extends State<CompareBox> {
  Future<double> get _width => Future<double>.value(40);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: widget._height,
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (widget._compareList.length == 1) ...[
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(23, 8, 0, 8),
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "${widget._compareList[0].name}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(135, 6, 0, 0),
                  child: SizedBox(
                    height: 10,
                    child: IconButton(
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(
                        Icons.highlight_off,
                        size: 22,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          widget._compareList.removeAt(0);
                          widget._height = 0;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(8),
                child: Container(
                  height: 40,
                  width: 150,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Tilføj kandidat"),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 2,
            )
          ],
          if (widget._compareList.length == 2) ...[
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 8, 0, 8),
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[700],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "${widget._compareList[0].name}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(150, 7, 0, 0),
                  child: SizedBox(
                    height: 10,
                    width: 10,
                    child: IconButton(
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(
                        Icons.highlight_off,
                        size: 22,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          widget._compareList.removeAt(0);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[700],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "${widget._compareList[1].name}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(140, 5, 0, 0),
                  child: SizedBox(
                    height: 10,
                    width: 10,
                    child: IconButton(
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(
                        Icons.highlight_off,
                        size: 22,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          widget._compareList.removeAt(1);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder<double>(
              future: _width,
              initialData: 0.0,
              builder: (context, snapshot) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInSine,
                  width: snapshot.data,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.grey[800],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, _) {
                            return ComparePage(
                              compareList: widget._compareList,
                            );
                          },
                          opaque: false,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}
