import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quote_app/view%20model/splashview_model.dart';
import 'package:stacked/stacked.dart';
class splashView extends StatelessWidget {
  const splashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder:()=> splashviewModel(), 
      builder: (context,splashController,child){
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 250,left:30,right:30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /////quote icon
                  Container(
                  
                    height: MediaQuery.sizeOf(context).height*.1/1.3,
                    width: MediaQuery.sizeOf(context).width*.1, 
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/i02.png")),
                     // color: Colors.red
                    ),
                  ),
                  ///app name
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text("WisdomWaves",style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600
                    ),),
                  ),

                  /////end quote icon
                   Align(
                    alignment: Alignment.topRight,
                     child: Container(
                                     
                      height: MediaQuery.sizeOf(context).height*.1/1.3,
                      width: MediaQuery.sizeOf(context).width*.1, 
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/i01.png")),
                       // color: Colors.red
                      ),
                                     ),
                   ),
                      
                ],
              ),
            ),
          ),
        );
      });
  }
}