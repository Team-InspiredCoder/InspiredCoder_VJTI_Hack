// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:road_saver/payment/card_details.dart';
import 'package:road_saver/payment/pament_success.dart';
import 'package:road_saver/payment/payment_method.dart';
import 'package:road_saver/screens/display_map.dart';
import 'package:road_saver/screens/garage_details.dart';
import 'package:road_saver/screens/garage_screen.dart';
import 'package:road_saver/screens/pp_details.dart';
import 'package:road_saver/screens/pretrol_pump_screen.dart';
import 'package:road_saver/screens/puc_center_details.dart';
import 'package:road_saver/screens/ratings.dart';

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
        home: PetrolPumpScreen()
        // home: ShowLocationOnMapScreen(lat: 19.0222, log: 72.8561, mapZoom: 19)
        // home: RatingScreen()
        
        );
  }
}

