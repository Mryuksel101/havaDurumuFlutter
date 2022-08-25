import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
class NetworkHelper{
  final String url;
  NetworkHelper(this.url);

  Future getData() async{
    try{
      http.Response response = await http.get(Uri.parse("$url"));

       if(response.statusCode==200){
      debugPrint("Get Data calisti. Baglanti sagligi 200");
    
      return jsonDecode(response.body);

    }
    else{
      debugPrint(response.statusCode.toString());
    }
    }
    catch(e){
      debugPrint(e.toString());
    }
   
  } 
}