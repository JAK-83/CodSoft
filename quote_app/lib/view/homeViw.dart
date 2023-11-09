import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quote_app/themeData/them_provider.dart';
import 'package:quote_app/view%20model/homeView_model.dart';
import 'package:quote_app/view/selected_category_quote_view.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';
class homeView extends StatefulWidget {
  homeView({Key? key}) : super(key: key);

  @override
  State<homeView> createState() => _homeViewState();
}

class _homeViewState extends State<homeView> {
  
//   /////category linkx header names
//   List <String> quotesCategory=[
//     "motivational-quotes",
//     "inspirational-entrepreneurship-quotes",
//     "positive-quotes",
//     "albert-einstein-quotes", ];
//     /////category containers names
//   List <String> quotesCategoryContainerNames=[
//     "Motivational Quotes",
//     "Inspirational Quotes",
//     "Positive Quotes",
//     "Albert Einstein Quotes", ];
//     /////category containers img cover
//   List <String> quotesCategoryContainerImgs=[
//     "https://images.pexels.com/photos/6005025/pexels-photo-6005025.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "https://images.pexels.com/photos/2255441/pexels-photo-2255441.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "https://images.pexels.com/photos/22221/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "https://cdn.pixabay.com/photo/2023/03/11/20/20/albert-einstein-7845209_1280.jpg",
//     ];
 
 
//  ///dark mode button value
//   bool themee=false;
  
  
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder:()=>homeViewModel(), 
      builder: (context,homeController,child){
        return 
        Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Stack(children: [
              Container(
                height: 50, 
                width: 50, 
               // color: Colors.green,
              ),
              Center(child: Icon(Icons.favorite,size: 30,)),
              Positioned(
                top: 15,
                left: 33,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red
                  ),
                  child: Center(child: Text(homeController.hiberdDtaService.FavQuotesList.length.toString()),),
          ))
            ],),
            onPressed: (){
           homeController.movetoFaveView();
            }
            ),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            CarouselSlider.builder(
              itemCount: homeController.sliderImagesList.length,
              itemBuilder: (context,index,realIndex){
                final urlImages=homeController.sliderImagesList;
                return  //buildimage(urlImages,index);
                      Container(
                margin: EdgeInsets.only(top:10,right:15,left:15,bottom: 20),
                height: MediaQuery.sizeOf(context).height*.25, 
                width: MediaQuery.sizeOf(context).width, 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red,
                  image: DecorationImage(image: NetworkImage(urlImages[index]),fit: BoxFit.cover)
                ),
              );
              },
              options: CarouselOptions(height: 200),
            ),


            ////slieder container
            // Container(
            //     margin: EdgeInsets.only(top:10,right:15,left:15,bottom: 20),
            //     height: MediaQuery.sizeOf(context).height*.25, 
            //     width: MediaQuery.sizeOf(context).width, 
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(15),
            //       color: Colors.red,
            //     ),
            //   ),
             
            ///dark/light theme button & category text
            Padding(
              padding: const EdgeInsets.only(left:10,right:10),
              child: Row(
                children: [
                  Text("Quotes By Category",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20),),
                  Spacer(),
                  homeController.hibirdDataa.themee==false ?
                  Icon(Icons.light_mode) :
                  Icon(Icons.dark_mode),
                  
                 Switch(value: homeController.hibirdDataa.themee, onChanged: (value){
                  setState(() {
                   homeController.hibirdDataa.themee=value;
                   Provider.of<ThemeProvider>(context,listen:false ).toggleTheme();
                  });
                 })
                ],
              ),
            ),    

           ////list view builder
           Expanded(
             child: ListView.builder(
              itemCount: homeController.quotesCategory.length, 
              shrinkWrap: true, 
             // physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return Stack(
                  children: [GestureDetector( 
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>selected_category_quote_view(
                      //   main_Category_Url_Name: quotesCategory[index],
                      //   bgImagurl: quotesCategoryContainerImgs[index],
                      //   categoryName: quotesCategoryContainerNames[index], 
                      // )));
                      homeController.sendData(
                        homeController.quotesCategoryContainerImgs[index], 
                        homeController.quotesCategoryContainerNames[index], 
                        homeController.quotesCategory[index]);
                        homeController.moveToSelectQuoteScreen();
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
                      height: MediaQuery.sizeOf(context).height*.2, 
                      width: MediaQuery.sizeOf(context).width, 
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(image: NetworkImage(homeController.quotesCategoryContainerImgs[index]),fit: BoxFit.cover),
                        color: Colors.green,
                                boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(2, 10,), // Adjust the shadow's offset
                              blurRadius: 4, // Adjust the blur radius
                              spreadRadius: 1, // Adjust the spread radius
                            ),
                          ],
                  
                      ),
                    ),
                  ),
                  ///title texte
                  Positioned(
                    top: 20,
                    left:20,
                    child: Container(
                      padding: EdgeInsets.only(top:10,left: 5),
                      height: MediaQuery.sizeOf(context).height*.1/1.9, 
                      width: MediaQuery.sizeOf(context).width*.6, 
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:homeController.hibirdDataa.themee==false? Colors.blue.withOpacity(.5) :Colors.black.withOpacity(.5)
                      ),
                      child: Text(homeController.quotesCategoryContainerNames[index].toUpperCase(),
                    
                    style: 
                    TextStyle(fontWeight: FontWeight.w600,
                    fontSize: 15),),
                    )
                    ),
                  ],
                );
              }),
           )
        
                  
                  
          ],
        ),
      ),
    );
      });
    
  }
}