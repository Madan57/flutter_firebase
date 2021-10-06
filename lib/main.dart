import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/home_screen.dart';
// import 'package:flutter_firebase/screens/home_screen.dart';
import 'package:flutter_firebase/screens/register_screen.dart';
import 'package:flutter_firebase/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Firebase',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder(
            stream: AuthService().firebaseAuth.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomeScreen();
              }
              return RegisterScreen();
            }));
  }
}
