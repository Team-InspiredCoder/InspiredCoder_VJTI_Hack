// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:road_saver/custom_widgets/bottom_navigation.dart';
import 'package:road_saver/custom_widgets/petrol_pump_card.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:road_saver/utils.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class PetrolPumpScreen extends StatefulWidget {
  const PetrolPumpScreen({super.key});

  @override
  State<PetrolPumpScreen> createState() => _PetrolPumpScreenState();
}

class _PetrolPumpScreenState extends State<PetrolPumpScreen> {
  final searchBoxController = TextEditingController();

  List petrolPumpsList = [];

  @override
  void initState() {
    super.initState();

    apiGetPetrolPumps("Matunga", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text(
            "Petrol Pumps",
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
                    onChanged: (val) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search nearby petrol pumps",
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
                                  apiGetPetrolPumps(
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
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      for (var item in petrolPumpsList)
                        petrolPumpCardWidget(context, item)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBarWidget(context, 0));
  }

  Future apiGetPetrolPumps(String place, context) async {
    final url = Uri.parse(
        "https://vjti-backend.vercel.app/api/v1/accounts/indian-oil-data/?location=$place");

    try {
      print("Petrol pumps api called !");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print("resposne code :: ${response.statusCode} ");
        final jsonData = json.decode(response.body);
        print("jsonData :: $jsonData");

        setState(() {
          petrolPumpsList = jsonData['data'];
          //   for
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
