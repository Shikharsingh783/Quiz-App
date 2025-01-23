import 'package:flutter/material.dart';
import 'package:quiz/components/question_page.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({super.key});

  @override
  State<QuestionView> createState() => _QuestionState();
}

class _QuestionState extends State<QuestionView> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: ,
      itemBuilder: (context, index) {
        return QuestionPage();
      }
    );
  }
}