// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print, curly_braces_in_flow_control_structures, unused_element, no_leading_underscores_for_local_identifiers, prefer_collection_literals

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ShowLocationOnMapScreen extends StatefulWidget {
  final lat;
  final log;
  final mapZoom;

  const ShowLocationOnMapScreen(
      {super.key,
      required double this.lat,
      required double this.log,
      required double this.mapZoom});

  @override
  State<ShowLocationOnMapScreen> createState() =>
      _ShowLocationOnMapScreenState();
}

class _ShowLocationOnMapScreenState extends State<ShowLocationOnMapScreen> {
  late GoogleMapController mapController;
  late LocationData currentLocation;

  late String formattedAddress;

  bool displayMyLocationButton = false;

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
            mapType: MapType.satellite,
            myLocationButtonEnabled: displayMyLocationButton,
            onMapCreated: (controller) {
              mapController = controller;
            },
            onTap: (coordinates) {
              print("val :: $coordinates");
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.lat, widget.log),
              zoom: widget.mapZoom ?? 19,
            ),
            myLocationEnabled: true,
            markers: Set<Marker>.of([
              Marker(
                markerId: MarkerId("Fuel"),
                position: LatLng(widget.lat, widget.log),
                infoWindow: InfoWindow(
                  title: 'Fuel',
                  snippet: 'Petrol Pump Here!',
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 55, left: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFFF725E)),
                  child: Center(
                      child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  )),
                ),
              ),
            ),
          )
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
