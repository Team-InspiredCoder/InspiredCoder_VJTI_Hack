// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';


void displaySnackBar(context, bool success, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
    backgroundColor: success ? Colors.green : Colors.red,
    content: Text(text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    action: SnackBarAction(
      textColor: Colors.white,
      label: 'Ok',
      onPressed: () {
        print("OK");
      },
    ),
  ));
}
