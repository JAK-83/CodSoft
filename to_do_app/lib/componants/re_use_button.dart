import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Re_use_button extends StatefulWidget {
  final String titile;
  final VoidCallback oontap;
  final double height;
  final double width;
  Re_use_button({Key? key, required this.titile, required this.oontap, required this.height, required this.width}) : super(key: key);

  @override
  State<Re_use_button> createState() => _Re_use_buttonState();
}

class _Re_use_buttonState extends State<Re_use_button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.oontap,
      child: Container(
        height: widget.height,//MediaQuery.sizeOf(context).height * .1 / 1.5,
        width: widget.width,//MediaQuery.sizeOf(context).width * .5,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              //end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(.9),
                Colors.blueAccent.withOpacity(.5)
              ]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(
          widget.titile,
          style: TextStyle(
              fontSize: 17,
              // color: Colors.white,
              fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
