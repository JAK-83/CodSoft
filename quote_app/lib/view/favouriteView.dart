import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quote_app/view%20model/favouriteView_model.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';

class favouriteView extends StatelessWidget {
  const favouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => favouriteView_Model(),
        builder: (context, favController, child) {
          return Scaffold(
            body: SafeArea(
                child: Column(
              children: [
                ////////heading 
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /////quote icon
                      Container(
                        height: MediaQuery.sizeOf(context).height * .1 / 1.3,
                        width: MediaQuery.sizeOf(context).width * .1,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(favController.FavListData.themee!=true  ?            "assets/i02.png" :"assets/i04.png")),
                          // color: Colors.red
                        ),
                      ),

                      ///app name
                      Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Text(
                          "${favController.FavListData.FavQuotesList.length} Favourite Quotes",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),

                      /////end quote icon
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * .1 / 1.3,
                          width: MediaQuery.sizeOf(context).width * .1,
                          decoration:  BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(favController.FavListData.themee!=true  ?            "assets/i02.png" :"assets/i03.png")),
                            // color: Colors.red
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ///////////////
                /////display fav Quotes
               
                  
                  favController.FavListData.FavQuotesList.isEmpty ?
                  Container(
                    margin: EdgeInsets.only(top: 100),
                  height: MediaQuery.sizeOf(context).height*.3, 
                  width: MediaQuery.sizeOf(context).width*.4, 
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/i05.png")),
                  //  color: Colors.red
                  ),
                  )
                  :
                Expanded(
                  child:
                   ListView.builder(
                      itemCount: favController.FavListData.FavQuotesList.length,
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        // final data = selectedCategoryQuoteViewController .QuotesData[index];
                        return Stack(
                          children: [
                            ////main container
                            Container(
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.all(15),
                              height: MediaQuery.sizeOf(context).height * .2,
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                // image: DecorationImage( image: NetworkImage(data.quoteImgUrl) ),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.red.withOpacity(.4),
                                    Colors.purple
                                  ], // Define gradient colors
                                  begin: Alignment
                                      .topLeft, // Define the start point of the gradient
                                  end: Alignment
                                      .bottomRight, // Define the end point of the gradient
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(
                                      2,
                                      10,
                                    ), // Adjust the shadow's offset
                                    blurRadius: 4, // Adjust the blur radius
                                    spreadRadius: 1, // Adjust the spread radius
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                            
                                  Flexible(
                                    child: Text(
                                      favController
                                          .FavListData.FavQuotesList[index],
                                      style:  GoogleFonts.lato(
                                       textStyle:  TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),),
                                      
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "By : ",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Flexible(
                                        child: Text(
                                          favController
                                              .FavListData.FavAuthList[index],
                                          style: const TextStyle(
                                              //  color: Colors.amberAccent.withOpacity(.5),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                              //////quote icon
                                 Positioned(
                                  top:10,
                                  left:17,
                                   child: Container(
                                                    // margin: EdgeInsets.only(top: 100),
                                                   height: MediaQuery.sizeOf(context).height*.1/2.2, 
                                                   width: MediaQuery.sizeOf(context).width*.1/1.6, 
                                                   decoration: BoxDecoration(
                                                     image: DecorationImage(image: AssetImage("assets/i02.png")),
                                                    // color: Colors.red
                                                   ),
                                                   ),
                                 ),
                            /////share and favourite icons
                            Positioned(
                              top: 130,
                              left: 300,
                              child: GestureDetector(
                                  onTap: () {
                                    ///remove from fav list
                                    favController.deletQuote(index);
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.blue,
                                  )),
                            ),
                          ],
                        );
                      }),
                )
              ],
            )),
          );
        });
  }
}
