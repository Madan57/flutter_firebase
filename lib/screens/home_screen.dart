import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/add_note.dart';
import 'package:flutter_firebase/screens/edit_note.dart';
import 'package:flutter_firebase/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  User user;

  HomeScreen(this.user);

  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
      body: ListView(
        children: [
          Card(
            color: Colors.teal,
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                title: Text(
                  'Build a new app',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Learn to build a clone of clubhouse application form udemy",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditNoteScreen()));
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddNoteScreen(user)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
