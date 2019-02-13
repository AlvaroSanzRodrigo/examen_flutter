import 'package:examen_flutter/Post.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Post post;

  DetailPage({this.post});

  @override
  _DetailPage createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
  }

  void _showIncorrectDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Wrong Answer"),
          content: new Text("try again"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _showCorrectDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Correct answer"),
          content: new Text("Awesome!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Detail Page')),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.post.question, style: TextStyle(fontSize: 20.0),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    _showIncorrectDialog();
                  },
                  child: Text(widget.post.incorrectAnswers[0]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    _showIncorrectDialog();
                  },
                  child: Text(widget.post.incorrectAnswers[1]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    _showCorrectDialog();
                    Navigator.of(context).pop();
                  },
                  child: Text(widget.post.correctAnswer),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    _showIncorrectDialog();
                  },
                  child: Text(widget.post.incorrectAnswers[2]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}