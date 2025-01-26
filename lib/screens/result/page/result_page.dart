import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/models/quiz_model.dart';
import 'package:quiz/screens/home/bloc/home_bloc.dart';
import 'package:quiz/screens/home/bloc/home_state.dart';
import 'package:quiz/screens/home/page/home_page.dart';
import 'package:quiz/screens/questions/bloc/question_bloc.dart';
import 'package:quiz/screens/questions/bloc/question_state.dart';
import 'package:quiz/services/quiz_service.dart';
import 'package:quiz/utils/const.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  QuizService quizService = QuizService(baseUrl: baseUrl);  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(234, 228, 219, 1),
                  // Color.fromRGBO(238, 235, 229, 1),
                  Colors.white,
                ],
              ),
        ),
        child: Column(
          children: [
            BlocBuilder<QuestionBloc,QuestionState>(builder: (context,state){
             Map<int, String> correctAnswers = quizService.generateCorrectAnswersMap(state.questions);
              int marks = 32;
              // quizService.compareMapsAndCalculateScore(correctAnswers, state.selectedOptions);
              print('correctAnswers: $correctAnswers');
              print(marks);
              return Column(
                children: [
                  const SizedBox(height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10,),
                      Text('ScoreBoard',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 44),),
                      const Icon(Icons.whatshot,size: 40,color: Colors.orange,)
                    ],
                  ),

                  if(marks < 15)
                  Column(
                    children: [
                      Text('Failed',style: GoogleFonts.homenaje(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.red),),
                      BlocBuilder<HomeBloc,HomeState>(
                        builder: (context, state) {
                          return  SizedBox(
                            width: 350,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 20,),
                                    Text('Result for',style: GoogleFonts.homenaje(fontWeight: FontWeight.w500,fontSize: 20),),
                                    const SizedBox(width: 10,),
                                    Text(state.title,style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                                    const SizedBox(width: 10,),
                                    Text('from',style: GoogleFonts.homenaje(fontWeight: FontWeight.w500,fontSize: 20),),
                                    const SizedBox(width: 10,),
                                    // Text(state.topic,style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                                  ],
                                ),
                                Text('${state.topic} :',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                              ],
                            ),
                          );
                        },
                       ),
                       const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Your scored marks are',style: GoogleFonts.homenaje(fontSize: 22,fontWeight: FontWeight.w300),),
                          const SizedBox(width: 10,),
                          Text('$marks',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 30),),
                          const SizedBox(width: 10,),
                          Text('out of',style: GoogleFonts.homenaje(fontSize: 25,fontWeight: FontWeight.w500,),),
                          const SizedBox(width: 10,),
                          Text('40',style: GoogleFonts.homenaje(fontSize: 30, fontWeight: FontWeight.bold),)
                        ],
                      ),
                      const SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         const SizedBox(width: 20,),
                          Text('Detailed Analysis',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                        ],
                      ),

                      const SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 400,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(82, 120, 103, 1),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 20,),
                                                    Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            
                              Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Text('Points Scored',style: GoogleFonts.homenaje(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 25),),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(marks.toString(),style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 18),),
                                    const SizedBox(width: 10,),
                                    Image.asset('asset/Diamond Icon.png',height: 25,width: 25,)
                                  ],
                                ),
                              )
                            ],
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:5),
                                  child: Text('Index',style: GoogleFonts.homenaje(fontSize: 20,fontWeight: FontWeight.bold),),
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                 Text('Your choice',style: GoogleFonts.homenaje(fontSize: 20,fontWeight: FontWeight.bold),),
                                 const SizedBox(
                                  width: 105,
                                ),
                                  Text('correct answer',style: GoogleFonts.homenaje(fontSize: 20,fontWeight: FontWeight.bold),)
                              ],
                                                      ),
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(width: 15,),
                               Expanded(
  child: SizedBox(
    height: 350, // Set a fixed height for the ListView
    child: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 3.5), // Adjust the value for spacing
          child: Text(
            (index + 1).toString(),
            style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,color: Colors.white),
          ),
        );
      },
    ),
  ),
),

                            
                                Padding(
                                  padding: const EdgeInsets.only(right:18.0),
                                  child: Text(state.selectedOptions.values.toList().join('\n'),style: GoogleFonts.homenaje(fontSize: 17,color: Colors.white),),
                                ),

                                Text(correctAnswers.values.toList().join('\n'),style: GoogleFonts.homenaje(fontSize: 17,color: Colors.white),)
                            
                              ],
                            ),

                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30,),

                      Row(
                        children: [
                           const SizedBox(width: 10,),
                          const Icon(Icons.info_outline),
                           const SizedBox(width: 10,),
                          Text('If you wish to try the quiz again click here',style: GoogleFonts.homenaje(fontWeight: FontWeight.w500,fontSize: 20),),
                          const SizedBox(width: 10,),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(228, 70, 42, 1),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(child: Text('Retry',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey[900]),),),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  if(marks >= 15 && marks <=20)
                  Column(
                    children: [
                      Text('Passed',style: GoogleFonts.homenaje(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.green),),
                      BlocBuilder<HomeBloc,HomeState>(
                        builder: (context, state) {
                          return  SizedBox(
                            width: 350,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 20,),
                                    Text('Result for',style: GoogleFonts.homenaje(fontWeight: FontWeight.w500,fontSize: 20),),
                                    const SizedBox(width: 10,),
                                    Text(state.title,style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                                    const SizedBox(width: 10,),
                                    Text('from',style: GoogleFonts.homenaje(fontWeight: FontWeight.w500,fontSize: 20),),
                                    const SizedBox(width: 10,),
                                    // Text(state.topic,style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                                  ],
                                ),
                                Text('${state.topic} :',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                              ],
                            ),
                          );
                        },
                       ),
                       const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Your scored marks are',style: GoogleFonts.homenaje(fontSize: 22,fontWeight: FontWeight.w300),),
                          const SizedBox(width: 10,),
                          Text('$marks',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 30),),
                          const SizedBox(width: 10,),
                          Text('out of',style: GoogleFonts.homenaje(fontSize: 25,fontWeight: FontWeight.w500,),),
                          const SizedBox(width: 10,),
                          Text('40',style: GoogleFonts.homenaje(fontSize: 30, fontWeight: FontWeight.bold),)
                        ],
                      ),
                      const SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         const SizedBox(width: 20,),
                          Text('Detailed Analysis',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                        ],
                      ),

                      const SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 400,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(82, 120, 103, 1),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 20,),
                                                    Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            
                              Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Text('Points Scored',style: GoogleFonts.homenaje(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 25),),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(marks.toString(),style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 18),),
                                    const SizedBox(width: 10,),
                                    Image.asset('asset/Diamond Icon.png',height: 25,width: 25,)
                                  ],
                                ),
                              )
                            ],
                                                    ),

                                                    const SizedBox(height: 5,),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:5),
                                  child: Text('Index',style: GoogleFonts.homenaje(fontSize: 20,fontWeight: FontWeight.bold),),
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                 Text('Your choice',style: GoogleFonts.homenaje(fontSize: 20,fontWeight: FontWeight.bold),),
                                 const SizedBox(
                                  width: 105,
                                ),
                                  Text('correct answer',style: GoogleFonts.homenaje(fontSize: 20,fontWeight: FontWeight.bold),)
                              ],
                                                      ),

                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(width: 15,),
                               Expanded(
  child: SizedBox(
    height: 350, // Set a fixed height for the ListView
    child: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 3.5), // Adjust the value for spacing
          child: Text(
            (index + 1).toString(),
            style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,color: Colors.white),
          ),
        );
      },
    ),
  ),
),

                            
                                Padding(
                                  padding: const EdgeInsets.only(right:18.0),
                                  child: Text(state.selectedOptions.values.toList().join('\n'),style: GoogleFonts.homenaje(fontSize: 17,color: Colors.white),),
                                ),

                                Text(correctAnswers.values.toList().join('\n'),style: GoogleFonts.homenaje(fontSize: 17,color: Colors.white),)
                            
                              ],
                            ),

                            
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30,),

                      Row(
                        children: [
                           const SizedBox(width: 10,),
                          const Icon(Icons.info_outline),
                           const SizedBox(width: 10,),
                          Text('If you wish to try the quiz again click here',style: GoogleFonts.homenaje(fontWeight: FontWeight.w500,fontSize: 20),),
                          const SizedBox(width: 10,),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(228, 70, 42, 1),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(child: Text('Retry',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey[900]),),),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  if(marks > 20 && marks <=30)
                  Column(
                    children: [
                      Text('Very well done',style: GoogleFonts.homenaje(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.pink),),
                      BlocBuilder<HomeBloc,HomeState>(
                        builder: (context, state) {
                          return  SizedBox(
                            width: 350,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 20,),
                                    Text('Result for',style: GoogleFonts.homenaje(fontWeight: FontWeight.w500,fontSize: 20),),
                                    const SizedBox(width: 10,),
                                    Text(state.title,style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                                    const SizedBox(width: 10,),
                                    Text('from',style: GoogleFonts.homenaje(fontWeight: FontWeight.w500,fontSize: 20),),
                                    const SizedBox(width: 10,),
                                    // Text(state.topic,style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                                  ],
                                ),
                                Text('${state.topic} :',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                              ],
                            ),
                          );
                        },
                       ),
                       const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Your scored marks are',style: GoogleFonts.homenaje(fontSize: 22,fontWeight: FontWeight.w300),),
                          const SizedBox(width: 10,),
                          Text('$marks',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 30),),
                          const SizedBox(width: 10,),
                          Text('out of',style: GoogleFonts.homenaje(fontSize: 25,fontWeight: FontWeight.w500,),),
                          const SizedBox(width: 10,),
                          Text('40',style: GoogleFonts.homenaje(fontSize: 30, fontWeight: FontWeight.bold),)
                        ],
                      ),
                      const SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         const SizedBox(width: 20,),
                          Text('Detailed Analysis',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                        ],
                      ),

                      const SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 400,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(82, 120, 103, 1),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 20,),
                                                    Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            
                              Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Text('Points Scored',style: GoogleFonts.homenaje(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 25),),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(marks.toString(),style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 18),),
                                    const SizedBox(width: 10,),
                                    Image.asset('asset/Diamond Icon.png',height: 25,width: 25,)
                                  ],
                                ),
                              )
                            ],
                                                    ),

                                                    const SizedBox(height: 5,),
                            
                                                    Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:5),
                                    child: Text('Index',style: GoogleFonts.homenaje(fontSize: 20,fontWeight: FontWeight.bold),),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                   Text('Your choice',style: GoogleFonts.homenaje(fontSize: 20,fontWeight: FontWeight.bold),),
                                   const SizedBox(
                                    width: 105,
                                  ),
                                    Text('correct answer',style: GoogleFonts.homenaje(fontSize: 20,fontWeight: FontWeight.bold),)
                                ],
                                                        ),
                                
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(width: 15,),
                                 Expanded(
                              child: SizedBox(
                                height: 350, // Set a fixed height for the ListView
                                child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 3.5), // Adjust the value for spacing
                                      child: Text(
                                        (index + 1).toString(),
                                        style: GoogleFonts.homenaje(color: Colors.white,fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            
                              
                                  Padding(
                                    padding: const EdgeInsets.only(right:18.0),
                                    child: Text(state.selectedOptions.values.toList().join('\n'),style: GoogleFonts.homenaje(fontSize: 17,color: Colors.white),),
                                  ),
                            
                                  Text(correctAnswers.values.toList().join('\n'),style: GoogleFonts.homenaje(fontSize: 17,color: Colors.white),)
                              
                                ],
                              ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30,),

                      Row(
                        children: [
                           const SizedBox(width: 10,),
                          const Icon(Icons.info_outline),
                           const SizedBox(width: 10,),
                          Text('If you wish to try the quiz again click here',style: GoogleFonts.homenaje(fontWeight: FontWeight.w500,fontSize: 20),),
                          const SizedBox(width: 10,),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(228, 70, 42, 1),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(child: Text('Retry',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey[900]),),),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  if(marks > 30 && marks < 35)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text('Man!! ',style: GoogleFonts.homenaje(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue),),
                          Text('You are good',style: GoogleFonts.homenaje(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.blue),),
                        ],
                      ),
                      BlocBuilder<HomeBloc,HomeState>(
                        builder: (context, state) {
                          return  SizedBox(
                            width: 350,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 20,),
                                    Text('Result for',style: GoogleFonts.homenaje(fontWeight: FontWeight.w500,fontSize: 20),),
                                    const SizedBox(width: 10,),
                                    Text(state.title,style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                                    const SizedBox(width: 10,),
                                    Text('from',style: GoogleFonts.homenaje(fontWeight: FontWeight.w500,fontSize: 20),),
                                    const SizedBox(width: 10,),
                                    // Text(state.topic,style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                                  ],
                                ),
                                Text('${state.topic} :',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                              ],
                            ),
                          );
                        },
                       ),
                       const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Your scored marks are',style: GoogleFonts.homenaje(fontSize: 22,fontWeight: FontWeight.w300),),
                          const SizedBox(width: 10,),
                          Text('$marks',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 30),),
                          const SizedBox(width: 10,),
                          Text('out of',style: GoogleFonts.homenaje(fontSize: 25,fontWeight: FontWeight.w500,),),
                          const SizedBox(width: 10,),
                          Text('40',style: GoogleFonts.homenaje(fontSize: 30, fontWeight: FontWeight.bold),)
                        ],
                      ),
                      const SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         const SizedBox(width: 20,),
                          Text('Detailed Analysis',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                        ],
                      ),

                      const SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 400,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(82, 120, 103, 1),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 20,),
                                                    Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            
                              Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Text('Points Scored',style: GoogleFonts.homenaje(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 25),),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(marks.toString(),style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 18),),
                                    const SizedBox(width: 10,),
                                    Image.asset('asset/Diamond Icon.png',height: 25,width: 25,)
                                  ],
                                ),
                              )
                            ],
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:5),
                                  child: Text('Index',style: GoogleFonts.homenaje(fontSize: 20,fontWeight: FontWeight.bold),),
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                 Text('Your choice',style: GoogleFonts.homenaje(fontSize: 20,fontWeight: FontWeight.bold),),
                                 const SizedBox(
                                  width: 105,
                                ),
                                  Text('correct answer',style: GoogleFonts.homenaje(fontSize: 20,fontWeight: FontWeight.bold),)
                              ],
                                                      ),
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(width: 15,),
                               Expanded(
  child: SizedBox(
    height: 350, // Set a fixed height for the ListView
    child: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 3.5), // Adjust the value for spacing
          child: Text(
            (index + 1).toString(),
            style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,color: Colors.white),
          ),
        );
      },
    ),
  ),
),

                            
                                Padding(
                                  padding: const EdgeInsets.only(right:18.0),
                                  child: Text(state.selectedOptions.values.toList().join('\n'),style: GoogleFonts.homenaje(fontSize: 17,color: Colors.white),),
                                ),

                                Text(correctAnswers.values.toList().join('\n'),style: GoogleFonts.homenaje(fontSize: 17,color: Colors.white),)
                            
                              ],
                            ),

                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30,),

                      Row(
                        children: [
                           const SizedBox(width: 10,),
                          const Icon(Icons.info_outline),
                           const SizedBox(width: 10,),
                          Text('If you wish to try the quiz again click here',style: GoogleFonts.homenaje(fontWeight: FontWeight.w500,fontSize: 20),),
                          const SizedBox(width: 10,),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(228, 70, 42, 1),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(child: Text('Retry',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey[900]),),),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  if(marks >= 35)
                  Column(
                    children: [
                      Text('Excellent',style: GoogleFonts.homenaje(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.purple),),
                      BlocBuilder<HomeBloc,HomeState>(
                        builder: (context, state) {
                          return  SizedBox(
                            width: 350,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 20,),
                                    Text('Result for',style: GoogleFonts.homenaje(fontWeight: FontWeight.w500,fontSize: 20),),
                                    const SizedBox(width: 10,),
                                    Text(state.title,style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                                    const SizedBox(width: 10,),
                                    Text('from',style: GoogleFonts.homenaje(fontWeight: FontWeight.w500,fontSize: 20),),
                                    const SizedBox(width: 10,),
                                    // Text(state.topic,style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                                  ],
                                ),
                                Text('${state.topic} :',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                              ],
                            ),
                          );
                        },
                       ),
                       const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Your scored marks are',style: GoogleFonts.homenaje(fontSize: 22,fontWeight: FontWeight.w300),),
                          const SizedBox(width: 10,),
                          Text('$marks',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 30),),
                          const SizedBox(width: 10,),
                          Text('out of',style: GoogleFonts.homenaje(fontSize: 25,fontWeight: FontWeight.w500,),),
                          const SizedBox(width: 10,),
                          Text('40',style: GoogleFonts.homenaje(fontSize: 30, fontWeight: FontWeight.bold),)
                        ],
                      ),
                      const SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         const SizedBox(width: 20,),
                          Text('Detailed Analysis',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 25),),
                        ],
                      ),

                      const SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 400,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(82, 120, 103, 1),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 20,),
                                                    Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            
                              Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Text('Points Scored',style: GoogleFonts.homenaje(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 25),),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(marks.toString(),style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 18),),
                                    const SizedBox(width: 10,),
                                    Image.asset('asset/Diamond Icon.png',height: 25,width: 25,)
                                  ],
                                ),
                              )
                            ],
                                                    ),

                                                    const SizedBox(height: 5),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:5),
                                  child: Text('Index',style: GoogleFonts.homenaje(fontSize: 20,fontWeight: FontWeight.bold),),
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                 Text('Your choice',style: GoogleFonts.homenaje(fontSize: 20,fontWeight: FontWeight.bold),),
                                 const SizedBox(
                                  width: 105,
                                ),
                                  Text('correct answer',style: GoogleFonts.homenaje(fontSize: 20,fontWeight: FontWeight.bold),)
                              ],
                                                      ),

                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(width: 15,),
                               Expanded(
  child: SizedBox(
    height: 350, // Set a fixed height for the ListView
    child: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 3.5), // Adjust the value for spacing
          child: Text(
            (index + 1).toString(),
            style: GoogleFonts.homenaje(color: Colors.white,fontWeight: FontWeight.bold),
          ),
        );
      },
    ),
  ),
),

                            
                                Padding(
                                  padding: const EdgeInsets.only(right:18.0),
                                  child: Text(state.selectedOptions.values.toList().join('\n'),style: GoogleFonts.homenaje(fontSize: 17,color: Colors.white),),
                                ),

                                Text(correctAnswers.values.toList().join('\n'),style: GoogleFonts.homenaje(fontSize: 17,color: Colors.white),)
                            
                              ],
                            ),

                            
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30,),

                      Row(
                        children: [
                           const SizedBox(width: 10,),
                          const Icon(Icons.info_outline),
                           const SizedBox(width: 10,),
                          Text('If you wish to try the quiz again click here',style: GoogleFonts.homenaje(fontWeight: FontWeight.w500,fontSize: 20),),
                          const SizedBox(width: 10,),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(228, 70, 42, 1),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(child: Text('Retry',style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey[900]),),),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}