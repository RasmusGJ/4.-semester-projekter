import 'package:first_project/pages/candidate_test/components/progress_bar.dart';
import 'package:first_project/pages/candidate_test/components/question_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /*Container(
          height: 900,
          child: Image.asset(
            "assets/quiz.png",
            fit: BoxFit.cover,
          ),
        ),*/
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ProgressBar(),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text.rich(
                  TextSpan(
                    text: "Spørgsmål 1",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 35,
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      TextSpan(
                        text: "/5",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1.5,
                color: Colors.grey[400],
              ),
              SizedBox(height: 15),
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) => QuestionCard(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
