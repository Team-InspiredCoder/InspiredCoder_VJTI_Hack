// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:road_saver/screens/garage_screen.dart';
import 'package:road_saver/screens/pretrol_pumo_screen.dart';
import 'package:road_saver/screens/puc_center_screen.dart';

Widget CustomBottomNavigationBarWidget(context, activeTab) {
  return BottomNavigationBar(
    selectedFontSize: 14,
    selectedLabelStyle: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, fontFamily: "Poppins"),
    backgroundColor: Color.fromARGB(255, 243, 242, 242),
    type: BottomNavigationBarType.fixed,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.garage),
        label: 'Garage',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.local_gas_station),
        label: 'Fuel',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'P.U.C.',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_rounded),
        label: 'Profile',
      ),
    ],
    currentIndex: activeTab,
    selectedItemColor: Color(0xFFFF725E),
    onTap: (index) => {
      if (index == 0)
        {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return GarageScreen();
          }))
        }
      else if (index == 1)
        {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return PetrolPumpScreen();
          }))
        }
      else if (index == 2)
        {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return PUCScreen();
          }))
        }
      else if (index == 3)
        {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return PetrolPumpScreen();
          }))
        }
    },
  );
}
