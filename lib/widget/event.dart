import 'package:flutter/material.dart';
import 'package:passable_partmer/config/size.dart';
import 'package:velocity_x/velocity_x.dart';

class ScrollWidEvent extends StatefulWidget {
  double amountEarned;
  String eventCode;
  ScrollWidEvent({this.amountEarned,this.eventCode});
  @override
  _ScrollWidEventState createState() => _ScrollWidEventState();
}

class _ScrollWidEventState extends State<ScrollWidEvent> {
  @override
  Widget build(BuildContext context) {
    double width= SizeConfig.getWidth(context);
    double height= SizeConfig.getWidth(context);
    return Container(
      width: width*0.8,
      color: Vx.gray800,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children:<Widget>[
            
          ]
        ),
      ),
    ).box.color(Vx.gray800).neumorphic(curve: VxCurve.emboss).make();
  }
}