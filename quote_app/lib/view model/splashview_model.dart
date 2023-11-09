import 'package:flutter/cupertino.dart';
import 'package:quote_app/app/app.locator.dart';
import 'package:quote_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';
import 'package:quote_app/app/app.locator.dart';

class splashviewModel extends ChangeNotifier{

  ///call navigation service
   final navigationService=locator<NavigationService>();

Future splashMove()async{
  await Future.delayed(Duration(seconds: 4),(){
   return movetoHomeView();
    
  });
}  

//////move to homeview
movetoHomeView(){
  navigationService.navigateToHomeView();
}

///initState to load/wait to move home view
 
 splashviewModel(){
  splashMove();
 }

}