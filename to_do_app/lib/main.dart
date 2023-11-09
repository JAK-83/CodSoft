import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/screens/hom%20screen/home_screen.dart';
import 'screens/splashScreen/splash_Screen.dart';

void main()async {
  
  /// intit the hiv
   await Hive.initFlutter();
   ///open box
   var box = await Hive.openBox("myBox");


  runApp(to_do_app());
}
class to_do_app extends StatefulWidget {
  to_do_app({Key? key}) : super(key: key);

  @override
  State<to_do_app> createState() => _to_do_appState();
}
 
class _to_do_appState extends State<to_do_app> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
debugShowCheckedModeBanner: false,
      home:splash_screen(),
      // home_screen(),
    );
  }
}