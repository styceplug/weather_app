import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/splash_screen.dart';
import 'package:weather_app/screens/weather_screen.dart';

import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),

      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.splashScreen,
    );
  }
}

