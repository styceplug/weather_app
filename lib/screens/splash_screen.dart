import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/routes/routes.dart';
import 'package:weather_app/utils/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
   void initState() {
    initialize();
    super.initState();
  }

  void initialize() async {
    Timer(
      const Duration(seconds: 3),
      () => Get.offAllNamed(AppRoutes.weatherScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: Dimensions.height100 * 2.5,
                width: Dimensions.width100 * 2.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/weather.png'),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height30),
              Text(
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                'What is the Weather for the day??',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.font25,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
