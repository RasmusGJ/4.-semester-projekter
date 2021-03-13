import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  ConfettiController _confettiController;

  List<Task> tasks = [
    Task(
      id: 1,
      title: "Lav To Do app ",
      description:
          "Deadlinen er inden App3 ERFA mødet torsdag d. 25.\n Appen laves i flutter! ",
      createdDate: DateTime.now(),
      isDone: true,
    ),
    Task(
      id: 2,
      title: "Lav mongoDb database",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
      createdDate: DateTime.now(),
      isDone: false,
    ),
  ];

  Future<Task> createDialogue(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Opret ny task"),
          content: Container(
            height: 120,
            width: 1000,
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                TextField(
                  controller: descController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              elevation: 1,
              color: Colors.yellow[800],
              child: Text("Tilføj", style: TextStyle(color: Colors.white)),
              onPressed: () {
                Task t1 = Task(
                  title: titleController.text,
                  description: descController.text,
                  createdDate: DateTime.now(),
                  isDone: false,
                );
                Navigator.of(context).pop(t1);
                print("${titleController.text}");
              },
            ),
          ],
        );
      },
    );
  }

  List<Task> getDoneTasks() {
    List<Task> doneTasks = [];
    for (var i in tasks) {
      if (i.isDone == true) {
        doneTasks.add(i);
      }
    }
    return doneTasks;
  }

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createDialogue(context).then((value) {
            setState(() {
              tasks.add(value);
            });
          });
        },
        backgroundColor: Colors.yellow[800],
        child: Icon(Icons.add_comment),
      ),
      backgroundColor: Colors.grey[900],
      body: Align(
        alignment: Alignment.topCenter,
        child: ConfettiWidget(
          confettiController: _confettiController,
          colors: [
            Colors.red,
            Colors.green,
            Colors.blue,
            Colors.yellow,
            Colors.purple,
            Colors.pink[200],
          ],
          emissionFrequency: 0,
          numberOfParticles: 170,
          blastDirectionality: BlastDirectionality.explosive,
          gravity: 0.1,
          maxBlastForce: 25,
          minBlastForce: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 45, 20, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Welcome to the,\nToDo App!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      TextButton(
                        child: Text.rich(
                          TextSpan(
                            text: "${getDoneTasks().length}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                            ),
                            children: [
                              TextSpan(
                                text: "/${tasks.length}  task(s)",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            getDoneTasks()
                                .forEach((element) => tasks.remove(element));
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Stack(
                          children: [
                            AnimatedContainer(
                              margin: EdgeInsets.fromLTRB(15, 5, 15, 10),
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: tasks[index].isDone
                                    ? Colors.lightGreen[300]
                                    : Colors.grey[700],
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: tasks[index].isDone
                                        ? Colors.lightGreen[300]
                                            .withOpacity(0.3)
                                        : Colors.grey[600].withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 7), // changes position of shadow
                                  ),
                                ],
                              ),
                              duration: Duration(milliseconds: 300),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 20, 15, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          tasks[index].title,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                            color: tasks[index].isDone
                                                ? Colors.grey[850]
                                                : Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Checkbox(
                                            value: tasks[index].isDone,
                                            onChanged: (bool value) {
                                              setState(() {
                                                tasks[index].isDone = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                                      child: Text(
                                        tasks[index].description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          letterSpacing: 0.6,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: tasks[index].isDone
                                              ? Colors.grey[700]
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${tasks[index].createdDate.day} - 0${tasks[index].createdDate.month} - ${tasks[index].createdDate.year}",
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey[500]),
                                        ),
                                        SizedBox(
                                          height: 25,
                                          width: 25,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              size: 16,
                                              color: Colors.red[300],
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                tasks.removeAt(index);
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            tasks[index].isDone
                                ? tasks[index].isDone = false
                                : tasks[index].isDone = true;

                            tasks.length == getDoneTasks().length
                                ? _confettiController.play()
                                : print("Not all completed");
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
