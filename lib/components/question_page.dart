import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/components/button.dart';
import 'package:quiz/components/option_box.dart';
import 'package:quiz/screens/questions/bloc/question_bloc.dart';
import 'package:quiz/screens/questions/bloc/question_event.dart';
import 'package:quiz/screens/questions/bloc/question_state.dart';

class QuestionPage extends StatefulWidget {
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final int index;
  final int indexOfQuestion;
  final void Function()? onTap;
  final void Function()? onTap_2;
  const QuestionPage({super.key, required this.question, required this.option1, required this.option2, required this.option3, required this.option4, required this.index, this.onTap, this.onTap_2, required this.indexOfQuestion});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final int _duration = 900; // 15 minutes in seconds
  final CountDownController _controller = CountDownController();
  @override
  void initState() {
    super.initState();
    _controller.start();
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 0,
              ),
              // Row(
              //   children: [
              //     Image.asset(
              //       'asset/quiz.png',
              //       height: 100,
              //     ),
              //     Image.asset(
              //       'asset/trophy.png',
              //       height: 100,
              //     ),
              //     const SizedBox(
              //       width: 85,
              //     ),
              //     CircularCountDownTimer(
              //       width: 70,
              //       height: 70,
              //       duration: _duration,
              //       initialDuration: 0,
              //       fillColor: Colors.green,
              //       ringColor: Colors.black,
              //       strokeWidth: 5,
              //       isReverse: true,
              //       controller: _controller,
              //       textStyle: GoogleFonts.homenaje(
              //           fontSize: 25,
              //           color: Colors.black,
              //           fontWeight: FontWeight.bold),
              //       onComplete: () {
              //         print("Timer Complete!");
              //       },
              //     ),
              //   ],
              // ),
                      
              const SizedBox(
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
                          'Question ${widget.index} : ${widget.question}',
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
                      
              // Options
              BlocBuilder<QuestionBloc,QuestionState>(builder: (context,state){
                final selectedOption = state.selectedOptions[widget.indexOfQuestion];
                return Column(
                  children: [
                    OptionBox(
                      option: widget.option1,
                      isSelected: selectedOption == widget.option1,
                      onTap: (){
                        context.read<QuestionBloc>().add(SelectOption(widget.option1,widget.indexOfQuestion));
                      },
                    ),
                    OptionBox(
                      option: widget.option2,
                      isSelected: selectedOption == widget.option2,
                      onTap: (){
                        context.read<QuestionBloc>().add(SelectOption(widget.option2,widget.indexOfQuestion));
                      },
                    ),
                    OptionBox(
                      option: widget.option3,
                      isSelected: selectedOption == widget.option3,
                        onTap: (){
                        context.read<QuestionBloc>().add(SelectOption(widget.option3,widget.indexOfQuestion));
                      },
                    ),
                    OptionBox(
                      option: widget.option4,
                      isSelected: selectedOption == widget.option4,
                        onTap: (){
                        context.read<QuestionBloc>().add(SelectOption(widget.option4,widget.indexOfQuestion));
                      },
                    ),
                  ],
                );
              }),
              
              const SizedBox(
                height: 50,
              ),
                      
               Padding(
                padding: const EdgeInsets.only(left: 20,right: 15,bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Button(text: 'Previous',onTap: widget.onTap_2,height: 80,width: 190,),
                    const SizedBox(width: 20,),
                    Button(text: 'Next',onTap: widget.onTap,width: 190,height: 80,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
