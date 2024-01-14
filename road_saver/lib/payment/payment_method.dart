// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:road_saver/payment/card_details.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool isContinueButtonDisabled = true;
  int selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Select Payment Method",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins"),
          ),
        ),
      ),

      // body
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  if (isContinueButtonDisabled) {
                    selectedMethod = 1;
                    isContinueButtonDisabled = false;
                  } else {
                    selectedMethod = 0;
                    isContinueButtonDisabled = true;
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: selectedMethod == 1
                      ? Color.fromARGB(193, 255, 113, 94)
                      : Colors.transparent,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0xFFF6F6F6)),
                      child: Image.asset("sf/img/card.png"),
                    ),
                    SizedBox(width: 25),
                    Text(
                      "Credit/Debit card",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins"),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 18),
            InkWell(
              onTap: () {
                setState(() {
                  if (isContinueButtonDisabled) {
                    selectedMethod = 2;
                    isContinueButtonDisabled = false;
                  } else {
                    selectedMethod = 0;
                    isContinueButtonDisabled = true;
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: selectedMethod == 2
                      ? Color.fromARGB(193, 255, 113, 94)
                      : Colors.transparent,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0xFFF6F6F6)),
                      child: Image.asset("sf/img/bank.png"),
                    ),
                    SizedBox(width: 25),
                    Text(
                      "Bank Account",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins"),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 18),
            InkWell(
              onTap: () {
                setState(() {
                  if (isContinueButtonDisabled) {
                    selectedMethod = 3;
                    isContinueButtonDisabled = false;
                  } else {
                    selectedMethod = 0;
                    isContinueButtonDisabled = true;
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: selectedMethod == 3
                      ? Color.fromARGB(193, 255, 113, 94)
                      : Colors.transparent,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0xFFF6F6F6)),
                      child: Image.asset("sf/img/gpay.png"),
                    ),
                    SizedBox(width: 25),
                    Text(
                      "UPI App",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins"),
                    )
                  ],
                ),
              ),
            ),

            // SizedBox(height: 30)
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 110,
        color: Color(0xFFF6F6F6),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.currency_rupee_rounded,
                      size: 30,
                    ),
                    Text(
                      "10",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    if (!isContinueButtonDisabled) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CardDetailsScreen();
                      }));
                    }
                  },
                  child: Container(
                    height: 55,
                    width: 145,
                    decoration: BoxDecoration(
                        color: isContinueButtonDisabled
                            ? Color.fromARGB(126, 255, 113, 94)
                            : Color(0xFFFF725E),
                        borderRadius: BorderRadius.circular(9)),
                    child: Center(
                        child: Text(
                      "Continue",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
            SizedBox(height: 14)
          ],
        ),
      ),
    );
  }
}
