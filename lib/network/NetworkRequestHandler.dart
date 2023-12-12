import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class NetworkRequestHandler{





 GetRequestHandler(url)async{
    var req=await http.get(Uri.parse(url),
    headers: <String,String>{
      "Content-Type":"application/json"
    }
    );

    print(req.statusCode);
    if(req.statusCode==200){
      return json.decode(req.body);
    }
    else if(req.statusCode==500){
      throw Exception("Server Errror");
    }


    return json.decode(req.body);
  }


}