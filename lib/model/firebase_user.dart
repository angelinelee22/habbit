class FirebaseUser {
  final String? uid;
  FirebaseUser({this.uid});
}

class UserTodos {
  final String? uid;
  final List<String>? todos;

  UserTodos({this.uid, this.todos});
}
