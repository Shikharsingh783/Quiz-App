import 'package:equatable/equatable.dart';
import 'package:quiz/models/quiz_model.dart';

enum durationStatus {running,completed}

class QuestionState extends Equatable {
  final List<Question> questions;
  final List<Option> options;
  final Map<int,String> selectedOptions;
  final int optionIndex;
  final int questionIndex;
  final int remainingTime;
  final int duration;
  


  const QuestionState({
    this.duration = 0,
    this.remainingTime = 900,
    this.optionIndex = 0,
    this.questionIndex = 0,
    this.options = const[],
    this.questions = const[],
    this.selectedOptions = const{},

  });

  QuestionState copyWith({
    int? remainingTime,
    int? duration,
    int? questionIndex,
    int? optionIndex,
    List<Question>? questions,
    List<Option>? options,
    Map<int,String>? selectedOptions,
  }) {
    return QuestionState(
      duration: duration ?? this.duration,
      remainingTime: remainingTime ?? this.remainingTime,
      questionIndex: questionIndex ?? this.questionIndex,
      optionIndex: optionIndex ?? this.optionIndex,
      selectedOptions: selectedOptions ?? this.selectedOptions,
      questions: questions ?? this.questions,
      options: options ?? this.options,
    );
  }  

  @override
  List<Object> get props => [ questions, options, selectedOptions, optionIndex, questionIndex, remainingTime, duration];
}
