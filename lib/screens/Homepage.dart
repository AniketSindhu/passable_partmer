import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passable_partmer/config/config.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.gray800,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 45, 12, 40),
                child: Row(
                  children: [
                    IconButton(icon: Icon(Icons.menu), onPressed: (){},color: Colors.green[400],iconSize: 30,splashColor: Colors.yellow[400],),
                    SizedBox(width:20),
                    "Partner Dashboard".text.extraBold.size(30).color(Vx.gray300).center.make(),
                  ],
                ),
              ),
              Center(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                    "₹ 22.03".text.center.size(45).bold.color(Vx.white).make(),
                    SizedBox(height:5),
                    "Amount to be paid".text.center.size(18).semiBold.color(Vx.green400).make(),
                  ],
                )
                 .box.gray800.roundedFull.alignCenter.width(280).height(280).neumorphic(curve: VxCurve.convex,elevation: 20).make(),
              ),
              SizedBox(height:30),
              "Total Earning: ₹ 202.03".text.center.size(18).semiBold.color(Vx.yellow400).make(),
            ],
          ),
        ],
      ),
    );
  }
}