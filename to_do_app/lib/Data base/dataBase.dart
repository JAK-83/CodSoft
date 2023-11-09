

import 'package:hive/hive.dart';

class TodoDataBase{
  List toDoList=[];

  ///reference our boc
  
  final _myBox=Hive.box("mybox");



  ////createinitial data\ if data is not created 
   void createInitialData(){
    toDoList=[
      ["initial Title","initial Des","00:00",false],
      ["initial Title2","initial Des2","00:00",false],
    ];
   }

   /////load data base
   void loadData(){
    toDoList=_myBox.get("TODOLIST");

   }

   ////update the Database
   void update(){
    _myBox.put('TODOLIST',toDoList);
   }
  
}