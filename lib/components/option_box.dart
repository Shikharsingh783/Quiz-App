import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionBox extends StatefulWidget {
  final String option;
  const OptionBox({super.key, required this.option});

  @override
  State<OptionBox> createState() => _OptionBoxState();
}

class _OptionBoxState extends State<OptionBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.grey),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              widget.option,
              style: GoogleFonts.homenaje(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
