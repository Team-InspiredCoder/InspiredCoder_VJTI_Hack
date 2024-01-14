// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:road_saver/utils.dart';

class CardDetailsScreen extends StatefulWidget {
  const CardDetailsScreen({super.key});

  @override
  State<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  final nameController = TextEditingController();
  final cardNoController = TextEditingController();
  final cvvController = TextEditingController();
  final expYearController = TextEditingController();

  bool isPaymentButtonDisabled = true;

  late Map<String, dynamic> bodyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Card Details",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, fontFamily: "Poppins"),
        )),
      ),

      // body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // name input
            Text(
              "Name on Card",
              style: TextStyle(fontFamily: "Poppins", fontSize: 14),
            ),
            SizedBox(height: 5),
            Container(
              height: 57,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xFF8B8B8B)),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: TextField(
                  controller: nameController,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.left,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (val) {
                    formCheck();
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter the name on card",
                    hintStyle: TextStyle(
                        color: Color(0xFF8B8B8B),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Poppins"),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.person_rounded,
                        size: 20,
                        color: Color(0xFF8B8B8B),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // card no input
            Text(
              "Card No",
              style: TextStyle(fontFamily: "Poppins", fontSize: 14),
            ),
            SizedBox(height: 5),
            Container(
              height: 57,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xFF8B8B8B)),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: TextField(
                  controller: cardNoController,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.left,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (val) {
                    formCheck();
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter the card no",
                    hintStyle: TextStyle(
                        color: Color(0xFF8B8B8B),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Poppins"),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.credit_card,
                        size: 20,
                        color: Color(0xFF8B8B8B),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // expiry date input
            Text(
              "Expiry year",
              style: TextStyle(fontFamily: "Poppins", fontSize: 14),
            ),
            SizedBox(height: 5),
            Container(
              height: 57,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xFF8B8B8B)),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: TextField(
                  controller: expYearController,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.left,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (val) {
                    formCheck();
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter expiry year",
                    hintStyle: TextStyle(
                        color: Color(0xFF8B8B8B),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Poppins"),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.calendar_month_rounded,
                        size: 20,
                        color: Color(0xFF8B8B8B),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // cvv input
            Text(
              "CCV No",
              style: TextStyle(fontFamily: "Poppins", fontSize: 14),
            ),
            SizedBox(height: 5),
            Container(
              height: 57,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xFF8B8B8B)),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: TextField(
                  controller: cvvController,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.left,
                  cursorColor: Colors.black,
                  obscureText: true,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (val) {
                    formCheck();
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter the cvv no",
                    hintStyle: TextStyle(
                        color: Color(0xFF8B8B8B),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Poppins"),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.password_outlined,
                        size: 20,
                        color: Color(0xFF8B8B8B),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            Expanded(child: SizedBox(height: 1)),

            InkWell(
              onTap: () => {
                if (!isPaymentButtonDisabled)
                  {
                    bodyData = {
                      "card_no": cardNoController.text,
                      "exp_month": "12",
                      "exp_year": expYearController.text,
                      "cvv_no": cvvController.text,
                      "ptype": "card"
                    },
                    apiPaymentMethod(bodyData, context)
                  }
              },
              child: Container(
                height: 57,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: isPaymentButtonDisabled
                        ? Color.fromARGB(130, 255, 113, 94)
                        : Color(0xFFFF725E),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "Pay ₹10",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  void formCheck() {
    if (nameController.text.length >= 5 &&
        cardNoController.text.length == 16 &&
        expYearController.text.isNotEmpty &&
        cvvController.text.length == 3) {
      setState(() {
        isPaymentButtonDisabled = false;
      });
    } else {
      setState(() {
        isPaymentButtonDisabled = true;
      });
    }
  }

  Future apiPaymentMethod(Map<String, dynamic> bodyData, context) async {
    final url =
        Uri.parse("https://vjti-backend.vercel.app/api/v1/accounts/methods/");

    try {
      print("Payment api called !");
      final response = await http.post(url, body: bodyData);

      if (response.statusCode == 200) {
        print("resposne code :: ${response.statusCode} ");
        final jsonData = json.decode(response.body);
        print("jsonData :: $jsonData");

        setState(() {});

        // goto home screen
        //   Navigator.pushReplacement(context,
        //       MaterialPageRoute(builder: (context) {
        //     return HomepageScreen();
        //   }));

        Map<String, dynamic> paymentBody = {
          "payment_type": "one-time-payment",
          "payment_method_id": 1,
          "amount": 10
        };

        apiPayment(paymentBody, context);
      } else {
        displaySnackBar(context, false, "Failed to load data!");
      }
    } catch (e) {
      print("Error :: $e");
      displaySnackBar(context, false, "Something went wrong!");
    }
  }

  Future apiPayment(Map<String, dynamic> bodyData, context) async {
    final url =
        Uri.parse("https://vjti-backend.vercel.app/api/v1/accounts/pay/");

    try {
      print("Payment api called !");
      final response = await http.post(url, body: bodyData);

      if (response.statusCode == 200) {
        print("resposne code :: ${response.statusCode} ");
        final jsonData = json.decode(response.body);
        print("jsonData :: $jsonData");

        setState(() {});

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
