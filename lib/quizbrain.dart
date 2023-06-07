import 'package:quizzler_flutter_project/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
        'Seahorses have stomachs for the absorption of nutrients from food',
        false),
    Question('The letter H is between letters G and J on a keyboard', true),
    Question('Camels have three sets of eyelashes', true),
    Question('There are stars and zigzags on the flag of America', false),
    Question(
        'If you add the two numbers on the opposite sides of dice together, the answer is always 7',
        true),
    Question('New York is nicknamed \'The Big Orange\'', false),
    Question(
        'The human body is full of friendly bacteria, with organisms on our skin and in our guts helping keep our bodies humming.',
        true),
    Question('Scallops don\'t have good vision', false),
    Question(
        'The dinosaur with the longest neck for its body size is Mamenchisaurus hochuanensis, a sauropod dino that lived in what is now China.',
        true),
    Question('Your hand has a built in snuff box', true),
    Question(
        'Toilet paper is a relatively recent invention, but the ancients still had to wipe. Roman philosopher Seneca, who lived from 4 B.C. to A.D. 65, recorded the use of a sponge attached to a stick that did the job.',
        true),
    Question('Apes cant laugh.', false),
    Question('A snail can sleep for three months.', false),
  ];

  String questionGetter() {
    return _questionBank[_questionNumber].questionText;
  }

  bool answerGetter() {
    return _questionBank[_questionNumber].answerOption;
  }

  nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    } else {
      isFinished();
    }
  }

  isFinished() {
    if (_questionNumber + 1 >= _questionBank.length - 1) {
      return true;
    }
  }

  reset() {
    _questionNumber = 0;
  }
}
