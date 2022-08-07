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

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  Future<void> _opennews(String link)async
  {
    var urlLink=link;
    if(await canLaunch(urlLink)){
      await launch(urlLink);
  }else{
      await launch(urlLink);
    }
  }
  api API=api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: background ,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left:20,right:20,top:50,bottom: 20),
            child: Text("country news",
            style: TextStyle(color: textcolor,fontSize: large),),
          ),
          Container(
            height: 70,
            padding: EdgeInsets.all(1),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buttoncategory(text: "All",buttoncolor: textcolor,category:"general" ),
                  buttoncategory(text: "science",buttoncolor: color2,category:"science" ),
                  buttoncategory(text: "Health",buttoncolor: color6,category:"health" ),
                  buttoncategory(text: "Business",buttoncolor: color3,category:"business" ),
                  buttoncategory(text: "Sport",buttoncolor: color4,category:"sport" ),
                  buttoncategory(text: "music",buttoncolor: color5,category:"music" ),

                ],
              ),

            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left:20,right:20,top:20,bottom: 0),
            child: Text("All news",
              style: TextStyle(color: textcolor,fontSize: medium),),
          ),
Expanded(
  child: Container(
    padding: EdgeInsets.all(10),
    child: FutureBuilder(
      future: API.fetcharticle() ,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
if(snapshot.data==null){
return Center(
  child: CircularProgressIndicator(
    backgroundColor: color1,
  ),
);
}else{
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

                      child:Card(
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
}
        },

    ),
  )
),
        ],
      ),

    );
  }
}
