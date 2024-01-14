// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:road_saver/screens/garage_details.dart';
import 'package:road_saver/screens/garage_screen.dart';
import 'package:road_saver/screens/pp_details.dart';
import 'package:road_saver/screens/pretrol_pump_screen.dart';
import 'package:road_saver/screens/puc_center_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: PetrolPumpScreen());
  }
}
