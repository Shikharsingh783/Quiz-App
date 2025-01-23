import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final String title;
  final String topic;
  final String description;
  final int duration;
  final double correctAnswerMarks;
  final double negativeMarks;

  const HomeState(
      {this.title = '',
      this.topic = '',
      this.description = '',
      this.duration = 0,
      this.correctAnswerMarks = 0,
      this.negativeMarks = 0});

  HomeState copyWith(
      {String? title,
      String? topic,
      String? description,
      int? duration,
      double? correctAnswerMarks,
      double? negativeMarks}) {
    return HomeState(
        title: title ?? this.title,
        topic: topic ?? this.topic,
        description: description ?? this.description,
        duration: duration ?? this.duration,
        correctAnswerMarks: correctAnswerMarks ?? this.correctAnswerMarks,
        negativeMarks: negativeMarks ?? this.negativeMarks);
  }

  @override
  List<Object?> get props =>
      [title, topic, description, duration, correctAnswerMarks, negativeMarks];
}
