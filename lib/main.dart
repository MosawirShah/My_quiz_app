// prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizz_app_practice/question.dart';
import 'package:quizz_app_practice/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizzBrain quizBrain = QuizzBrain();

void main() {
  runApp(QuizzApp());
}

class QuizzApp extends StatelessWidget {
  const QuizzApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: MyQuizzApp(),
      ),
    );
  }
}

class MyQuizzApp extends StatefulWidget {
  const MyQuizzApp({Key? key}) : super(key: key);

  @override
  State<MyQuizzApp> createState() => _MyQuizzAppState();
}

class _MyQuizzAppState extends State<MyQuizzApp> {
  List<Icon> storeKeeper = [];
  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer = quizBrain.getQuestionAnswer();

      setState(() {
        if(quizBrain.isFinished() == true){
         Alert(
           context: context,
           title: 'Finished',
           desc: 'You have reached to the end of the quiz',
         ).show();

          quizBrain.reset();
          storeKeeper = [];

        }else{
          if(userPickedAnswer == correctAnswer){
            storeKeeper.add(Icon(Icons.check, color: Colors.green,));
          }else{
            storeKeeper.add(Icon(Icons.close, color: Colors.red,));
          }
          quizBrain.nextQuestion();
        }
      });

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 5,
              child: Center(
                  child: Text(
                quizBrain.getQuestionText()!,
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
              child: RawMaterialButton(
                  fillColor: Colors.green,
                  child: Text("TRUE"),
                  onPressed: () {
                    checkAnswer(true);
                  }),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
              child: RawMaterialButton(
                  fillColor: Colors.red,
                  child: Text("FALSE"),
                  onPressed: () {
                    checkAnswer(false);
                  }),
            ),
          ),
          Row(
            children: storeKeeper,
          ),
        ],
      ),
    );
  }
}
