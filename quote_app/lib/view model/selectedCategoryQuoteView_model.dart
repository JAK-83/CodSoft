import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:quote_app/app/app.locator.dart';
import 'package:quote_app/model/list_model.dart';
import 'package:quote_app/services/hybirdData.dart';
class selectedCategoryQuoteView_model extends ChangeNotifier{

     ///claa servic of hibird data
     final hibirdDataService=locator<hibirdData>();




    ///useable list veriable of text quotes
  //  List quotesText=[];
  //  List quotesImg=[];
  // List quotesAuther=[];
  List <Quotes> QuotesData=[];
bool isDataThere=true;

  ////scrap web site
  
 selectedCategoryQuoteView_model (){ ///this is init state
    getquotes();
  }

  Future getquotes()async{
    String UrL=  "https://quotefancy.com/${hibirdDataService.main_Category_Url_Name}"; //use widget.main_Category_Url_Name
    Uri uri=Uri.parse(UrL);
    http.Response response=await http.get(uri);
    dom.Document html=dom.Document.html(response.body);

    try{
             final quotesText=html.querySelectorAll(" div > p.quote-p > a").map((element) => element.innerHtml.trim()).toList();
   final quotesImg=html.querySelectorAll(" div > p.quote-p > a").map((element) => element.innerHtml.trim()).toList();
    
    final quotesAuther=html.querySelectorAll(" div > p.author-p > a").map((element) => element.innerHtml.trim()).toList();
 
    
    print(quotesText);
    notifyListeners();
      QuotesData=List.generate(
        quotesText.length,
         (index) =>Quotes(
          autherName: quotesAuther[index],
          quoteImgUrl:quotesImg[index] ,
          quotesText: quotesText[index],
          ) );
          isDataThere=false;
    
    }catch(e){
      print("errrrrrrrrrorororor ${e.toString()}");
    }


  }

 

  //////add to fav Quotes List
  favQuotesList(final Data){
    notifyListeners();
    hibirdDataService.FavQuotesList.add(Data);
  }

  favAuthList(final data){
    notifyListeners();
    hibirdDataService.FavAuthList.add(data);
  }

   //////remove to fav Quotes List
  removefavQuotesList(final Data){
    notifyListeners();
    hibirdDataService.FavQuotesList.remove(Data);
  }

  removefavAuthList(final data){
    notifyListeners();
    hibirdDataService.FavAuthList.remove(data);
  }

////call toast service
 ////toast message
void toast(String msg){
 void showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2), // Adjust the duration as needed
      ),
    );
  }
}

}