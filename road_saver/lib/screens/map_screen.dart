// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print, curly_braces_in_flow_control_structures, unused_element, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class GMapScreen extends StatefulWidget {
  @override
  _GMapScreenState createState() => _GMapScreenState();
}

class _GMapScreenState extends State<GMapScreen> {
  late GoogleMapController mapController;
  late LocationData currentLocation;

  late String formattedAddress;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: AppBar(
      //     title: Text('Gmap'),
      //   ),
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.all(10),
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            compassEnabled: true,
            rotateGesturesEnabled: true,
            trafficEnabled: true,
            onMapCreated: (controller) {
              mapController = controller;
            },
            onTap: (coordinates) {
              print("val :: $coordinates");
              
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(19.075983, 72.877655),
              zoom: 19,
            ),
            myLocationEnabled: true,
          ),
        ],
      ),
    );
  }

  void getLocation() async {
    print("start");
    var location = Location();
    try {
      currentLocation = await location.getLocation();
      print(currentLocation.latitude);
      print(currentLocation.longitude);
    } catch (e) {
      print("Error getting location: $e");
    }

  }


  void getAddressFromLatLng(context, double lat, double lng) async {
    String host = 'https://maps.google.com/maps/api/geocode/json';
    String mapApiKey = "AIzaSyA7mOSN-0l6I0NXgrhs_aOqONnLmRb5D-c";

    final url = '$host?key=$mapApiKey&language=en&latlng=$lat,$lng';

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      setState(() {
        formattedAddress = data["results"][0]["formatted_address"];
        print("response :: $formattedAddress");
      });
    } else {
      print("Error!");
    }
  }
}
