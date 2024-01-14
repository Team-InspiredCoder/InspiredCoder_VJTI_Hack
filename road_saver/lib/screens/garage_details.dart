// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:road_saver/screens/display_map.dart';

class GarageDetailsScreen extends StatefulWidget {
  final item;

  const GarageDetailsScreen({super.key, required this.item});

  @override
  State<GarageDetailsScreen> createState() => _GarageDetailsScreenState();
}

class _GarageDetailsScreenState extends State<GarageDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
    //   appBar: AppBar(
    //     title: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         SizedBox(
    //           width: 75,
    //           // color: Colors.amber,
    //           child: Row(
    //             children: [
    //               Icon(Icons.arrow_back_ios_new_rounded),
    //               Text(
    //                 "Back",
    //                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Container(
    //           width: 75,
    //         )
    //       ],
    //     ),
    //   ),

      // body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.asset(
                "sf/img/garage.png",
                height: 295,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),

            // name
            SizedBox(height: 10),
            Text(
              widget.item['name'],
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
                  formatAddress(widget.item['address'], 45),
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
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ShowLocationOnMapScreen(
                      lat: double.parse(widget.item['lat']),
                      log: double.parse(widget.item['log']),
                      mapZoom: 18);
                }))
              },
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

            // request mechanic button
            SizedBox(height: 10),
            InkWell(
              onTap: () => {},
              child: Container(
                height: 57,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFFF725E),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "Request Mechanic",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),

            SizedBox(height: 34)
          ],
        ),
      ),
    );
  }

  String formatAddress(String addr, int n) {
    StringBuffer output = StringBuffer();

    for (int i = 0; i < addr.length; i++) {
      output.write(addr[i]);

      if ((i + 1) % n == 0) {
        output.write('\n');
      }
    }

    return output.toString();
  }
}
