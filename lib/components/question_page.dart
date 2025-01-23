import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/components/button.dart';
import 'package:quiz/components/option_box.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final int _duration = 900; // 15 minutes in seconds
  CountDownController _controller = CountDownController();

  @override
  void initState() {
    super.initState();
    _controller.start();
    print("Initializing timer with $_duration seconds");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(198, 201, 192, 1),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Row(
              children: [
                Image.asset(
                  'asset/quiz.png',
                  height: 100,
                ),
                Image.asset(
                  'asset/trophy.png',
                  height: 100,
                ),
                SizedBox(
                  width: 85,
                ),
                CircularCountDownTimer(
                  width: 70,
                  height: 70,
                  duration: _duration,
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
              ],
            ),

            SizedBox(
              height: 40,
            ),

            //question
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(228, 70, 42, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Question 1 : Identify the characteristic which is not applicable to the genetic code',
                        style: GoogleFonts.homenaje(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 50,
            ),

            //options

            OptionBox(option: 'Non-Polar'),
            OptionBox(option: 'Non-Overlapping'),
            OptionBox(option: 'Non-Overlapping'),
            OptionBox(option: 'Non-Overlapping'),

            // Spacer(),
            SizedBox(
              height: 50,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Button(text: 'Next Question'),
            )
          ],
        ),
      ),
    );
  }
}
