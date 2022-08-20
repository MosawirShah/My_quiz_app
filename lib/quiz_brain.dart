import 'question.dart';

class QuizzBrain{
     int questionNumber = 0;

    final List<Question> _questionBank = [
    Question(questionText: 'Capital of Pakisatan is islamabad,', questionAnswer: true),
    Question(questionText: 'Pakistan have 7 provinces,', questionAnswer: false),
    Question(questionText: 'Afghanistan have no atomic bomb ,', questionAnswer: true),
  ];

   void nextQuestion(){
     if(questionNumber < _questionBank.length - 1){
       questionNumber ++;
     }
   }

  String? getQuestionText(){
    return _questionBank[questionNumber].questionText;
  }
  bool getQuestionAnswer(){
    return _questionBank[questionNumber].questionAnswer;
  }

  bool isFinished(){
     if(questionNumber >= _questionBank.length - 1){
       return true;
     }else{
       return false;
     }
  }

  void reset(){
     questionNumber = 0;
  }

}