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


  // Function to generate a map of correct answers for each question
Map<int, String> generateCorrectAnswersMap(List<Question> questions) {
  final Map<int, String> correctAnswers = {};

  // Loop through each question in the list
  for (var question in questions) {
    // Find the correct option by checking the 'isCorrect' flag
    final correctOption = question.options
        .firstWhere((option) => option.isCorrect, orElse: () => Option(id: 0, description: '', isCorrect: false));

    // Add the correct option description to the map, using the question's ID
    correctAnswers[question.id] = correctOption.description;
  }

  return correctAnswers; // Return the map
}

// Function to check the answers and display the score
int compareMapsAndCalculateScore(Map<int, String> map1, Map<int, String> map2) {
  int score = 0;

  // Convert the values of both maps to lists
  List<String> values1 = map1.values.toList();
  List<String> values2 = map2.values.toList();

  // Loop through each value in map1
  for (var value in values1) {
    // Check if the value exists in map2
    if (values2.contains(value)) {
      score += 4;  // Correct match
      values2.remove(value);  // Remove matched value to prevent counting it again
    } else {
      score -= 1;  // Incorrect match
    }
  }

  print('Total Score: $score');
  return score;
}
  
}
