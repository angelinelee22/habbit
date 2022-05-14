import 'package:flutter/material.dart';
import 'package:habbit/model/habbiter.dart';

class HabbitTile extends StatelessWidget {
  final Habbiter? habbiter;
  HabbitTile({this.habbiter});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            elevation: 20.0,
            child: ListTile(
                leading: Icon(Icons.pets),
                title: Text("${habbiter!.first_name} ${habbiter!.last_name}"),
                subtitle: Text('Has goals: ${habbiter!.todos}'))));
  }
}
