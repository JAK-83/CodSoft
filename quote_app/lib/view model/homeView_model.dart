import 'package:flutter/cupertino.dart';
import 'package:quote_app/app/app.locator.dart';
import 'package:quote_app/app/app.router.dart';
import 'package:quote_app/services/hybirdData.dart';
import 'package:quote_app/services/hybirdData.dart';

import 'package:stacked_services/stacked_services.dart';

class homeViewModel extends ChangeNotifier{
   
   /// call service
   final hibirdDataa=locator<hibirdData>();


List <String> quotesCategory=[
    "motivational-quotes",
    "inspirational-entrepreneurship-quotes",
    "positive-quotes",
    "albert-einstein-quotes", ];
    /////category containers names
  List <String> quotesCategoryContainerNames=[
    "Motivational Quotes",
    "Inspirational Quotes",
    "Positive Quotes",
    "Albert Einstein Quotes", ];
    /////category containers img cover
  List <String> quotesCategoryContainerImgs=[
    "https://images.pexels.com/photos/6005025/pexels-photo-6005025.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/2255441/pexels-photo-2255441.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/22221/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://cdn.pixabay.com/photo/2023/03/11/20/20/albert-einstein-7845209_1280.jpg",
    ];

   /////slider images list
   List sliderImagesList=[
    "https://quotefancy.com/media/wallpaper/800x450/18846-Anonymous-Quote-Work-hard-in-silence-let-your-success-be-your.jpg",
    "https://quotefancy.com/media/wallpaper/800x450/18771-Thomas-Jefferson-Quote-If-you-want-something-you-have-never-had.jpg",
    "https://quotefancy.com/media/wallpaper/800x450/17003-Neale-Donald-Walsch-Quote-Life-begins-at-the-end-of-your-comfort.jpg",
    "https://quotefancy.com/media/wallpaper/3840x2160/17459-Walter-Bagehot-Quote-The-greatest-pleasure-in-life-is-doing-what.jpg",
    "https://quotefancy.com/media/wallpaper/3840x2160/17451-Walter-Bagehot-Quote-The-greatest-pleasure-in-life-is-doing-what.jpg",
    "https://quotefancy.com/media/wallpaper/3840x2160/17452-Walter-Bagehot-Quote-The-greatest-pleasure-in-life-is-doing-what.jpg",
    "https://quotefancy.com/media/wallpaper/3840x2160/6361750-Elizabeth-Kenny-Quote-It-s-better-to-be-a-lion-for-a-day-than-a.jpg",
    "https://quotefancy.com/media/wallpaper/3840x2160/7090-Theodore-Roosevelt-Quote-Believe-you-can-and-you-re-halfway-there.jpg",
    "https://quotefancy.com/media/wallpaper/3840x2160/45661-William-G-T-Shedd-Quote-A-ship-is-safe-in-harbor-but-that-s-not.jpg",
    "https://quotefancy.com/media/wallpaper/3840x2160/45654-C-JoyBell-C-Quote-Don-t-be-afraid-of-your-fears-They-re-not-there.jpg",
    "https://quotefancy.com/media/wallpaper/3840x2160/1700312-Robin-S-Sharma-Quote-Your-I-CAN-is-more-important-than-your-IQ.jpg",
    "https://quotefancy.com/media/wallpaper/3840x2160/15256-Robin-S-Sharma-Quote-Be-the-CEO-of-your-life.jpg",
    "https://quotefancy.com/media/wallpaper/3840x2160/5118-Lao-Tzu-Quote-Knowledge-is-a-treasure-but-practice-is-the-key-to.jpg",
   "https://quotefancy.com/media/wallpaper/3840x2160/4674077-Lao-Tzu-Quote-If-you-are-depressed-you-are-living-in-the-past-If.jpg",
   "https://quotefancy.com/media/wallpaper/3840x2160/4168-Lao-Tzu-Quote-The-journey-of-a-thousand-miles-begins-with-a-single.jpg",
   
   ] ;

 ///dark mode button value
  //bool themee=false;

////send data to select quote screen
    final hiberdDtaService=locator<hibirdData>();
      sendData(String bgImagurl,String categoryName,String main_Category_Url_Name ){
        notifyListeners();
        hiberdDtaService.bgImagurl=bgImagurl;
        hiberdDtaService.categoryName=categoryName;
        hiberdDtaService.main_Category_Url_Name=main_Category_Url_Name;
      }

 
///////move to next view/ select quote view
 final navigationService=locator<NavigationService>();///call navigation sevices
  
  moveToSelectQuoteScreen()async{
   await 
    navigationService.navigateToSelected_category_quote_view();
    notifyListeners();
  }


 ///move to fav view
  movetoFaveView()async{
   await 
    navigationService.navigateToFavouriteView();
    notifyListeners();
  }
}