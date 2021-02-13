import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final questions = const [
    {
      'questionText': 'What is your favourite color?',
      'answers': ['black', 'white', 'blue', 'green'],
    },
    {
      'questionText': 'what\'s your favouite animal',
      'answers': ['Dog', 'Goat', 'Cat', 'Lion'],
    },
    {
      'questionText': 'whos\'s your favourite person',
      'answers': ['sister', 'girl friend', 'friend'],
    }
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Questionaire App'),
      ),
      body: _questionIndex < questions.length
          ? Column(
              children: [
                Question(questions[_questionIndex]['questionText']),
                ...(questions[_questionIndex]['answers'] as List<String>)
                    .map((answer) {
                  return (Answer(_answerQuestion, answer));
                }).toList()
              ],
            )
          : Center(
              child: Text('Questionaire Completed!',
                  style: TextStyle(fontSize: 28))),
    )));
  }
}
