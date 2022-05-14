import 'package:flutter/material.dart';
import 'package:habbit/model/firebase_user.dart';
import 'package:habbit/model/habbiter.dart';
import 'package:habbit/screens/home/habbit_list.dart';
import 'package:habbit/services/auth.dart';
import 'package:habbit/services/database.dart';
import 'package:habbit/shared/loading.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqlite_api.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  FirebaseUser? _user;
  final _formkey = GlobalKey<FormState>();
  List<String> todos = [
    "Budgeting",
    "School",
    "Workout",
    "Lifestyle",
    "Mindfulness",
    "Travel",
    "Work",
    "Art"
  ];
  List<String>? _todos;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    final _formKey = GlobalKey<FormState>();

    void _showSettingsPanel(BuildContext context) async {
      await showModalBottomSheet(
          isScrollControlled: true, // required for min/max child size
          context: context,
          builder: (ctx) {
            return StreamBuilder<UserTodos>(
              stream: DatabaseService(uid: user.uid).habbiterTodos,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  UserTodos _todos = snapshot.data;
                  return Form(
                      key: _formKey,
                      child: MultiSelectBottomSheet(
                        items: todos.map((e) => MultiSelectItem(e, e)).toList(),
                        initialValue:
                            todos.map((e) => MultiSelectItem(e, e)).toList(),
                        onConfirm: (values) async {
                          if (_formKey.currentState!.validate()) {
                            await DatabaseService(uid: user.uid)
                                .updateTodos(values.cast<String>());
                          }
                        },
                        maxChildSize: 0.8,
                      ));
                } else {
                  return Loading();
                }
              },
            );
          });
    }

    return new Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: Colors.purple,
            actions: [
              TextButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('logout'),
                  onPressed: () async {
                    await _auth.signOut();
                  }),
            ],
          ),
        ),
        backgroundColor: Colors.purple,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Column(
          children: <Widget>[
            Text("Let's work on your habbits.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold)),
            Expanded(
              child: SizedBox(
                height: 200.0,
                child: StreamProvider<List<Habbiter>>.value(
                  initialData: [],
                  value: DatabaseService(uid: '').habbiters,
                  child: HabbitList(),
                ),
              ),
            ),
            TextButton.icon(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
                onPressed: () => _showSettingsPanel(context))
          ],
        ));

    // return StreamProvider<List<Habbiter>>.value(
    //     initialData: [],
    //     value: DatabaseService(uid: '').habbiters,
    //     child: Scaffold(
    //       backgroundColor: Colors.purple,
    //       appBar: AppBar(
    //         title: Text('Habbit'),
    //         backgroundColor: Colors.purple,
    //         elevation: 0.0,
    //         actions: <Widget>[
    //           TextButton.icon(
    //               icon: Icon(Icons.person),
    //               label: Text('logout'),
    //               onPressed: () async {
    //                 await _auth.signOut();
    //               })
    //         ],
    //       ),
    //       body: HabbitList(),
    //     ));
  }
}
