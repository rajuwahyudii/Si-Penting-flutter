class questions {
  final String question;
  final String answer;
  final int score;

  questions({
    required this.question,
    required this.answer,
    required this.score,
  });

  Map<String, dynamic> toMap() {
    return {
      'question': questions,
      'answer': answer,
      'score': score,
    };
  }

  questions.fromMap(Map<String, dynamic> questionsMap)
      : question = questionsMap["question"],
        answer = questionsMap["answer"],
        score = questionsMap["score"];
}
