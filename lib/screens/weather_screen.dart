import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utils/app_constants.dart';
import 'package:weather_app/utils/dimensions.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // api key
  final _weatherService = WeatherServices('a7bb9badfa8a4a701b64456554ab12f2');
  Weather? _weather;

  //fetch weather
  _fetchWeather() async {
    //get the current city
    String cityName = await _weatherService.getCurrentCity();

    //get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }
    //any errors
    catch (e) {
      print(e);
    }
  }

  //weather animations
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloudy.json';

      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/raining.json';

      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  //init state
  @override
  void initState() {
    super.initState();
    //fetch weather on startup
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: _weather == null
            ? const CircularProgressIndicator() // Show loading indicator while weather is null
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display city name
                  Column(
                    children: [
                      const Icon(Icons.location_on,color: Colors.white),
                      Text(
                        _weather!.cityName,
                        style: TextStyle(
                            fontSize: Dimensions.font22,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  SizedBox(height: Dimensions.height50*3),

                  //animation
                  Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),


                  SizedBox(height: Dimensions.height50*3),

                  // Display temperature
                  Text('${_weather!.temperature.round()}°C',
                    style: TextStyle(
                      letterSpacing: Dimensions.width10/Dimensions.width10,
                      fontFamily: 'Poppins',
                        fontSize: Dimensions.font28,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),),

                  // weather condition
                  Text(_weather!.mainCondition,
                    style: TextStyle(
                      letterSpacing: Dimensions.width5/Dimensions.width5,
                        fontSize: Dimensions.font18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),),
                ],
              ),
      ),
    );
  }
}
