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
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Container(
                    height: 50,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3.0,
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
                          maxLines: 1,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(110, 0, 0, 0),
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
                  height: 50,
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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Sammenlign",
                ),
              ),
            )
          ],
          if (widget._compareList.length == 2) ...[
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 0, 8),
                  child: Container(
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3.0,
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
                          maxLines: 1,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(125, 5, 0, 0),
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
                  padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                  child: Container(
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3.0,
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
                          maxLines: 1,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(125, 5, 0, 0),
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
            TextButton(
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
              child: Text(
                "Sammenlign",
              ),
            )
          ],
        ],
      ),
    );
  }
}
