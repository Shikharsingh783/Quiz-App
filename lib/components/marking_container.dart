import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MarkingContainer extends StatelessWidget {
  final String index;
  const MarkingContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(child: Text(index,style: GoogleFonts.homenaje(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 24),)),
      ),
    );
  }
}