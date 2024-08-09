class Question {
  String? questionText;
  List<String?>? questionChoices;
  String? questionAnswer;

  Question({String? q, List<String?>? c, String? a}) {
    questionText = q;
    questionChoices = c;
    questionAnswer = a;
  }
}