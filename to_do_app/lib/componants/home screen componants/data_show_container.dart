import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class data_show_container extends StatefulWidget {
  final String title;
  final String description;
  final String time;
  Function(BuildContext)? deletFuntion;

  final bool teskCompleted;
  Function(bool?)? onchanged;
  data_show_container({
    Key? key,
    required this.title,
    required this.description,
    required this.time,
    required this.deletFuntion,
    required this.onchanged,
    required this.teskCompleted,
  }) : super(key: key);

  @override
  State<data_show_container> createState() => _data_show_containerState();
}

class _data_show_containerState extends State<data_show_container> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
            icon: Icons.delete,
            backgroundColor: Colors.red,
            onPressed: widget.deletFuntion),
      ]),
      child: Stack(children: [
       
      
            
             //////data shoe contsainer
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 15),
          height: MediaQuery.sizeOf(context).height * .15,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              boxShadow: [
          BoxShadow(
            color:  widget.teskCompleted?  Colors.green  :Colors.red  , // Color of the shadow
            spreadRadius: 2, // Spread radius
            blurRadius: 3, // Blur radius
            offset: Offset(0, 3), // Changes the position of the shadow
          ),
        ],
              color: Color.fromARGB(255, 235, 234, 234),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              widget.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: widget.teskCompleted
                      ? const Color.fromARGB(255, 158, 156, 156)
                      : Colors.black,
                  decoration: widget.teskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none
                  // color: Color.fromARGB(255, 189, 186, 186)
                  ),
            ),
           const   SizedBox(
                height: 20,
              ),
        
              ///Description text
              Text(
                widget.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: widget.teskCompleted
                        ? const Color.fromARGB(255, 158, 156, 156)
                        : Colors.black,
                    decoration: widget.teskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none
                    // color: Color.fromARGB(255, 189, 186, 186)
                    ),
              ),
        
              ///start and End Time
          const    Spacer(),
              Row(
                children: [
               const   Spacer(),
                  Text(
                    widget.time,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: widget.teskCompleted
                            ? const Color.fromARGB(255, 158, 156, 156)
                            : Colors.black,
                        decoration: widget.teskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none
                        // color: Color.fromARGB(255, 189, 186, 186)
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),




        //////time left container

        Align(
            alignment: Alignment.topRight,
            child: Checkbox(
              activeColor: Colors.black, 
                value: widget.teskCompleted, onChanged: widget.onchanged)),

                /////active or compliet task container
               Positioned(
                left: 180,
                top: 3,
                 child: Container(
                 // margin: EdgeInsets.only(left: 20),
                        height: MediaQuery.sizeOf(context).height*.1/2.8, 
                        width: MediaQuery.sizeOf(context).width*.3/1, 
                        decoration: BoxDecoration(
                          color:  widget.teskCompleted ? Colors.green :         Colors.red,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(child: 
                        Text(widget.teskCompleted?"Task Completed":"Active Task",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                        ),),),
                      ),
               ),
      ]),
    );
  }
}
