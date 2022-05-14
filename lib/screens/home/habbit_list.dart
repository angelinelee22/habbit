import 'package:flutter/material.dart';
import 'package:habbit/model/habbiter.dart';
import 'package:habbit/screens/home/habbit_tile.dart';
import 'package:provider/provider.dart';

class HabbitList extends StatefulWidget {
  const HabbitList({Key? key}) : super(key: key);

  @override
  State<HabbitList> createState() => _HabbitListState();
}

class _HabbitListState extends State<HabbitList> {
  @override
  Widget build(BuildContext context) {
    final habbiters = Provider.of<List<Habbiter>?>(context);

    return ListView.builder(
      itemCount: habbiters!.length,
      itemBuilder: (context, index) {
        return HabbitTile(habbiter: habbiters[index]);
      },
    );
  }
}
