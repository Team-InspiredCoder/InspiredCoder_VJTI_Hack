// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:road_saver/screens/pp_details.dart';

Widget petrolPumpCardWidget(context, Map item) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PetrolPumpDetailsScreen(item: item);
      }));
    },
    child: Column(
      children: [
        Container(
          height: 140,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color(0xFFF6F6F6), borderRadius: BorderRadius.circular(7)),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.asset("sf/img/petrol_pump.png")),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // pp name

                  Text(
                    getShortName(item['alternate_name']),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),

                  // ratings
                  SizedBox(height: 3),
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
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: Color(0xFFFF725E),
                      ),
                      SizedBox(width: 5),
                      Text(
                        getShortAddress(item['address']),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 55,
                          decoration: BoxDecoration(
                              color: Color(0xFF3751A6),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            "Petrol",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                        SizedBox(width: 5),
                        Container(
                          height: 30,
                          width: 55,
                          decoration: BoxDecoration(
                              color: Color(0xFF058A07),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            "CNG",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                        SizedBox(width: 5),
                        Container(
                          height: 30,
                          width: 55,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(110, 217, 0, 0),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            "Diesel",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                        SizedBox(width: 5)
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10)
      ],
    ),
  );
}

String getShortName(String name) {
  if (name.length >= 16) {
    return name.substring(0, 16) + "...";
  } else {
    return name;
  }
}

String getShortAddress(String addr) {
  if (addr.length >= 28) {
    return addr.substring(0, 28) + "...";
  } else {
    return addr;
  }
}
