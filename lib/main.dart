import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/components/question_page.dart';
import 'package:quiz/screens/home/bloc/home_bloc.dart';
import 'package:quiz/screens/home/page/entry_page.dart';
import 'package:quiz/screens/home/page/home_page.dart';
import 'package:quiz/screens/questions/bloc/question_bloc.dart';
import 'package:quiz/screens/questions/page/question_view.dart';
import 'package:quiz/services/quiz_service.dart';
import 'package:quiz/utils/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(
            quizService: QuizService(baseUrl: baseUrl),
          ),
        ),

        BlocProvider(create: (context) => QuestionBloc(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: EntryPage(),
      ),
    );
  }
}
