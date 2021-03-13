import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(
      home: TestProject(),
    ));

class TestProject extends StatefulWidget {
  @override
  _TestProjectState createState() => _TestProjectState();
}

class _TestProjectState extends State<TestProject> {
  List<Quote> quotes = [
    Quote(author: "Mark Helo", text: "If his name starts with k, hes a gay"),
    Quote(
        author: "Henrik Gangnum",
        text: "If his name starts with j, hes a okay"),
    Quote(
        author: "Mark Helo",
        text: "If his name starts with r, hes a fuckng jar")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
        centerTitle: true,
      ),
      body: Column(
        children: quotes
            .map((quote) => QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                }))
            .toList(),
      ),
    );
  }
}
