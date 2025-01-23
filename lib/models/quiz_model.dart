class Quiz {
  final int id;
  final String title;
  final String topic;
  final String description;
  final bool isPublished;
  final String difficultyLevel;
  final int duration;
  final double correctAnswerMarks;
  final double negativeMarks;
  final bool shuffle;
  final bool showAnswers;
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
    required this.shuffle,
    required this.showAnswers,
    required this.questions,
  });

  // Parse JSON to Quiz object
  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      title: json['title'],
      topic: json['topic'],
      description: json['description'] ?? '',
      isPublished: json['isPublished'],
      difficultyLevel: json['difficultyLevel'] ?? 'Medium',
      duration: json['duration'],
      correctAnswerMarks: (json['correctAnswerMarks'] as num).toDouble(),
      negativeMarks: (json['negativeMarks'] as num).toDouble(),
      shuffle: json['shuffle'],
      showAnswers: json['showAnswers'],
      questions:
          (json['questions'] as List).map((q) => Question.fromJson(q)).toList(),
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
      'shuffle': shuffle,
      'showAnswers': showAnswers,
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
      description: json['description'],
      detailedSolution: json['detailedSolution'],
      options:
          (json['options'] as List).map((o) => Option.fromJson(o)).toList(),
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
      description: json['description'],
      isCorrect: json['isCorrect'],
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
