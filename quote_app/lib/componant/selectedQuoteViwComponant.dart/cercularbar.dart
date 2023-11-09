import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class circularBar extends StatelessWidget {
  const circularBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
                          padding: const EdgeInsets.only(top: 150),
                          child: Center(
                              child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 10,
                                  ))),
                        );
  }
}