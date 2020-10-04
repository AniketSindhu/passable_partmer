import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passable_partmer/config/config.dart';
import 'package:passable_partmer/methods/loginMethod.dart';
import 'package:passable_partmer/screens/Homepage.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userNameController= TextEditingController();
  TextEditingController passController= TextEditingController();
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.gray800,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.asset('assets/logo.png',width: MediaQuery.of(context).size.width/2,),),
              Text("Partner",style: GoogleFonts.roboto(fontSize:24,fontWeight:FontWeight.bold,color:Colors.white,)),
              SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: userNameController,
                  style: GoogleFonts.roboto(color:Colors.white,fontSize:20),
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
                  controller: passController,
                  style: GoogleFonts.roboto(color:Colors.white,fontSize:18),
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
                onPressed: ()async{
                  if(passController.text==null||passController.text==''||userNameController.text==null||userNameController.text==''){
                    Fluttertoast.showToast(msg: 'Login Failed check credentials carefully!',backgroundColor:Colors.red,textColor:Colors.white,gravity: ToastGravity.TOP);
                  }
                  else{
                    setState(() {
                      loading=true;
                    });
                    await loginPartner(userNameController.text, passController.text).then((value){
                      if(value){
                        Fluttertoast.showToast(msg: 'Partner loged in',backgroundColor:Colors.green,textColor:Colors.white,gravity: ToastGravity.TOP);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return HomePage();}));
                        loading=false;
                      }
                      else{
                        setState(() {
                          loading=false;
                        });
                        Fluttertoast.showToast(msg: 'Login Failed check credentials carefully!',backgroundColor:Colors.red,textColor:Colors.white,gravity: ToastGravity.TOP);
                      }
                    });
                  }
                },
                child: Text("Login",style: GoogleFonts.roboto(fontSize:20,fontWeight:FontWeight.bold,color:Colors.white,)),
                color: Colors.teal,
                splashColor: Colors.yellow,
              )
            ],
          ),
          loading==true?Dialog(
              backgroundColor: AppColors.primary,
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20,),
                  new SpinKitFoldingCube(color:Colors.teal),
                  SizedBox(height: 10,),
                  new Text("Loading",style: TextStyle(color:Colors.white),),
                  SizedBox(height: 20,),
                ],
            )):Container()
        ],
      ),
    );
  }
}