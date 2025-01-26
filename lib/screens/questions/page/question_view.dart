import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quiz/components/marking_container.dart';
import 'package:quiz/components/question_page.dart';
import 'package:quiz/screens/questions/bloc/question_bloc.dart';
import 'package:quiz/screens/questions/bloc/question_event.dart';
import 'package:quiz/screens/questions/bloc/question_state.dart';
import 'package:quiz/screens/result/page/result_page.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({Key? key}) : super(key: key);

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  // final int _duration = 900; // 15 minutes in seconds
  final CountDownController _controller = CountDownController();
    final PageController _pageController = PageController(); 
     late Timer _timer;

@override
void initState() {
  super.initState();
  // Fetch questions when the view is initialized
  context.read<QuestionBloc>().add(FetchQuestion());

  // Use Future.delayed to start the timer after a delay
  Future.delayed(const Duration(milliseconds: 500), () {
    // Dispatch StartTimer event to set the timer duration
    context.read<QuestionBloc>().add(StartTimer(900));
  });

  // Future.delayed(const Duration(milliseconds: 5000), () {
  //   // Dispatch StartTimer event to set the timer duration
  //   _controller.start();
  // });

  _startTimer();
}

 // This function triggers the `Tick` event every second.
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      context.read<QuestionBloc>().add(Tick());
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(185, 186, 180, 1),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 60),
        
            // Top Row with images and timer
            BlocBuilder<QuestionBloc,QuestionState>(
              builder: (context, state) {
                    print('Current Duration: ${state.duration}');

    // Handle null or invalid duration
    if (state.duration <= 0) {
      return Center(child: Text("Invalid Timer Duration"));
    }
                return Row(
                children: [
                  Image.asset(
                    'asset/quiz.png',
                    height: 100,
                  ),
                  Image.asset(
                    'asset/trophy.png',
                    height: 100,
                  ),
                  const Spacer(),
                  CircularCountDownTimer(
                    width: 70,
                    height: 70,
                    duration: state.duration,
                    initialDuration: 0,
                    fillColor: Colors.green,
                    ringColor: Colors.black,
                    strokeWidth: 5,
                    isReverse: true,
                    controller: _controller,
                    textStyle: GoogleFonts.homenaje(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    onComplete: () {
                      print("Timer Complete!");
                    },
                  ),
                  const SizedBox(width: 16),
                ],
              );
              },
              
            ),
        
            // Spacing between timer and questions
            const SizedBox(height: 16),
        
            // Questions Section
            Expanded(
              child: BlocConsumer<QuestionBloc, QuestionState>(
                listener: (context, state) {

                  if(state.remainingTime == 0){
                      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Time Alert'),
              content: Text('Time is up!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('See Result'),
                ),
              ],
            );

            
          },
        );
                  }
                  if(state.remainingTime == 600){
                    print('yeah');
                    showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Time Alert'),
              content: Text('You have 10 minutes remaining!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );

            
          },
        );
                  }
                },
                builder: (context, state) {
                  if (state.questions.isEmpty) {
                    // Show loading indicator while questions are loading
                    return const Center(child: CircularProgressIndicator());
                  }
        
                  // Display questions in a scrollable PageView.builder
                  return PageView.builder(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.questions.length,
                    itemBuilder: (context, index) {
                      final question = state.questions[index];
        
                      // Pass question and options to QuestionPage
                      return QuestionPage(
                        question: question.description,
                        option1: question.options[0].description,
                        option2: question.options[1].description,
                        option3: question.options[2].description,
                        option4: question.options[3].description,
                        index: index + 1,
                        indexOfQuestion: index,
                        onTap: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        // Check if we are at the last question (index 9)
if (index == 9) {
  // Navigate to the result page
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => ResultPage()), // Replace with your ResultPage widget
  );
}
                        },
                        onTap_2: () {
                          print(index);
                         if (index == 0) {
  return;
}

_pageController.previousPage(
  duration: const Duration(milliseconds: 300),
  curve: Curves.easeIn,
);



                        }, 
                      );
                    },
                  );
                },
              ),
            ),
        
            BlocBuilder<QuestionBloc, QuestionState>(
              builder: (context, state) {
                return  Container(
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(10),
                  //   topRight: Radius.circular(10),
                  // ),
                ),
              //  child: LinearPercentIndicator(
              //         width: MediaQuery.of(context).size.width - 40,  // Full screen width minus padding
              //         lineHeight: 14.0,  // Adjust line height to make it thicker
              //         percent: state.remainingTime / 900,
              //         backgroundColor: Colors.grey[300],  // Background color of the bar
              //         progressColor: Colors.green,  // Bar color when it's filled
              //         animation: true,  // Animates the progress bar
              //         linearStrokeCap: LinearStrokeCap.roundAll,  // Rounded corners for a smooth look
              //         center: Text(
              //           '${state.remainingTime}s',  // Display remaining time in the middle of the bar
              //           style: TextStyle(
              // fontSize: 16,
              // fontWeight: FontWeight.bold,
              // color: Colors.white,
              //           ),
              //         ),
              //       ),
              );
              }
              
            )
          ],
        ),
      ),
    );
  }
}
