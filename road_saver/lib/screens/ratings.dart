// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Add Review",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins"),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        
            Text(
              "ST. Marry's Auto Garage",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),

            SizedBox(
              height: 50,
            ),
        
            Image.asset('sf/img/rating_gif.png'),
            SizedBox(
              height: 50,
            ),
        
            Text(
              "Rate Your Experience",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
        
            SizedBox(height: 7),
            Text(
              "Our ratings and reviews play a crucial role \nin assisting individuals seeking garage services.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(89, 89, 89, 1),
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 40,
            ),
        
            //ratings
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_border,
                  size: 40,
                  color: Color.fromRGBO(255, 114, 94, 1),
                ),
                SizedBox(
                  width: 30,
                ),
                Icon(
                  Icons.star_border,
                  size: 40,
                  color: Color.fromRGBO(255, 114, 94, 1),
                ),
                SizedBox(
                  width: 30,
                ),
                Icon(
                  Icons.star_border,
                  size: 40,
                  color: Color.fromRGBO(255, 114, 94, 1),
                ),
                SizedBox(
                  width: 30,
                ),
                Icon(
                  Icons.star_border,
                  size: 40,
                  color: Color.fromRGBO(255, 114, 94, 1),
                ),
                SizedBox(
                  width: 30,
                ),
                Icon(
                  Icons.star_border,
                  size: 40,
                  color: Color.fromRGBO(255, 114, 94, 1),
                ),
              ],
            ),
        
            SizedBox(height: 70),
            Container(
              height: 57,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color.fromRGBO(255, 114, 94, 1)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 154, vertical: 18),
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "Poppins", fontWeight: FontWeight.w500),
                ),
              ),
            ),
        
            //maybe later
            SizedBox(height: 10),
            Text(
              "Maybe latter ",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
