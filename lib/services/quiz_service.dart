import 'dart:convert';
import 'package:quiz/models/quiz_model.dart';
import 'package:http/http.dart' as http;

class QuizService {
  final String baseUrl;

  QuizService({required this.baseUrl});

  /// Fetch a single quiz (which contains a list of questions)
  Future<Quiz> fetchQuiz() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      // Print the status code and response body for debugging
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        // Print the decoded data to check its structure
        print('Decoded Data: $data');

        // Directly parse the data to Quiz model
        final quiz = Quiz.fromJson(data);

        return quiz;
      } else {
        throw Exception(
            'Failed to load quiz. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Print the error for debugging
      print('Error: $e');
      throw Exception('Error fetching quiz: $e');
    }
  }
}
