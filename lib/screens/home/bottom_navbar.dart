import 'package:flutter/material.dart';
import 'package:habbit/scopedmodel/todo_list_model.dart';
import 'package:habbit/screens/home/account.dart';
import 'package:habbit/screens/home/home.dart';
import 'package:habbit/screens/home/home_page.dart';
import 'package:scoped_model/scoped_model.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    ScopedModel<TodoListModel>(
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
    ),
    // Home(),
    Account(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Tasks',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.pets),
          //   label: 'Habbit',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }
}
