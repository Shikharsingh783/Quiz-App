import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/components/button.dart';
import 'package:quiz/screens/home/bloc/home_bloc.dart';
import 'package:quiz/screens/home/bloc/home_event.dart';
import 'package:quiz/screens/home/bloc/home_state.dart';
import 'package:quiz/screens/questions/page/question_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Dispatch the event to fetch quiz data when the page loads
    context.read<HomeBloc>().add(const FetchHomeDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(223, 227, 217, 1), // Light blue
                  Color.fromRGBO(234, 231, 226, 1), // Light blue
                  Colors.white, // Dark blue
                ],
              ),
            ),
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              // Check if data is available or if error occurred
              if (state.title == 'Error fetching data') {
                return Center(
                  child: Text(state.description),
                );
              }

              // Render the quiz data (title, topic, description, etc.)
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 70),
                    Row(
                      children: [
                        Text('Quiz of the Day',
                            style: GoogleFonts.ultra(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            )),
                        Image.asset(
                          'asset/trophy.png',
                          height: 80,
                        )
                      ],
                    ),
                    Text(
                      'Dive into the fascinating world of Genetics and Evolution! Test your knowledge of DNA, inheritance, and the journey of life through time. Challenge yourself and uncover the secrets of nature!',
                      style: GoogleFonts.homenaje(
                          fontWeight: FontWeight.w100, fontSize: 24),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Rules',
                          style: GoogleFonts.homenaje(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.whatshot,
                            color: Colors.orange, size: 30)
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromRGBO(228, 70, 42, 1)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              // Title
                              Text(
                                state.title,
                                style: GoogleFonts.roboto(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Topic
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.grey[100]),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.topic,
                                                color: Colors.orange, size: 24),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                state.topic,
                                                style: GoogleFonts.roboto(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(height: 12),

                                      // Duration
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.timer,
                                                color: Colors.green, size: 24),
                                            const SizedBox(width: 8),
                                            Row(
                                              children: [
                                                Text(
                                                  'Duration: ',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  '${state.duration}',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  ' minutes',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 12),

                                      // Correct Answer Marks
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.check_circle,
                                                color: Colors.greenAccent,
                                                size: 24),
                                            const SizedBox(width: 8),
                                            Row(
                                              children: [
                                                Text(
                                                  'Correct Answer Marks: ',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '${state.correctAnswerMarks}',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      // Negative Marks
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.cancel,
                                                color: Colors.red, size: 24),
                                            const SizedBox(width: 8),
                                            Row(
                                              children: [
                                                Text(
                                                  'Negative Marks: ',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '${state.negativeMarks}',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 60),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 350,
                      child: Row(
                        children: [
                          Icon(Icons.info_outline),
                          const SizedBox(width: 10),
                          Text(
                            'Please ensure you read all questions carefully before\n submitting your answers.',
                            style: GoogleFonts.homenaje(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                     Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Button(text: 'Start quiz',onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>QuestionView()));
                      },),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
