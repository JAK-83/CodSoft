import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:quote_app/componant/selectedQuoteViwComponant.dart/cercularbar.dart';
import 'package:quote_app/model/list_model.dart';
import 'package:quote_app/view%20model/selectedCategoryQuoteView_model.dart';

import 'package:stacked/stacked.dart';

class selected_category_quote_view extends StatefulWidget {
  // final String bgImagurl;
  // final String categoryName;
  // final String main_Category_Url_Name;
  selected_category_quote_view({
    Key? key,
  }) : super(key: key);

  @override
  State<selected_category_quote_view> createState() =>
      _selected_category_quote_viewState();
}

class _selected_category_quote_viewState
    extends State<selected_category_quote_view> {
 @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => selectedCategoryQuoteView_model(),
        builder: (context, selectedCategoryQuoteViewController, child) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ////slieder container
                  Container(
                    margin: EdgeInsets.only(
                        top: 10, right: 15, left: 15, bottom: 20),
                    height: MediaQuery.sizeOf(context).height * .25,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                        image: DecorationImage(
                            image: NetworkImage(
                                selectedCategoryQuoteViewController
                                    .hibirdDataService.bgImagurl),
                            fit: BoxFit.cover)),
                  ),
                  

                  ///text
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "${selectedCategoryQuoteViewController.hibirdDataService.categoryName} Category",
                      style: TextStyle(

                          ///use ${widget.categoryName}
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  ////list view builder
                  selectedCategoryQuoteViewController.isDataThere != true
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: selectedCategoryQuoteViewController
                                  .QuotesData.length,
                              shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final data = selectedCategoryQuoteViewController
                                    .QuotesData[index];
                                return Stack(
                                  children: [
                                    ////main container
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      margin: EdgeInsets.all(15),
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              .2,
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
                                            blurRadius:
                                                4, // Adjust the blur radius
                                            spreadRadius:
                                                1, // Adjust the spread radius
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              data.quotesText,/////////@@@@@@
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Auther : ",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  data.autherName,/////////@@@@@@
                                                  style: const TextStyle(
                                                      //  color: Colors.amberAccent.withOpacity(.5),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    /////share and favourite icons
                                    Positioned(
                                      top: 130,
                                      left: 270,
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                ///add to fav list
                                                if( selectedCategoryQuoteViewController.hibirdDataService.FavQuotesList.contains(data.quotesText)){
                                               selectedCategoryQuoteViewController
                                                    .removefavQuotesList(
                                                        data.quotesText);
                                                selectedCategoryQuoteViewController
                                                    .removefavAuthList(
                                                        data.autherName);
                                                }
                                               else{ selectedCategoryQuoteViewController
                                                    .favQuotesList(
                                                        data.quotesText);
                                                selectedCategoryQuoteViewController
                                                    .favAuthList(
                                                        data.autherName);
                                             selectedCategoryQuoteViewController.toast("Quote Add As Favourite");           
                                                        }
                                              },
                                              child: Icon(
                                                Icons.favorite,
                                                color:   
                                                selectedCategoryQuoteViewController.hibirdDataService.FavQuotesList.contains(data.quotesText)?
                                                  Colors.red
                                                  :
                                                   Colors.white,
                                              )),
                                       const   SizedBox(
                                            width: 10,
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                // Call the share function when the share icon is tapped
                                                // Call the share function when the share icon is tapped
                                                final shareText =
                                                    data.quotesText;

                                                Share.text('Share Quote',
                                                    shareText, 'text/plain');
                                              },
                                              child:const Icon(
                                                Icons.share,
                                                color: Colors.blue,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        )
                      : const circularBar(),
                ],
              ),
            ),
          );
        });
  }
}
