import 'package:get/get.dart';
import 'package:weather_app/screens/splash_screen.dart';
import 'package:weather_app/screens/weather_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash-screen';
  static const String weatherScreen = '/weather-screen';


  static final routes = [
    GetPage(
      name: splashScreen,
      page: () {
        return const SplashScreen() ;
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: weatherScreen,
      page: () {
        return const WeatherScreen();
      },
      transition: Transition.fadeIn,
    ),

  ];
}
