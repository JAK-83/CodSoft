import 'package:flutter/cupertino.dart';
import 'package:quote_app/app/app.locator.dart';
import 'package:quote_app/app/app.router.dart';
import 'package:quote_app/services/hybirdData.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';

class favouriteView_Model extends ChangeNotifier{

  ////cal  navigatio service
  final navigationService=locator<NavigationService>();


///////call services and use FavList
  final FavListData=locator<hibirdData>();

  //////delet quote from fav list
  deletQuote(index){
    FavListData.FavAuthList.removeAt(index);
    FavListData.FavQuotesList.removeAt(index);
    notifyListeners();
  } 
 

}