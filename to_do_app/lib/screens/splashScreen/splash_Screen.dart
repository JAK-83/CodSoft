import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/screens/hom%20screen/home_screen.dart';
class splash_screen extends StatefulWidget {
  splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {

   @override
   void initState(){

    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home_screen()));
    });
   }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            ///icon
              Center(
                child: Container(
                  height: MediaQuery.sizeOf(context).height*.18, 
                  width: MediaQuery.sizeOf(context).width*.5,
                  decoration: BoxDecoration(
                   // color: Colors.red,
                    image: DecorationImage(image: AssetImage("assets/i02.png"))
                  ),
                ),
              ),

              Center(
                child: Text('UpTodo', style: TextStyle(fontSize: 24),),
              )
        ],
      ),
    );
  }
}