class Post {
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  Post({this.question, this.correctAnswer, this.incorrectAnswers});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers: json['incorrect_answer'],
    );
  }
}
