// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:road_saver/app_config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:road_saver/authentication/register.dart';
import 'package:road_saver/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isLoginButtonDisabled = false;

  late Map<String, dynamic> bodyData;
  String error = "Something went wrong!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      // body
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 31),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              "Welcome Back!",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "Welcome back to our streamlined \nRailway Concession app",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.normal,
                  fontSize: 18),
            ),

            SizedBox(height: 25),

            // email input
            Text(
              "Email",
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
                  controller: emailController,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.left,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter your email",
                    hintStyle: TextStyle(
                        color: Color(0xFF8B8B8B),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Poppins"),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.email_outlined,
                        size: 20,
                        color: Color(0xFF8B8B8B),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),

            // password input
            Text(
              "Password",
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
                  controller: passwordController,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.left,
                  cursorColor: Colors.black,
                  obscureText: isPasswordVisible ? false : true,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter your password",
                    hintStyle: TextStyle(
                        color: Color(0xFF8B8B8B),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Poppins"),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.lock_outline,
                        size: 20,
                        color: Color(0xFF8B8B8B),
                      ),
                    ),
                    // suffixIcon: Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: getWidth(4.2)),
                    //   child: Icon(
                    //     isPasswordVisible ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                    //     size: getHeight(2.7),
                    //     color: Color(0xFF8B8B8B),
                    //   ),
                    // ), isPasswordVisible = !isPasswordVisible,
                    suffixIcon: IconButton(
                      onPressed: () => {
                        setState(() => isPasswordVisible = !isPasswordVisible),
                      },
                      icon: Icon(isPasswordVisible
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded),
                      iconSize: 20,
                      color: Color(0xFF8B8B8B),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 45),
            InkWell(
              onTap: () => {
                if (!isLoginButtonDisabled)
                  {
                    bodyData = {
                      "email": emailController.text,
                      "password": passwordController.text
                    },
                    apiLogin(bodyData, context),
                    print("\nokay"),
                  }
                else
                  {print("Login Button is Disabled")},
                setState(() => isLoginButtonDisabled = !isLoginButtonDisabled),
              },
              child: Container(
                height: 57,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: isLoginButtonDisabled
                        ? Color.fromARGB(156, 255, 113, 94)
                        : Color(0xFFFF725E),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),

            Expanded(child: SizedBox(height: 1)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Poppins",
                      color: Color(0xFF686868)),
                ),
                SizedBox(width: 5),
                InkWell(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return RegisterScreen();
                  })),
                  child: Text(
                    "Register here",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Poppins",
                        color: Color(0xFFFF725E)),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  // login api
  Future apiLogin(Map<String, dynamic> bodyData, context) async {
    final url = Uri.parse("$API_DOMAIN/accounts/login");

    try {
      print("Login api called !");
      final response = await http.post(url, body: bodyData);

      if (response.statusCode == 200) {
        print("resposne code :: ${response.statusCode} ");
        final jsonData = json.decode(response.body);
        print("jsonData :: $jsonData");

        if (jsonData['success']) {
          await localStorage.setItem("userData", jsonData['data']);
          await localStorage.setItem("authToken", jsonData['authToken']);

          // goto home screen
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return LoginScreen();
          }));

          displaySnackBar(context, true, jsonData['message']);
        } else {
          displaySnackBar(context, false, jsonData['message']);
        }
      } else {
        print("resposne code :: ${response.statusCode} ");
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("Error :: $error");
      displaySnackBar(context, false, error);
    } finally {
      setState(() => isLoginButtonDisabled = !isLoginButtonDisabled);
    }
  }

}
