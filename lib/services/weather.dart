import 'package:flutter/foundation.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';
const apiKey = '00d82f21c6c0274b7e8ad7dd6cbe445f';
class WeatherModel {
  double? latitude;
  double? longitude;
  
  Future<dynamic>getLocationWeatherCity(String cityName) async{
    debugPrint("bana $cityName geldi abi");
    NetworkHelper networkHelper = NetworkHelper("https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric");
    var wheatherData = await networkHelper.getData();
    return wheatherData;
  }
 
  Future <dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
    debugPrint("getLocation calisti");
    latitude = location.latitude;
    longitude = location.longitude;
    debugPrint("lati: ${latitude.toString()}");
    debugPrint("long: ${longitude.toString()}");
    
    NetworkHelper networkHelper = NetworkHelper("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric");
    var wheatherData = await networkHelper.getData();
    return wheatherData;

  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(double temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } 
    else if (temp > 18) {
      return 'Time for shorts and 👕';
    } 
    else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    }
    else {
      return 'Bring a 🧥 just in case';
    }
  }
}