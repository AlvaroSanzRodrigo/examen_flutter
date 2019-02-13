import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Post.dart';

class Presenter {
  Future<List<Post>> fetchPost() async {
    final response =
    await http.get('https://opentdb.com/api.php?amount=10');
    List<Post> posts = [];
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      for (var question in json.decode(response.body)['results']){
        String title = question['question'];
        String correctAnswer = question['correct_answer'];
        List<String> incorrectAnswers = [];
        for (String incorrectAnswer in question['incorrect_answers']){
          incorrectAnswers.add(incorrectAnswer);
        }

        Post post = Post(question: title, correctAnswer: correctAnswer, incorrectAnswers: incorrectAnswers);
        posts.add(post);
      }
      return posts;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}