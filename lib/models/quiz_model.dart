class Quiz {
  final int id;
  final String title;
  String topic;
  String description;
  final bool isPublished;
  final String difficultyLevel;
  final int duration;
  final double
      correctAnswerMarks; // Can stay as double to represent decimal points if necessary
  final double
      negativeMarks; // Can stay as double to represent decimal points if necessary
  final List<Question> questions;

  Quiz({
    required this.id,
    required this.title,
    required this.topic,
    this.description = '',
    required this.isPublished,
    this.difficultyLevel = 'Medium',
    required this.duration,
    required this.correctAnswerMarks,
    required this.negativeMarks,
    required this.questions,
  });

  // Parse JSON to Quiz object
  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      title: json['title'] ?? 'Untitled',
      topic: json['topic'] ?? 'No Topic Available',
      description: json['description'] ?? '',
      isPublished: json['isPublished'] ?? false,
      difficultyLevel: json['difficultyLevel'] ?? 'Medium',
      duration: json['duration'] ?? 0,
      correctAnswerMarks:
          double.tryParse(json['correct_answer_marks'] ?? '0') ??
              0.0, // Convert from String to double
      negativeMarks: double.tryParse(json['negative_marks'] ?? '0') ??
          0.0, // Convert from String to double
      questions: (json['questions'] as List?)
              ?.map((q) => Question.fromJson(q))
              .toList() ??
          [],
    );
  }

  // Convert Quiz object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'topic': topic,
      'description': description,
      'isPublished': isPublished,
      'difficultyLevel': difficultyLevel,
      'duration': duration,
      'correctAnswerMarks': correctAnswerMarks,
      'negativeMarks': negativeMarks,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }
}

class Question {
  final int id;
  final String description;
  final String detailedSolution;
  final List<Option> options;

  Question({
    required this.id,
    required this.description,
    required this.detailedSolution,
    required this.options,
  });

  // Parse JSON to Question object
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      description: json['description'] ?? 'No Description',
      detailedSolution: json['detailedSolution'] ?? 'No Solution Available',
      options:
          (json['options'] as List?)?.map((o) => Option.fromJson(o)).toList() ??
              [],
    );
  }

  // Convert Question object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'detailedSolution': detailedSolution,
      'options': options.map((o) => o.toJson()).toList(),
    };
  }
}

class Option {
  final int id;
  final String description;
  final bool isCorrect;

  Option({
    required this.id,
    required this.description,
    required this.isCorrect,
  });

  // Parse JSON to Option object
  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      description: json['description'] ?? 'No Description',
      isCorrect: json['is_correct'] ?? false,
    );
  }

  // Convert Option object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'isCorrect': isCorrect,
    };
  }
}
