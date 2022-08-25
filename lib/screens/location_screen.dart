import 'package:flutter/material.dart';
import 'package:weather/screens/city_screen.dart';
import 'package:weather/services/weather.dart';

import 'package:weather/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  var erisData;

  LocationScreen({required this.erisData,});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  String? getWeatherIcon;
  String? getMessage;

  double? temp;
  int? condition;
  String? cityName;
  @override
  void initState() {
    super.initState();
    esitleme(widget.erisData);
   
  
    
  }

  void esitleme (var erisDataVer){
    
    if(erisDataVer !=null){
      temp = erisDataVer["main"]["temp"];
      condition = erisDataVer["weather"][0]["id"];
      cityName = erisDataVer["name"];

      
      getWeatherIcon = weatherModel.getWeatherIcon(condition!);
      getMessage = weatherModel.getMessage(temp!);
    }

    else{
      getMessage = "Lütfen konumu açın veya internet bağlantınızı kontrol edin";
      getWeatherIcon = '😎';
      cityName = "Kafam karıştı";
      temp = 31;
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var data = await weatherModel.getLocationWeather();
                      esitleme(data);
                      setState(() {
                        
                      });
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      String cityName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityScreen(),)
                      );
                      debugPrint(cityName);

                      var eris = await weatherModel.getLocationWeatherCity(cityName);

                      esitleme(eris);
                      setState(() {
                        
                      });
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      temp!.toStringAsFixed(1),
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$getWeatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "${getMessage!} in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}