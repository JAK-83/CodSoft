import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/componants/my_use_button.dart';
class dilog_box extends StatelessWidget {
  final titleController;
  final desCriptionController;
  final VoidCallback save;
  final VoidCallback cancel;
  const dilog_box({Key? key, required this.titleController,required this.desCriptionController, required this.save, required this.cancel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
   
    return AlertDialog(
      backgroundColor: Colors.amber,
      content: Container(
        height: MediaQuery.sizeOf(context).height*.4,
       // width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
         // color: Colors.amber,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            Text("Add new task",style: TextStyle(fontWeight: FontWeight.w600),),
             SizedBox(height: 10,),
            ////title textfield
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                labelText: "Title"),
            ),
            SizedBox(height: 10,),
             ////des textfield
            TextFormField(
              controller: desCriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                labelText: "Des....."),
            ),

SizedBox(height: 20,),
            ////buttons
            my_button(
              Reang: Colors.blueAccent.withOpacity(.5),
              title: "Add Task",
              oontap: save,
            ),

             ////Cancel button
            my_button(
              
              Reang: Colors.blueAccent.withOpacity(.5),
              title: "Cancel",
              oontap: cancel ,
            )

          ],
        ),
      ),
      
    );
  }
}