import 'package:bloc/bloc.dart';
import 'package:quiz/models/quiz_model.dart';
import 'package:quiz/screens/home/bloc/home_event.dart';
import 'package:quiz/screens/home/bloc/home_state.dart';
import 'package:quiz/services/quiz_service.dart';
import 'package:quiz/utils/const.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final QuizService quizService;

  HomeBloc({required this.quizService}) : super(const HomeState()) {
    on<FetchHomeDataEvent>(fetchHomeDataEvent);
  }

  Future<void> fetchHomeDataEvent(
      FetchHomeDataEvent event, Emitter<HomeState> emit) async {
    try {
      // Fetch quiz data using the service (single quiz)
      final quiz = await quizService.fetchQuiz();

      // Emit the state with the fetched quiz data
      emit(state.copyWith(
        title: quiz.title,
        topic: quiz.topic ?? 'No Topic Available', // Handle null topics
        description: quiz.description ??
            'No Description Available', // Handle null descriptions
        duration: quiz.duration ?? 0, // Assuming 0 is a safe default
        correctAnswerMarks:
            quiz.correctAnswerMarks ?? 0, // Assuming 0 is a safe default
        negativeMarks: quiz.negativeMarks ?? 0, // Assuming 0 is a safe default
      ));
    } catch (e) {
      // Handle any errors during the fetch operation
      emit(state.copyWith(
        title: 'Error fetching data',
        topic: 'Error',
        description: 'An error occurred while fetching the quiz data.',
        duration: 10, // Default value for duration
        correctAnswerMarks: 4, // Default marks for correct answer
        negativeMarks: 1, // Default marks for negative answer
      ));
    }
  }
}
