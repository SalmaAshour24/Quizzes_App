import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';
import 'package:task4/const.dart';
import 'package:task4/design/buttoncategory.dart';
import 'package:task4/service/API.dart';
import 'package:task4/service/function.dart';
import '../const.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:clipboard/clipboard.dart';

import '../const.dart';
class category1 extends StatefulWidget {
  String cat;
  category1(this.cat);

  @override
  _category1State createState() => _category1State();
}

class _category1State extends State<category1> {
api API =api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background ,
      body:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:60.0,left: 15),
            child: Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon:Icon(Icons.arrow_back_ios,color: textcolor)),
                Container(
                  alignment: Alignment.center,
                 padding: EdgeInsets.only(left:20),
                  child:Text(
                    "${widget.cat} category news",
                    style: TextStyle(color: textcolor, fontSize: medium),

                  ),

                ),
    ],
    ),
          ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: FutureBuilder(
                    future: API.fetcharticlebycategory("${widget.cat}"),
builder: (BuildContext context, AsyncSnapshot snapshot){
                      if(snapshot.hasData){
return ListView.builder(
  itemCount:snapshot.data.length ,
    itemBuilder: (context,i){
    return GestureDetector(
      onTap: (){
            function.opennews("${snapshot.data[i].url}");
      },
      child:Card (
            color: color2 ,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Card(
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Image.network(
                          ( snapshot.data[i].urlToImage==null)?"https://media.istockphoto.com/vectors/error-page-or-file-not-found-icon-vector-id924949200?b=1&k=6&m=924949200&s=170667a&w=0&h=I0d_x3Ff9oP-XbR4BHpnmu-27ya60XPDE6BO6t4dqa4=":snapshot.data[i].urlToImage,
                          fit: BoxFit.fitWidth,),
                      ),
                      Text("${snapshot.data[i].title}",style: TextStyle(fontSize: small,fontWeight: FontWeight.w600,color: textcolor),textAlign: TextAlign.center,),
                      Padding(
                        padding: const EdgeInsets.only(left: 260,bottom: 2),

                        child: 
                        Card(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: color2,

                            ),

                          child: IconButton(onPressed: (){
                            function.share('${snapshot.data[i].url}',
                            );

                          },
                              icon: Icon(Icons.share)),
                        ),
                        ),
                      )
                    ],
                  ),
                ),

              ),
            ),
      ),
    );
    });
                      }else{
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: color1,
                          ),
                        );
                      }
} ,
                  )
                  ),
                ),

            ],


      ),

    );
  }
}
