import "package:flutter/material.dart";
import "views/home/home_screen.dart";
import 'package:get/get.dart';
void main()async{
 await WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    home:HomeScreen(),
  ));
}