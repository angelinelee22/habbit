import 'package:flutter/material.dart';
import 'package:habbit/scopedmodel/todo_list_model.dart';
import 'package:habbit/screens/home/bottom_navbar.dart';
import 'package:habbit/screens/home/home_page.dart';

import 'package:habbit/model/firebase_user.dart';
import 'package:habbit/screens/authentication/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either Home or Auth widget
    final user = Provider.of<FirebaseUser?>(context);
    var app = ScopedModel<TodoListModel>(
      model: TodoListModel(),
      child: MaterialApp(
        title: 'HABBIT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w400),
            subtitle1: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w500),
            bodyText1: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Hind',
            ),
          ),
        ),
        home: MyHomePage(title: 'HABBIT'),
      ),
    );

    if (user == null) {
      return Authenticate();
    } else {
      // return BottomNavBar();
      // return Home();
      return ScopedModel<TodoListModel>(
        model: TodoListModel(),
        child: app,
      );
    }
  }
}
