import 'package:habbit/model/task.dart';

class Habbiter {
  final String? first_name;
  final String? last_name;
  final List<String>? todos;
  // final List<Task>? tasks;
  final int? level;
  final bool? first_login;

  Habbiter(
      {this.first_name,
      this.last_name,
      this.todos,
      this.level,
      this.first_login});
}
