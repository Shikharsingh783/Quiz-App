import 'package:equatable/equatable.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent();

  List<Object> get props => [];
}

class FetchQuestion extends QuestionEvent{

}

class SelectOption extends QuestionEvent{
  final int questionIndex;
  final String option;
  const SelectOption(this.option, this.questionIndex);

  @override
  List<Object> get props => [option, questionIndex];
}

class SelectedOption extends QuestionEvent{
  final int questionIndex;
  final int optionIndex;
  const SelectedOption(this.optionIndex, this.questionIndex);

  @override
  List<Object> get props => [optionIndex, questionIndex];
}

class StartTimer extends QuestionEvent {
  final int duration; // Total duration of the timer
  StartTimer(this.duration);

    @override
  List<Object> get props => [duration];
}

class Tick extends QuestionEvent{
  Tick();

    @override
  List<Object> get props => [];
}

class TimerComplete extends QuestionEvent{}