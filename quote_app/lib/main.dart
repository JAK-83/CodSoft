import 'package:flutter/material.dart';
import 'package:quote_app/app/app.locator.dart';
import 'package:quote_app/app/app.router.dart';
import 'package:quote_app/themeData/them_provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:provider/provider.dart';

void main() async {
  await setupLocator();
  runApp(
    ChangeNotifierProvider(
      create: (context)=>ThemeProvider(),
      child: quote_app(),
    )
    
    
    );
}

class quote_app extends StatelessWidget {
  const quote_app({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      ///this for manually from app
      theme: Provider.of<ThemeProvider>(context).themeData,
   

     ///theme this for when user change mode from mobile settings
     //  theme: lightMode,
    //  darkTheme: darkMode,
     
      
    ///navigation
       navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
