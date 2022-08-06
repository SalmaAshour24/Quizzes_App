import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class signIn extends StatefulWidget {
  const signIn({Key? key}) : super(key: key);

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  var password, email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(children: [
        Container(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 50, left: 20, right: 20, bottom: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                ),
                child: const ListTile(
                  title: Text(
                    "SIGN IN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Mouse Memoirs',
                      fontSize: 20,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                elevation: 30,
                color: Color(0xff245472),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35, top: 35),
              child: Container(
                child: TextFormField(
                  onSaved: (val) {
                    email = val;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return 'Please Enter a valid Email';
                    }
                    return null;
                  },
                  cursorColor: Color(0XFFFFCCFF),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      labelText: 'Enter Email',
                      border: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35, top: 20),
              child: Container(
                child: TextFormField(
                  onSaved: (val) {
                    password = val;
                  },
                  obscureText: true,
                  // obscure tkhalih msh bayn el pass
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  cursorColor: Color(0XFFFFCCFF),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      labelText: 'Enter Password',
                      border: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () async {},
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff245472),
                          shape: RoundedRectangleBorder(
                              // borderRadius: BorderRadius.circular(40),
                              ),
                          textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Mouse Memoirs',
                          )),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          color: Color(0xffffffff),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                'Do not have an account?',
                style: TextStyle(
                  color: Color(0xff245472),
                  fontFamily: 'Mouse Memoirs',
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 70),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff245472),
                      shape: RoundedRectangleBorder(
                          //  borderRadius: BorderRadius.circular(40),
                          ),
                      textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                        //  fontFamily: 'Mouse Memoirs',
                      )),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      color: Color(0xffffffff),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 110.0),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.facebook,
                    size: 60.0,
                    color: Colors.lightBlue,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(
                    FontAwesomeIcons.google,
                    size: 60.0,
                    color: Colors.redAccent,
                  ),
                ],
              ),
            )
          ],
        ))
      ]),
    );
  }
}
