import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  CollectionReference users = firestore.collection('users');
                  // await users.add({'name': 'Rahul Agrawal'});
                  await users.doc('flutter123').set({'name': 'Google Flutter'});
                },
                child: Text('Add Data to Firestore'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    CollectionReference users = firestore.collection('users');
                    // QuerySnapshot allResults = await users.get();
                    // allResults.docs.forEach((DocumentSnapshot result) {
                    //   print(result.data());
                    // });
                    DocumentSnapshot result =
                        await users.doc('flutter123').get();
                    print(result.data());

                    // users.doc('flutter123').snapshots().listen((result) {
                    //   print(result.data());
                    // });
                  },
                  child: Text("Read data from firestore")),
              ElevatedButton(
                  onPressed: () async {
                    await firestore
                        .collection('users')
                        .doc('flutter123')
                        .update({'name': 'Flutter Firebase'});
                  },
                  child: Text('update Data in firestore')),
              ElevatedButton(
                  onPressed: () async {
                    await firestore
                        .collection('users')
                        .doc('flutter123')
                        .delete();
                  },
                  child: Text('delete data from firestore'))
            ],
          ),
        ));
  }
}
