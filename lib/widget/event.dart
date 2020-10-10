import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:passable_partmer/config/config.dart';
import 'package:passable_partmer/config/size.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class ScrollWidEvent extends StatefulWidget {
  final double amountEarned;
  final String eventCode;
  final bool isOnline;
  ScrollWidEvent({this.amountEarned,this.eventCode,this.isOnline});
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
      child: FutureBuilder(
        future: FirebaseFirestore.instance.collection(widget.isOnline?'OnlineEvents':'events').doc(widget.eventCode).get(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child:SpinKitPouringHourglass(color: AppColors.primary));
          }
          else
          return Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children:<Widget>[
                CachedNetworkImage(
                  imageUrl: snapshot.data.data()['eventBanner'],
                  width: width/3.5,
                  placeholder: (context, url) => SpinKitFoldingCube(color: AppColors.primary,),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8),
                    child: Column(
                      children: <Widget>[
                        AutoSizeText(snapshot.data.data()['eventName'],maxLines:2,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                        SizedBox(height:10),
                        Text(DateFormat('dd MMM yyyy').format(snapshot.data.data()['eventDateTime'].toDate()).toString(),style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),),
                        SizedBox(height:5),
                        Text(DateFormat('hh:mm a').format(snapshot.data.data()['eventDateTime'].toDate()).toString(),style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),),
                        Expanded(child: Center(child: AutoSizeText('₹ ${NumberFormat.compact().format(widget.amountEarned).toString()}',maxLines:1,style: TextStyle(color: Vx.green400,fontSize: 30,fontWeight: FontWeight.w800),))),
                      ],
                    ),
                  )
                ),
              ]
            ),
          );
        }
      ),
    ).box.color(Vx.gray800).neumorphic(curve: VxCurve.emboss).make();
  }
}