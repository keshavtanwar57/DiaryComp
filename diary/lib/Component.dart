import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryViewChild extends StatelessWidget {
  const StoryViewChild({
    required this.Heading,
    required this.Body,
  });

  final String Heading;
  final String Body;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(Heading, style: GoogleFonts.mPlusRounded1c(fontSize: 40)),
          SizedBox(
            height: 20,
          ),
          Container(
            child: SingleChildScrollView(
              child: Text(
                Body,
                style: GoogleFonts.mPlusRounded1c(fontSize: 20),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: MediaQuery.of(context).size.height * .8,
            width: MediaQuery.of(context).size.width * .8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: Colors.black),
          ),
        ],
      ),
    );
  }
}
