// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';

Widget garageCardWidget() {
  return Container(
    height: 140,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Color(0xFFF6F6F6), borderRadius: BorderRadius.circular(7)),
    child: Row(
      children: [
        Container(
            width: 150,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
            child: Image.asset(
              "sf/img/garage.png",
              fit: BoxFit.cover,
            )),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // pp name
            Text(
              "Usma Garage",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
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
                      size: 16,
                      color: Color(0xFFFF6E00),
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 16,
                      color: Color(0xFFFF6E00),
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 16,
                      color: Color(0xFFFF6E00),
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 16,
                      color: Color(0xFFFF6E00),
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 16,
                      color: Color(0xFFFF6E00),
                    ),
                  ],
                ),
                SizedBox(width: 7),
                Text(
                  "50+ Ratings",
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500),
                )
              ],
            ),

            // location
            SizedBox(height: 7),
            Row(
              children: [
                Icon(
                  Icons.location_on_sharp,
                  color: Color(0xFFFF725E),
                ),
                SizedBox(width: 5),
                Text(
                  "Gharda circle, gymkhana road, \nMaharastra, India",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),

            // fuels
            SizedBox(height: 9),
          ],
        ),
      ],
    ),
  );
}
