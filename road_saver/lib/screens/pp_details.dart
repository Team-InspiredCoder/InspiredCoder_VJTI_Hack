// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:road_saver/payment/payment_method.dart';
import 'package:road_saver/screens/display_map.dart';

class PetrolPumpDetailsScreen extends StatefulWidget {
  final item;

  const PetrolPumpDetailsScreen({super.key, required this.item});

  @override
  State<PetrolPumpDetailsScreen> createState() =>
      _PetrolPumpDetailsScreenState();
}

class _PetrolPumpDetailsScreenState extends State<PetrolPumpDetailsScreen> {
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
                "sf/img/petrol_pump.png",
                height: 295,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),

            // name
            SizedBox(height: 10),
            Text(
              widget.item['alternate_name'],
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
                  //   "No B/44/2, Midc, Kalyan - Shilphata Rd, \nPhase 1, Golivali, Dombivli East, Thane, \nMaharashtra 421203",
                  formatAddress(widget.item['address'], 45),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),

            // fuel
            SizedBox(height: 12),
            Text(
              "What you want?",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 45,
                  width: 125,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.4, color: Color(0xFFB0B0B0)),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 27,
                        width: 27,
                        decoration: BoxDecoration(
                            color: Color(0xFF058A07), shape: BoxShape.circle),
                        child: Icon(
                          Icons.done_rounded,
                          size: 21,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Petrol",
                        style: TextStyle(
                            fontFamily: "Poppins", fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10, width: 10)
                    ],
                  ),
                ),
                SizedBox(width: 7),
                Container(
                  height: 45,
                  width: 125,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.4, color: Color(0xFFB0B0B0)),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 27,
                        width: 27,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xFFB0B0B0)),
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.done_rounded,
                          size: 21,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "CNG",
                        style: TextStyle(
                            fontFamily: "Poppins", fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10, width: 10)
                    ],
                  ),
                ),
                SizedBox(width: 7),
                Container(
                  height: 45,
                  width: 125,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.4, color: Color(0xFFB0B0B0)),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 27,
                        width: 27,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xFFB0B0B0)),
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.done_rounded,
                          size: 21,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Diesel",
                        style: TextStyle(
                            fontFamily: "Poppins", fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10, width: 10)
                    ],
                  ),
                ),
              ],
            ),

            // quantity
            SizedBox(height: 9),
            Container(
              height: 110,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(width: 1.4, color: Color(0xFFB0B0B0))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Petrol",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 1, width: 1)
                    ],
                  ),

                  // capacity
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "capacity",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w300),
                      ),
                      Row(
                        children: [
                          Icon(Icons.remove_rounded),
                          SizedBox(width: 5),
                          Text(
                            "1 Litre",
                            style:
                                TextStyle(fontFamily: "Poppins", fontSize: 16),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.add_rounded)
                        ],
                      )
                    ],
                  ),

                  // price
                  SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.currency_rupee_rounded,
                            size: 18,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "140",
                            style:
                                TextStyle(fontFamily: "Poppins", fontSize: 16),
                          ),
                          SizedBox(width: 18),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),

            // view location on map button
            SizedBox(height: 18),
            InkWell(
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ShowLocationOnMapScreen(
                      lat: double.parse(widget.item['latitude']),
                      log: double.parse(widget.item['longitude']),
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

            // request fuel button
            SizedBox(height: 7),
            InkWell(
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PaymentMethodScreen();
                }))
              },
              child: Container(
                height: 57,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFFF725E),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "Request Fuel",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),

            SizedBox(height: 7)
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
