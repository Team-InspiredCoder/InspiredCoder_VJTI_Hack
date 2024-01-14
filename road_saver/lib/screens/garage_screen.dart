// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:road_saver/custom_widgets/bottom_navigation.dart';
import 'package:road_saver/custom_widgets/garage_card.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:road_saver/utils.dart';

class GarageScreen extends StatefulWidget {
  const GarageScreen({super.key});

  @override
  State<GarageScreen> createState() => _GarageScreenState();
}

class _GarageScreenState extends State<GarageScreen> {
  final searchBoxController = TextEditingController();

  List garageList = [];

  bool isDataReceived = false;

  @override
  void initState() {
    super.initState();

    apiGetGarage("Matunga", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text(
            "Garage",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins"),
          ),
        )),

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
                    "H R Mahajani Rd, Matunga East Maharastra, India",
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
                    onChanged: (val) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search nearby garage",
                      hintStyle: TextStyle(
                          color: Color(0xFF8B8B8B),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Poppins"),
                      suffixIcon: Container(
                        width: 81,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: searchBoxController.text.length > 1
                            ? InkWell(
                                onTap: () {
                                  apiGetGarage(
                                      searchBoxController.text, context);
                                },
                                child: Center(
                                    child: Text(
                                  "Search",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                      color: Color.fromARGB(255, 28, 6, 233)),
                                )),
                              )
                            : Container(),
                      ),
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
              isDataReceived
                  ? Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            for (var item in garageList)
                              garageCardWidget(context, item)
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 570,
                      child: Center(
                        child: Image.asset(
                          "sf/img/loader.gif",
                          height: 70,
                        ),
                      ),
                    ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBarWidget(context, 1));
  }

  Future apiGetGarage(String place, context) async {
    final url = Uri.parse(
        "https://vjti-backend.vercel.app/api/v1/accounts/get-garage/?place=$place");

    try {
      print("Garage api called !");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print("resposne code :: ${response.statusCode} ");
        final jsonData = json.decode(response.body);
        print("jsonData :: $jsonData");

        setState(() {
          garageList = jsonData['data'];
          isDataReceived = true;
        });

        // goto home screen
        //   Navigator.pushReplacement(context,
        //       MaterialPageRoute(builder: (context) {
        //     return HomepageScreen();
        //   }));
      } else {
        displaySnackBar(context, false, "Failed to load data!");
      }
    } catch (e) {
      print("Error :: $e");
      displaySnackBar(context, false, "Something went wrong!");
    }
  }
}
