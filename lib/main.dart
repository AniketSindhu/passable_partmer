import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:passable_partmer/config/config.dart';
import 'package:passable_partmer/screens/Homepage.dart';
import 'package:passable_partmer/screens/login.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
            backgroundColor: Vx.gray800,
            body:Center(child: Text('Error',style: TextStyle(color: Colors.red,fontSize: 20,),),)
        ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: Vx.gray800,
              primaryColorBrightness: Brightness.dark
            ),
            home: Login()
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          home: Scaffold(
            backgroundColor: Vx.gray800,
            body:Center(child: CircularProgressIndicator(),)
          ),
        );
      },
    );
  }
}

