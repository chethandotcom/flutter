import 'question_model.dart';

class QuizBrain {
  int qIndex = 0;

  List<QuestionModel> listQuestions = [
    QuestionModel(
      'You can lead a cow down stairs but not up stairs.',
      false,
    ),
    QuestionModel(
      'Approximately one quarter of human bones are in the feet.',
      true,
    ),
    QuestionModel(
      'A slug\'s blood is green.',
      true,
    ),
    QuestionModel('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    QuestionModel('It is illegal to pee in the Ocean in Portugal.', true),
    QuestionModel(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    QuestionModel(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    QuestionModel(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    QuestionModel(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    QuestionModel('Google was originally called \"Backrub\".', true),
    QuestionModel(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    QuestionModel(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  bool canGotoNext() {
    if (qIndex < listQuestions.length - 1) return true;

    return false;
  }

  void nextQuestion() {
    if (qIndex < listQuestions.length - 1) {
      qIndex++;
    }
  }

  QuestionModel getQuestion() => listQuestions[qIndex];
}
