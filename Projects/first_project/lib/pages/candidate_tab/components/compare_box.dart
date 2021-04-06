import 'package:flutter/material.dart';
import 'package:first_project/models/candidate.dart';
import 'package:first_project/pages/compare_page.dart';
import 'package:dotted_border/dotted_border.dart';

class CompareBox extends StatefulWidget {
  const CompareBox({
    Key key,
    @required List<Candidate> compareList,
  })  : _compareList = compareList,
        super(key: key);

  final List<Candidate> _compareList;

  @override
  _CompareBoxState createState() => _CompareBoxState();
}

class _CompareBoxState extends State<CompareBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(7),
            topLeft: Radius.circular(7),
          ),
          border: Border.all(color: Colors.blue[200])),
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
                      color: Colors.blue[300],
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
                            color: Colors.white,
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
            IconButton(
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.grey[800],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ComparePage(
                      compareList: widget._compareList,
                    ),
                  ),
                );
              },
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
                      color: Colors.blue[300],
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
                      color: Colors.blue[300],
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
            IconButton(
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
            )
          ],
        ],
      ),
    );
  }
}
