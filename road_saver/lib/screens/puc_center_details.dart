// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';

class PucCenterDetailsScreen extends StatefulWidget {
  const PucCenterDetailsScreen({super.key});

  @override
  State<PucCenterDetailsScreen> createState() => _PucCenterDetailsScreenState();
}

class _PucCenterDetailsScreenState extends State<PucCenterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 75,
              // color: Colors.amber,
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios_new_rounded),
                  Text(
                    "Back",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              width: 75,
            )
          ],
        ),
      ),

      // body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.asset(
                "sf/img/puc_center.jpeg",
                height: 295,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),

            // name
            SizedBox(height: 10),
            Text(
              "Usma PUC",
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600),
            ),

            // ratings
            SizedBox(height: 5),
            Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 25,
                      color: Color(0xFFFF6E00),
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 25,
                      color: Color(0xFFFF6E00),
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 25,
                      color: Color(0xFFFF6E00),
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 25,
                      color: Color(0xFFFF6E00),
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 25,
                      color: Color(0xFFFF6E00),
                    ),
                  ],
                ),
                SizedBox(width: 7),
                Text(
                  "50+ Ratings",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500),
                )
              ],
            ),

            // location
            SizedBox(height: 5),
            Row(
              children: [
                Icon(
                  Icons.location_on_sharp,
                  size: 34,
                  //   color: Color(0xFFFF725E),
                ),
                SizedBox(width: 5),
                Text(
                  "No B/44/2, Midc, Kalyan - Shilphata Rd, \nPhase 1, Golivali, Dombivli East, Thane, \nMaharashtra 421203",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),

            Expanded(
                child: SizedBox(
              height: 1,
            )),

            // view location on map button
            SizedBox(height: 18),
            InkWell(
              onTap: () => {},
              child: Container(
                height: 57,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.4, color: Color(0xFFFF725E)),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "View location on Map",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF725E),
                    ),
                  ),
                ),
              ),
            ),


            SizedBox(height: 45)
          ],
        ),
      ),
    );
  }
}
