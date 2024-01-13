// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:road_saver/custom_widgets/bottom_navigation.dart';
import 'package:road_saver/custom_widgets/garage_card.dart';

class GarageScreen extends StatefulWidget {
  const GarageScreen({super.key});

  @override
  State<GarageScreen> createState() => _GarageScreenState();
}

class _GarageScreenState extends State<GarageScreen> {
  final searchBoxController = TextEditingController();

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
            Text(
              "Garage",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),
            ),
            Container(
              width: 75,
            )
          ],
        ),
      ),

      // body

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on_sharp,
                  color: Color(0xFFFF725E),
                ),
                SizedBox(width: 5),
                Text(
                  "Gharda circle, gymkhana road, Maharastra, India",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),

            // Search bar
            SizedBox(height: 16),
            Container(
              height: 57,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xFF8B8B8B)),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: TextField(
                  controller: searchBoxController,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.left,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search nearby garage",
                    hintStyle: TextStyle(
                        color: Color(0xFF8B8B8B),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Poppins"),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        Icons.search,
                        size: 25,
                        color: Color(0xFF595959),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // petrol pumps list
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    garageCardWidget(),
                    SizedBox(height: 5),
                    garageCardWidget(),
                    SizedBox(height: 5),
                    garageCardWidget(),
                    SizedBox(height: 5),
                    garageCardWidget(),
                    SizedBox(height: 5),
                    garageCardWidget(),
                    SizedBox(height: 5),
                    garageCardWidget(),
                    SizedBox(height: 5),
                    garageCardWidget(),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNavigationBarWidget(context, 0)
      
    
    
    );
  }
}
