import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/screens/home/bloc/home_bloc.dart';
import 'package:quiz/screens/home/bloc/home_event.dart';
import 'package:quiz/screens/home/bloc/home_state.dart';

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
    context.read<HomeBloc>().add(FetchHomeDataEvent());
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
                   Container(
                    decoration: BoxDecoration(
                      borderRadius: 
                    ),
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
