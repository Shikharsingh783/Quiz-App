import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/components/button.dart';
import 'package:quiz/screens/home/page/home_page.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
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
                  Color.fromRGBO(198, 201, 192, 1),
                  Colors.white,
                ],
              ),
            ),
          ),
          Positioned(
            top: 160,
            right: 100,
            child: SizedBox(
              width: 380,
              child: Image.asset('asset/quiz.png', height: 130),
            ),
          ),
          Positioned(
              bottom: 320,
              right: 35,
              child: Image.asset(
                'asset/Screenshot_2025-01-23_at_2.23.39_PM-removebg-preview.png',
                height: 50,
              )),
          Positioned(
              top: 130,
              right: 40,
              child: Image.asset('asset/trophy.png', height: 180)),
          Positioned(
            bottom: 180,
            left: 32,
            child: SizedBox(
              width: 380,
              child: Text(
                "Play the Quiz to earn points, improve your skills, and unlock new levels and exciting challenges! Compete with friends, achieve milestones, and become a quiz master with every step you take!",
                style: GoogleFonts.homenaje(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.grey),
              ),
            ),
          ),
          Positioned(
              top: 280,
              left: 25,
              child: Image.asset(
                'asset/back.png',
                height: 310,
              )),
          Positioned(
              left: 100,
              bottom: 85,
              child: Button(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                text: 'Get Started',
              ))
        ],
      ),
    );
  }
}
