import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habbit/model/firebase_user.dart';
import 'package:habbit/model/habbiter.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference habbitCollection =
      FirebaseFirestore.instance.collection('habbiters');

  Future updateUserData(String first_name, String last_name, List<String> todos,
      int level, bool first_login) async {
    return await habbitCollection.doc(uid).set({
      'first_name': first_name,
      'last_name': last_name,
      'todos': todos,
      'level': level,
      'first_login': first_login
    });
  }

  Future updateUserLogin(bool first_login) async {
    return await habbitCollection.doc(uid).set({
      'first_login': first_login,
    });
  }

  Future updateTodos(List<String> todos) async {
    return await habbitCollection.doc(uid).set({
      'todos': todos,
    });
  }

  // brew list from snapshot
  List<Habbiter> _habbitListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Habbiter(
        first_name: doc.get('first_name') ?? '',
        last_name: doc.get('last_name') ?? '',
        todos: doc.get('todos').cast<String>() ?? [],
        level: doc.get('level') ?? 0,
      );
    }).toList();
  }

  // userData from snapshot
  UserTodos _userTodosFromSnapshot(DocumentSnapshot snapshot) {
    return UserTodos(uid: uid, todos: snapshot.get('todos').cast<String>());
  }

  // get data stream
  Stream<List<Habbiter>> get habbiters {
    return habbitCollection.snapshots().map(_habbitListFromSnapshot);
  }

  Stream<UserTodos> get habbiterTodos {
    return habbitCollection.doc(uid).snapshots().map(_userTodosFromSnapshot);
  }
}
