import 'question.dart';

class AppBrain {
  // List of questions for the quiz
  final List<Question> _questionGroup = [
    Question(
        q: 'Who is considered the author of the majority of the New Testament?',
        c: ['A) Paul', 'B) Peter', 'C) John', 'D) Matthew'],
        a: 'A) Paul'),
    Question(
        q: 'Which prophet is known for building an ark to save his family and animals from a flood?',
        c: ['A) Moses', 'B) Isaiah', 'C) Noah', 'D) Abraham'],
        a: 'C) Noah'),
    Question(
        q: 'What is the first book of the New Testament?',
        c: ['A) Genesis', 'B) Exodus', 'C) Matthew', 'D) Revelation'],
        a: 'C) Matthew'),
    Question(
        q: 'Who was the first apostle to deny Jesus three times?',
        c: ['A) James', 'B) Thomas', 'C) Judas', 'D) Peter'],
        a: 'D) Peter'),
    Question(
        q: 'Which city is known as the birthplace of Jesus?',
        c: ['A) Jerusalem', 'B) Nazareth', 'C) Bethlehem', 'D) Jericho'],
        a: 'C) Bethlehem'),
    Question(
        q: 'According to the Bible, who was swallowed by a great fish and survived?',
        c: ['A) Jonah', 'B) Job', 'C) Elijah', 'D) Jeremiah'],
        a: 'A) Jonah'),
    Question(
        q: 'What is the last book of the New Testament?',
        c: ['A) Acts', 'B) Romans', 'C) Revelation', 'D) Hebrews'],
        a: 'C) Revelation'),
    Question(
        q: 'Who wrote the longest of the four Gospels?',
        c: ['A) Matthew', 'B) Mark', 'C) Luke', 'D) John'],
        a: 'C) Luke'),
    Question(
        q: 'According to the Ten Commandments, what is the Sabbath day?',
        c: ['A) Saturday', 'B) Sunday', 'C) Monday', 'D) Friday'],
        a: 'A) Saturday'),
    Question(
        q: 'What is the first book of the Old Testament?',
        c: ['A) Genesis', 'B) Exodus', 'C) Leviticus', 'D) Numbers'],
        a: 'A) Genesis'),
    Question(
        q: 'Who was the first king of Israel?',
        c: ['A) Saul', 'B) David', 'C) Solomon', 'D) Samuel'],
        a: 'A) Saul'),
    Question(
        q: 'Which disciple famously doubted Jesus\' resurrection until he saw Jesus himself?',
        c: ['A) Thomas', 'B) James', 'C) Philip', 'D) Bartholomew'],
        a: 'A) Thomas'),
    Question(
        q: 'Who led the Israelites across the Jordan River into the Promised Land?',
        c: ['A) Moses', 'B) Aaron', 'C) Joshua', 'D) Caleb'],
        a: 'C) Joshua'),
    Question(
        q: 'What is the shortest verse in the Bible?',
        c: [
          'A) "Jesus wept."',
          'B) "God is love."',
          'C) "I am the way."',
          'D) "Seek and you will find."'
        ],
        a: 'A) "Jesus wept."'),
    Question(
        q: 'What miracle did Jesus perform at the wedding in Cana?',
        c: [
          'A) Healing a blind man',
          'B) Walking on water',
          'C) Turning water into wine',
          'D) Feeding the multitude'
        ],
        a: 'C) Turning water into wine'),
    Question(
        q: 'Who is known as the "father of faith" in Christianity?',
        c: ['A) Abraham', 'B) Isaac', 'C) Jacob', 'D) Joseph'],
        a: 'A) Abraham'),
    Question(
        q: 'According to the Bible, who was sold into slavery by his brothers?',
        c: ['A) Isaac', 'B) Jacob', 'C) Joseph', 'D) Esau'],
        a: 'C) Joseph'),
    Question(
        q: 'What did Jesus feed to the multitude of people in the wilderness?',
        c: [
          'A) Bread and fish',
          'B) Milk and honey',
          'C) Water and bread',
          'D) Wine and bread'
        ],
        a: 'A) Bread and fish'),
    Question(
        q: 'Who wrote the majority of the Psalms?',
        c: ['A) David', 'B) Solomon', 'C) Asaph', 'D) Moses'],
        a: 'A) David'),
    Question(
        q: 'According to the Bible, who was the oldest man to ever live?',
        c: ['A) Adam', 'B) Methuselah', 'C) Noah', 'D) Abraham'],
        a: 'B) Methuselah'),
  ];


  // Method to get the question number
  Question getQuestion(int questionNumber) {
    return _questionGroup[questionNumber];
  }

  // Metod to get the quesion text
  String? getQuestionText(int questionNumber) {
    return getQuestion(questionNumber).questionText;
  }

  // Method to get answer choices
  List<String?>? getAnswerChoices(int questionNumber) {
    return getQuestion(questionNumber).questionChoices;
  }

  // Method to get the correct answer
  String? getCorrectAnswer(int questionNumber) {
    return getQuestion(questionNumber).questionAnswer;
  }

  // Method to get the number of questions
  int getQuestionCount() {
    return _questionGroup.length;
  }
}
