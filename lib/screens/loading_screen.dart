
import 'package:flutter/material.dart';
import 'package:weather/screens/location_screen.dart';
import 'package:weather/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

 
  
  
  @override
  void initState(){
    // TODO: implement initState
    super.initState() ;
    debugPrint("init state calisti");
    getLocationData();


  }

  void getLocationData() async{
    WeatherModel weatherModel = WeatherModel();
    var wheatherData = await weatherModel.getLocationWeather();
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocationScreen(
          erisData:wheatherData,
        ),
      ),
    );

    debugPrint("şu an hangi sayfadayız la");
    // https://api.openweathermap.org/data/2.5/weather?lat=37.0434469&lon=31.7910922&appid=00d82f21c6c0274b7e8ad7dd6cbe445f
  } //

  /*
  void getData() async {
    final temp = data["main"]["temp"];
    final id = data["weather"][0]["id"];
    final name = data["name"];

    print("name: $name");
    print("id: $id");
    print("temp: $temp");
  }
  */
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: SpinKitPouringHourGlassRefined(
          color: Colors.blue.shade700,
          size: 120,
        )
    );
  

  }
}