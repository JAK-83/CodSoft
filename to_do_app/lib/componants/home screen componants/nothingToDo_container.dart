import 'package:flutter/cupertino.dart';
class nothing_to_do_container extends StatelessWidget {
  const nothing_to_do_container({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                        height: MediaQuery.sizeOf(context).height*.2, 
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                         // color: Colors.amber,
                          //image: DecorationImage(image: AssetImage("assets/i010.png",))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 150),
                          child: Center(child: Column(
                            children: [
                              SizedBox(
                                height: 100, 
                                width: 100,
                                child: Image.asset("assets/i011.png")),
                                SizedBox(height: 10,),
                                Text("Nothing To Do",style: TextStyle(fontWeight: FontWeight.w600),),
                            ],
                          )),
                        ),
                      );
  }
}