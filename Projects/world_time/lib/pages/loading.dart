import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime wt = WorldTime(
        location: "Berlin", flag: "germany.png", url: "Europe/Berlin");
    await wt.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": wt.location,
      "flag": wt.flag,
      "time": wt.time,
      "isDayTime": wt.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitChasingDots(
        color: Colors.grey,
        size: 35.0,
      ),
    ));
  }
}
