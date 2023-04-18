import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Grade extends StatelessWidget {
  const Grade({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 10, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20)),
                child: Builder(builder: (context) {
                  return IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                  );
                }),
              ),
            ),
          ),
          SafeArea(
            child: Container(
              child: Column(
                children: [
                  Text(
                    'Why water?',
                    style: GoogleFonts.bubblerOne(
                        fontStyle: FontStyle.values[0],
                        fontWeight: FontWeight.w900,
                        fontSize: 25.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 5,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Text(
                    'Types of water\n'
                    'The various forms of water are the \n'
                    '1. Cold Water\n'
                    '2. The Hot water\n'
                    '3. The warm water',
                    style: GoogleFonts.bubblerOne(
                        fontStyle: FontStyle.values[0],
                        fontWeight: FontWeight.w900,
                        fontSize: 25.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 5,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Text(
                    'Water suppliments.',
                    style: GoogleFonts.bubblerOne(
                        fontStyle: FontStyle.values[0],
                        fontWeight: FontWeight.w900,
                        fontSize: 25.0),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
