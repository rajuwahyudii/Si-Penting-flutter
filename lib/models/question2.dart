class questions2 {
  final String question;
  final String answer;
  final int score;

  questions2({
    required this.question,
    required this.answer,
    required this.score,
  });

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answer': [
        {
          'text': answer,
          'score': score,
        }
      ]
    };
  }

  questions2.fromMap(Map<String, dynamic> questionsMap)
      : question = questionsMap["question"],
        answer = questionsMap["answer"],
        score = questionsMap["score"];
}
