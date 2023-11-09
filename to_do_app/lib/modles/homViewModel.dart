import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:to_do_app/Data%20base/dataBase.dart';
import 'package:to_do_app/componants/alertdialog_create_task.dart';
import 'package:to_do_app/componants/my_use_button.dart';

class homeViewModel extends ChangeNotifier{

   TextEditingController titleController=TextEditingController() ;
    TextEditingController desCriptionController=TextEditingController() ;
    ///update controller
  
  ///intitalize database
  final _mybox=Hive.box("mybox");
  TodoDataBase db=TodoDataBase();
////initState
  void initializeData() {
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
       totalTask=db.toDoList.length;
    } else {
      db.loadData();
       totalTask=db.toDoList.length;
    }
  }

  homeViewModel() {
    initializeData();
  }

  //bool taskcompletcheck=false;
  final drawerKey = GlobalKey<ScaffoldState>();
//  // List toDolist=[
//     ["Title","DelkasjdlkajdslkjalskdjlaskjdlkjlakjsdlKJALskdjLAKSJdlkajsldkjLAKSJdlkAJSdlkajsjdsc",'3:33',false],
//     ["Title","Desc",'3:33',false],
//     ["Title","Desc",'3:33',false],
//   ];

  void  checkBoxChanged(int index,bool? value){
    
      db.toDoList[index][3]= !db.toDoList[index][3];
      notifyListeners();
      
      if(db.toDoList[index][3]==false){
       totalTask+=1;
       notifyListeners();
      }
      else{
      
        totalTask-=1;
        notifyListeners();
      }
   notifyListeners();
    db.update();
    

  }
  /////add new task methos
  void createTask(context){
    String time=DateTime.now().day.toString()+"/"+DateTime.now().month.toString()+"/"+DateTime.now().year.toString() +"  "+       DateTime.now().minute.toString() +":"+DateTime.now().second.toString();
    notifyListeners();
      db.toDoList.add([titleController.text=='' ? "Untitled":titleController.text,desCriptionController.text,time,false]);
    titleController.clear();
    desCriptionController.clear();
    totalTask=db.toDoList.length;
    notifyListeners();
     toast("New Task Created");
    Navigator.pop(context);
    db.update();
  }
  ///////////save new task
  void createNewTask(context){

    showDialog(
      context: context, 
      builder:(context){
        return dilog_box(
          save:()=>createTask(context),
          cancel: (){Navigator.pop(context);
          notifyListeners();},
          titleController: titleController,
          desCriptionController:desCriptionController ,
       
        );
      });
         
  }
////delet function
  void deletFuntion(int index){
notifyListeners();
  db.toDoList.removeAt(index);
  totalTask=db.toDoList.length;
    toast("Task Deleted");

db.update();
  }

////total lent of todo list
int totalTask=0;

//////update method
void updateMethod(context,int index){
showDialog(
                              context: context, 
                              builder: (context){
                                //////alert
                                return    AlertDialog(
      backgroundColor: Colors.amber,
      content: Container(
        height: MediaQuery.sizeOf(context).height*.4,
        decoration: BoxDecoration(
        
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            Text("Update task",style: TextStyle(fontWeight: FontWeight.w600),),
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
              title: "Update Task",
              oontap: (){
                 String timee=DateTime.now().day.toString()+"/"+DateTime.now().month.toString()+"/"+DateTime.now().year.toString() +"  "+       DateTime.now().minute.toString() +":"+DateTime.now().second.toString();
   
notifyListeners();
 db.toDoList[index][0]=titleController.text;
  db.toDoList[index][1]=desCriptionController.text;
  db.toDoList[index][2]=timee;
 


 titleController.clear();
  desCriptionController.clear();
  db.update();
  Navigator.pop(context);
  toast("Task Updated");

              },
            ),

             ////Cancel button
            my_button(
              
              Reang: Colors.blueAccent.withOpacity(.5),
              title: "Cancel",
              oontap: (){
                notifyListeners();
                  titleController.clear();
  desCriptionController.clear();
              
                
                Navigator.pop(context);} ,
            )

          ],
        ),
      ),
      
    );
                             ////////////////////alert end
                              });

}

////toast message
void toast(String msg){
 Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0
    );
}

}