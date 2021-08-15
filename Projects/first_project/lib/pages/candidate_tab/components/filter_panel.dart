import 'package:first_project/models/Candidate/tag.dart';
import 'package:first_project/models/Party/party.dart';
import 'package:flutter/material.dart';
import 'package:first_project/models/party_filter.dart';

class FilterPanel extends StatefulWidget {
  final List<Party> parties;
  final List<Tag> tags;
  final Function notifyParentKommune;
  final Function notifyParentParty;
  final Function resetFilter;
  String selectedLocation;
  List<PartyFilter> partyFilter;

  FilterPanel({
    Key key,
    @required this.parties,
    @required this.tags,
    @required this.notifyParentKommune,
    @required this.notifyParentParty,
    @required this.resetFilter,
    @required this.selectedLocation,
    @required this.partyFilter,
  });

  @override
  _FilterPanelState createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
  //Checks partyFilter list with party list and checks them false or true if clicked
  bool checkPartySelection(Party party) {
    for (var i in widget.partyFilter) {
      if (i.id == party.id) {
        if (i.isSelected == false) {
          i.isSelected = true;
          return i.isSelected;
        } else {
          i.isSelected = false;
          return i.isSelected;
        }
      }
    }
    return false;
  }

  //returns the state og isSelected referenced to the correct party clicked
  bool checkBoolState(Party party) {
    for (var i in widget.partyFilter) {
      if (i.id == party.id) {
        if (i.isSelected == false) {
          return i.isSelected;
        } else {
          return i.isSelected;
        }
      }
    }
    return false;
  }

  bool selected = false;
  List<String> _kommuner = ['Intet valg', 'Odense', 'København'];

  //skal rykkes til candidate_page.dart
  List<bool> _selected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    "Filter",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 225,
                ),
                TextButton(
                  child: Text(
                    "Nulstil",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      widget.selectedLocation = null;
                      widget.resetFilter();
                      for (int i = 0; i < _selected.length; i++) {
                        _selected[i] = false;
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Divider(
                  height: 0,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      "Søg",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(55, 0, 55, 0),
                  child: DropdownButton(
                    isExpanded: true,
                    value: widget.selectedLocation,
                    items: _kommuner.map((String location) {
                      return new DropdownMenuItem<String>(
                        value: location,
                        child: new Text(location),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        widget.selectedLocation = newValue;
                        widget.notifyParentKommune(
                          widget.selectedLocation,
                        );
                      });
                    },
                    hint: Text("Vælg kommune"),
                  ),
                ),
                SizedBox(height: 10),
                Divider(
                  height: 45,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Text(
                        "Filter partier",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Container(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                          ),
                          itemCount: widget.parties.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  checkPartySelection(widget.parties[index]);
                                  widget.notifyParentParty(widget.partyFilter);
                                });
                              },
                              child: Stack(
                                children: [
                                  Image.network(
                                    widget.parties[index].images.mini,
                                  ),
                                  //problem???????????????
                                  checkBoolState(widget.parties[index])
                                      ? Align(
                                          alignment: Alignment.bottomRight,
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 5, 0, 0),
                                            child: Icon(
                                              Icons.check_box_rounded,
                                              color: Colors.green,
                                            ),
                                          ),
                                        )
                                      : Text(""),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 15,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 185,
            child: Wrap(
              spacing: 5,
              children: [
                for (int i = 0; i < widget.tags.length - 1; i++)
                  FilterChip(
                    label: Text(widget.tags[i].title),
                    showCheckmark: false,
                    selected: _selected[i],
                    onSelected: (bool value) {
                      _selected[i] = value;
                      setState(() {});
                    },
                    elevation: 15,
                    shadowColor: Colors.transparent,
                    selectedColor: Colors.green,
                  ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
