import 'questions.dart';

class InfoData {
  int _questionIndex = 0;
  final List<Question> _questionList = [
    Question(questionText: 'Flutter bir UI frameworkdur', questionAnswer: true),
    Question(questionText: 'DART proqram dili deyil', questionAnswer: false),
    Question(questionText: 'Android Studio olmadan application yaza bilərsiniz',questionAnswer: true),
    Question( questionText: 'Scaffold application-un skeletini təşkil edir', questionAnswer: true),
    Question( questionText: 'OOP-nin 5 əsas prinsipi var', questionAnswer: false),
    Question( questionText: 'DART obyektyönümlü proqramlaşdırma dilidir', questionAnswer: true),
    Question( questionText: 'Flutter ilə həm İOS, həm də Android üçün application yaza bilərsiniz', questionAnswer: true),
    Question( questionText: 'setState() application-u hər dəfə build etmir', questionAnswer: false),
    Question( questionText: 'siz Flutteri beyenirsiniz ?', questionAnswer: true),
  ];

  String getQuestionText() {
    return _questionList[_questionIndex].questionText;
  }

  bool getQuestionAnswer() {
    return _questionList[_questionIndex].questionAnswer;
  }

  void nextQuestion() {
    if(_questionIndex < _questionList.length-1)
     { 
       _questionIndex++;
     }
  }
}
