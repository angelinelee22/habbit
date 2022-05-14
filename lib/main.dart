import 'package:flutter/material.dart';

import 'package:habbit/model/firebase_user.dart';
import 'package:habbit/screens/home/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:habbit/services/auth.dart';
import 'package:habbit/shared/constants.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser?>.value(
      catchError: (_, __) {},
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        title: 'Habbit',
        theme: ThemeData(
          primaryColor: purpleThemeConst,
        ),
        home: Wrapper(),
      ),
    );
  }
}
