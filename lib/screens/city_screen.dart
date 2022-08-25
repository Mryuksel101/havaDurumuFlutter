import 'package:flutter/material.dart';


import '../utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myController.dispose();
    debugPrint("dispose calisti");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: myController,
                  cursorColor: Colors.teal,
                  cursorHeight: 25.0,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                  decoration: kTextFieldInputDecoration,

                  
                ),
              ),
              FlatButton(
                onPressed: ()  {
                  Navigator.pop(context, myController.text);
                },
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}