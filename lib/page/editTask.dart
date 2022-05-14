import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:habbit/scopedmodel/todo_list_model.dart';
import 'package:habbit/model/task.dart';

class EditTaskScreen extends StatefulWidget {
  final String taskId;
  final String taskName;
  final Color color;

  EditTaskScreen({
    required this.taskId,
    required this.taskName,
    required this.color,
  });

  @override
  State<StatefulWidget> createState() {
    return _EditCardScreenState();
  }
}

class _EditCardScreenState extends State<EditTaskScreen> {
  late String taskName;
  late Color taskColor;
  late IconData taskIcon;

  final btnSaveTitle = "Save Changes";

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    taskName = widget.taskName;
    taskColor = Colors.purple;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<TodoListModel>(
      builder: (BuildContext context, Widget? child, TodoListModel model) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'Edit Category',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black26,
            ),
            brightness: Brightness.light,
            backgroundColor: Colors.white,
          ),
          body: Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(
              horizontal: 36.0,
              vertical: 36.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories help you group related tasks!',
                  style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                Container(
                  height: 16.0,
                ),
                TextFormField(
                  initialValue: taskName,
                  onChanged: (text) {
                    setState(
                      () => taskName = text,
                    );
                  },
                  cursorColor: taskColor,
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Topic',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      )),
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 36.0),
                ),
                Container(
                  height: 26.0,
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Builder(
            builder: (BuildContext context) {
              return SingleChildScrollView(
                  child: FloatingActionButton.extended(
                heroTag: 'fab_new_card',
                icon: Icon(Icons.save),
                backgroundColor: taskColor,
                label: Text(btnSaveTitle),
                onPressed: () {
                  if (taskName.isEmpty) {
                    final snackBar = SnackBar(
                      content: Text('Enter a valid task name.'),
                      backgroundColor: taskColor,
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                  } else {
                    model.updateTask(
                      Task(
                        taskName,
                        id: widget.taskId,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
              ));
            },
          ),
        );
      },
    );
  }
}
