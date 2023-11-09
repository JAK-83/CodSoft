import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/componants/home%20screen%20componants/data_show_container.dart';
import 'package:to_do_app/componants/home%20screen%20componants/name_remaining_task_text.dart';
import 'package:to_do_app/componants/home%20screen%20componants/nothingToDo_container.dart';
import 'package:to_do_app/componants/re_use_button.dart';
import 'package:stacked/stacked.dart';
import 'package:to_do_app/modles/homViewModel.dart';

class home_screen extends StatefulWidget {
  home_screen({Key? key}) : super(key: key);
  

  @override
  State<home_screen> createState() => _home_screenState();
}


class _home_screenState extends State<home_screen> {
  
  @override
  Widget build(BuildContext context) {
    print("line 20");
    return ViewModelBuilder<homeViewModel>.reactive(
      
        viewModelBuilder: () => homeViewModel(),
        builder: (context, homeController, child) {
          print("line 28");
          return Scaffold(
            
              body: Stack(
            children: [
               //////task
      Positioned(
        top: 80,
        left: 290,
        child: Text(
            homeController.totalTask.toString(),
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
                ),
          ),
      ),
              ////main column
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    name_remaining_tesk_text(
                      RemainingTask: homeController.totalTask.toString(),
                    ),
                   

                    const Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text(
                        "Ongoing Task",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color.fromARGB(255, 189, 186, 186)),
                      ),
                    ),
                    /////tasks list
                    Expanded(
                      child:
                      homeController.db.toDoList.length ==0 ?
                      nothing_to_do_container()
                      :
                       ListView.builder(
                        shrinkWrap: true,
                        //physics: NeverScrollableScrollPhysics(),
                        itemCount: homeController.db.toDoList.length,
                        itemBuilder: (BuildContext Context, index) {
                          return GestureDetector(
                           
                            onTap: () {
                               print("line66666666");
                              homeController.titleController.text =
                                  homeController.db.toDoList[index][0];
                              homeController.desCriptionController.text =
                                  homeController.db.toDoList[index][1];
                              homeController.updateMethod(context, index);

                                
                            },
                            child: data_show_container(
                              teskCompleted: homeController.db.toDoList[index] [3],
                               
                              

                              onchanged: (value) =>
                                  homeController.checkBoxChanged(index, value),
                              title: homeController.db.toDoList[index][0],
                              description: homeController.db.toDoList[index][1],
                              time: homeController.db.toDoList[index][2],
                              deletFuntion: (context) =>
                                  homeController.deletFuntion(index),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 670,
                left: 80,
                right: 80,
                child: Re_use_button(
                  titile: "Add new task",
                  height: MediaQuery.sizeOf(context).height * .1 / 1.5,
                  width: MediaQuery.sizeOf(context).width * .5,
                  oontap: () {
                    homeController.createNewTask(context);
                  },
                ),
              ),
            ],
          ));
        });
  }
}
