import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class name_remaining_tesk_text extends StatefulWidget {
  final String RemainingTask;
  name_remaining_tesk_text({Key? key, required this.RemainingTask}) : super(key: key);

  @override
  State<name_remaining_tesk_text> createState() =>
      _name_remaining_tesk_textState();
}

class _name_remaining_tesk_textState extends State<name_remaining_tesk_text> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children:[ 
        Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "To Do",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          ////remaining task text
          Padding(
            padding: const EdgeInsets.only(left: 130),
            child: Text(
              "Remaining tasks",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Color.fromARGB(255, 167, 164, 164)),
            ),
          ),
        ],
      ),
      
      
     
      ]);
 
  }
}
