import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backwardsCompatibility: false,
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        actions: [
          TextButton.icon(
            onPressed: () async {
              await AuthService().signOut();
            },
            icon: Icon(Icons.logout),
            label: Text('Logout'),
            style: TextButton.styleFrom(primary: Colors.white),
          )
        ],
      ),
      body: Center(
        child: Text('Welcome to the home screen'),
      ),
    );
  }
}
