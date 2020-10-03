import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userNameController= TextEditingController();
  TextEditingController passController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.gray800,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/logo.png'),),
          Text("Partner"),
          SizedBox(height:20),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: userNameController,
              decoration: InputDecoration(
                focusedBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(15)
                ),
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(15)
                ),
                enabledBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(15)
                ),
                disabledBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(15)
                ),
                labelText: 'Username',
                labelStyle: GoogleFonts.roboto(color:Colors.white,fontSize:18)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              obscureText: true,
              controller: userNameController,
              decoration: InputDecoration(
                focusedBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(15)
                ),
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(15)
                ),
                enabledBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(15)
                ),
                disabledBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(15)
                ),
                labelText: 'Password',
                labelStyle: GoogleFonts.roboto(color:Colors.white,fontSize:18)
              ),
            ),
          ),
          SizedBox(height:20),
          RaisedButton(
            onPressed: (){},
            child: Text("Login",style: GoogleFonts.roboto(fontSize:20,fontWeight:FontWeight.bold,color:Colors.white,)),
            color: Colors.teal,
            splashColor: Colors.yellow,
          )
        ],
      ),
    );
  }
}