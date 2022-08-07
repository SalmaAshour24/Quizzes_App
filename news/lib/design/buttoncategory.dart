import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task4/screenview/categoryscreen.dart';

import '../const.dart';
class buttoncategory extends StatelessWidget {
String? text;
  String? category;
Color? buttoncolor;
buttoncategory({this.text,this.category,this.buttoncolor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: RaisedButton(
          onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>category1("$category")));
            print("$category");
          },
      child: Text(
"$category",
      style: TextStyle(color: white,fontSize: small1),

      ),
        color: buttoncolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23),
        ),
      ),
    );
  }
}
