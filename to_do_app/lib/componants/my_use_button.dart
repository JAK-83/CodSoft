import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class my_button extends StatefulWidget {
  final String title;
  final VoidCallback oontap;
  final Color Reang;
  my_button({Key? key, required this.title, required this.oontap, required this.Reang}) : super(key: key);

  @override
  State<my_button> createState() => _my_buttonState();
}

class _my_buttonState extends State<my_button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.oontap,
      child: Container(
                   margin: EdgeInsets.only(left:10,top: 10),
                    height: MediaQuery.sizeOf(context).height*.1/1.5, 
                    width: MediaQuery.sizeOf(context).width*.55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: widget.Reang,
                    ),
                    child: Center(child: Text(widget.title),),
                  ),
    );
  }
}