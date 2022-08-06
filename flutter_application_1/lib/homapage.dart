import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFC),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 90,
          ),
          Image.asset(
            'img/logo.png',
            height: 130,
            scale: 3.5,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              // color: Colors.white,

              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  //spreadRadius: 8,
                  blurRadius: 20,
                  offset: Offset(4, 8), // changes position of shadow
                ),
              ],
            ),
            child: Image.asset(
              'img/immj.jpg',
              height: 150,
              scale: 3.5,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              // color: Colors.white,

              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  //spreadRadius: 8,
                  blurRadius: 9,
                  offset: Offset(4, 8), // changes position of shadow
                ),
              ],
            ),
            child: Text(
              'Welcome..!',
              textAlign: TextAlign.center,
              style:

                  // DefaultTextStyle.of(context)
                  //.style
                  // .apply(fontSizeFactor: 0.7, color: Color(0xff245472))
                  TextStyle(
                      fontSize: 30,
                      color: Color(0xff245472),
                      fontWeight: FontWeight.w900),
            ),
          ),
          Text(
            'Create an account and access thousand of stuffs',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff3279A6),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            decoration: BoxDecoration(
              // color: Colors.white,

              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  //spreadRadius: 8,
                  blurRadius: 20,
                  offset: Offset(4, 8), // changes position of shadow
                ),
              ],
            ),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff3279A6),
                    textStyle: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.normal,
                    )),
                child: Text(
                  'Getting Started',
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.white,

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    //spreadRadius: 8,
                    blurRadius: 20,
                    offset: Offset(4, 8), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text(
                    'Already having an account? ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff3279A6),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Log in ',
                        style: TextStyle(
                            //          DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
                            fontSize: 17,
                            color: Color(0xff245472),
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/signin');
                          }),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
