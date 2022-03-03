import 'package:flutter/material.dart';
import 'package:habbit_senior_project/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(24.0),
            color: Color(0x00FFFF),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskCardWidget(),
              ],
            ),
          ),
      ),
    );
  }
}
