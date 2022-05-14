import 'package:flutter/material.dart';
import 'package:habbit/model/firebase_user.dart';
import 'package:habbit/model/habbiter.dart';
import 'package:habbit/screens/home/habbit_list.dart';
import 'package:habbit/services/auth.dart';
import 'package:habbit/services/database.dart';
import 'package:habbit/shared/loading.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
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

  final AuthService _auth = AuthService();

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
                        // maxChildSize: 0.8,
                      ));
                } else {
                  return Loading();
                }
              },
            );
          });
    }

    return new Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            leading: Icon(
              Icons.arrow_back,
            ),
            backgroundColor: Colors.purple,
            centerTitle: true,
            title:
                Text("Profile", style: TextStyle(fontWeight: FontWeight.w100)),
            elevation: 0.0,
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
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                // The containers in the background
                new Column(
                  children: <Widget>[
                    new Container(
                      height: 200.0,
                      color: Colors.purple,
                    ),
                    new Container(
                        height: 400.0,
                        child: Column(children: [
                          Expanded(
                            child: SizedBox(
                              height: 100.0,
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
                        ])),
                  ],
                ),
                // The card widget with top padding,
                // incase if you wanted bottom padding to work,
                // set the `alignment` of container to Alignment.bottomCenter
                new Container(
                  alignment: Alignment.topCenter,
                  padding:
                      new EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
                  child: new Container(
                    height: 360.0,
                    width: 100.0,
                    child: new CircleAvatar(
                        backgroundColor: Colors.purple[100],
                        child: const Text("TU",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    30.0)) //TODO: get first letter of names
                        ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
