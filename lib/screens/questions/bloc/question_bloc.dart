import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/models/quiz_model.dart';
import 'package:quiz/screens/home/bloc/home_event.dart';
import 'package:quiz/screens/questions/bloc/question_event.dart';
import 'package:quiz/screens/questions/bloc/question_state.dart';
import 'package:quiz/services/quiz_service.dart';
import 'package:quiz/utils/const.dart';

class QuestionBloc  extends Bloc<QuestionEvent,QuestionState>{
  QuizService quizService = QuizService(baseUrl: baseUrl);
  QuestionBloc(): super(QuestionState()){
    on<FetchQuestion>(fetchQuestion);
    on<SelectOption>(selectOption);
    on<StartTimer>(startTimer);
    on<Tick>(tick);
    // on<SelectedOption>(selectedOption);
  }

   void fetchQuestion(FetchQuestion event, Emitter<QuestionState> emit) async {
    try {
      // Fetch the quiz from the service
      final quiz = await quizService.fetchQuiz();

      // Combine options from all questions
      final allOptions = quiz.questions
          .expand((question) => question.options)
          .toList();

      // Emit the updated state with questions and all options
      emit(state.copyWith(
        questions: quiz.questions,
        options: allOptions,
      ));
    } catch (error) {
      // Handle errors (e.g., API call failures)
      // emit(state.copyWith(errorMessage: error.toString()));
    }
  }

void selectOption(SelectOption event, Emitter<QuestionState> emit) {
  // Create a copy of the current selected options map
  final updatedSelectedOptions = Map<int, String>.from(state.selectedOptions);

  // Update the map with the selected option for the given question index
  updatedSelectedOptions[event.questionIndex] = event.option;

  // Emit the updated state with the new selected options
  emit(state.copyWith(selectedOptions: updatedSelectedOptions));
  print(updatedSelectedOptions);
}


  // void selectedOption(SelectedOption event, Emitter<QuestionState> emit) {

  //   // Emit the updated state with the new selected options
  //   emit(state.copyWith(index: state.index));
  // }

void startTimer(StartTimer event, Emitter<QuestionState> emit) {
  int duration = event.duration; // Get duration from the event (assuming it's passed in seconds)

  // Emit state with updated duration (or other relevant properties)
  emit(state.copyWith(duration: duration)); // Assuming your state has a duration field
}

void tick(Tick event, Emitter<QuestionState> emit) {
  // Decrease duration by 1 second from the current remaining time
  int newDuration = state.remainingTime - 1; // Subtract 1 from current remainingTime

  // Emit updated state with the new remaining time
  emit(state.copyWith(remainingTime: newDuration));

  // Debugging: Print the remaining time to check the value
  print('Current Remaining Time: $newDuration');
}


}