import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passable_partmer/config/config.dart';
import 'package:passable_partmer/methods/getUser.dart';
import 'package:passable_partmer/methods/logout.dart';
import 'package:passable_partmer/screens/login.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String userName;
  bool loading=true;
  void getuserId()async{
    userName= await getUser();
    setState(() {
      loading=false;
    });
  }
  @override
  void initState(){
    super.initState();
    getuserId();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Container(
          color: Colors.grey[800],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Container(),
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage('assets/logo.png'))),
              ),
              ListTile(
                title: Text('Aniket Sindhu',style: TextStyle(fontSize: 25,color: Colors.white),),
                subtitle: Text('8076819963@paytm',style: TextStyle(fontSize: 16,color: Colors.tealAccent)),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app,size: 40,color: Colors.red,),
                title: Text('Logout',style: TextStyle(fontSize: 16,color: Colors.red)),
                onTap: () {
                  logout();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Vx.gray800,
      body: Stack(
        children: [
          loading==false?StreamBuilder(
            stream: FirebaseFirestore.instance.collection("partners").doc(userName).snapshots(),
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return Dialog(
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
                ));
              }
              else
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 45, 12, 40),
                    child: Row(
                      children: [
                        IconButton(icon: Icon(Icons.menu), onPressed: ()=>_scaffoldKey.currentState.openDrawer(),color: Colors.green[400],iconSize: 30,splashColor: Colors.yellow[400],),
                        SizedBox(width:20),
                        "Partner Dashboard".text.extraBold.size(30).color(Vx.gray300).center.make(),
                      ],
                    ),
                  ),
                  Center(
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        "₹ ${NumberFormat.compact().format(snapshot.data.data()['amount_to_be_paid_total'])}".text.center.size(45).bold.color(Vx.white).make(),
                        SizedBox(height:5),
                        "Amount to be paid".text.center.size(18).semiBold.color(Vx.green400).make(),
                      ],
                    )
                     .box.gray800.roundedFull.alignCenter.width(280).height(280).neumorphic(curve: VxCurve.convex,elevation: 20).make(),
                  ),
                  SizedBox(height:30),
                  "Total Earning: ₹ ${NumberFormat.compact().format(snapshot.data.data()['amount_total'])}".text.center.size(18).semiBold.color(Vx.yellow400).make(),
                ],
              );
            }
          ):Container(),
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