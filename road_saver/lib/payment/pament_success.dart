// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
            height: 300,
            width: 300,
            child: Image.asset(
              "sf/img/ps.gif",
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
