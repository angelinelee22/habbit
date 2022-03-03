import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Text("Welcome to habbit!")
    );
  }
}