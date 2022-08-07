import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
//import 'package:quiz/Model.dart/questions_model.dart';

class homePage extends StatefulWidget {
  //const homePage({Key? key}) : super(key: key);
  //final List options;

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  final CountDownController _controller = CountDownController();
  List<String> options = ['Google', 'Apple', 'Facebook', 'Microsoft'];

  List<String> Questions = [
    "Flutter is an open-source UI software development kit created by ______",
    "When google release Flutter.",
    "A memory location that holds a single letter or number.",
    "What command do you use to output data to the screen?"
  ];

  //get options => null;

  @override
  Widget build(BuildContext context) {
    void _displayErrorMotionToast() {
      MotionToast(
        icon: Icons.error,
        secondaryColor: Color(0xff8c0606),
        backgroundType: BackgroundType.lighter,
        primaryColor: Color(0xff8c0606),
        //the Duration of the toast animation by default it's 1.5 seconds
        title: const Text(
          'Time out!!!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        description: const Text('You must be done!'),

        animationDuration: const Duration(milliseconds: 9000),
      ).show(context);

      position:
      MotionToastPosition.top;
      animationType:
      AnimationType.fromTop;
    }

    return Scaffold(
      // backgroundColor: Color(0xffFFB703),
      body: Container(
        decoration: new BoxDecoration(
          color: Color(0xfff8edee),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              SizedBox(
                  // height: 80,
                  child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: ListTile(
                  title: Text(
                    "Flutter",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                elevation: 40,
                color: Color(0xff36344b),
              )),
              Row(
                children: [
                  Text(
                    "Please answer the following!",
                    style: TextStyle(
                      fontFamily: 'Lora-VariableFont_wght',
                      fontSize: 15,
                      color: Color(0xff36344b),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: CircularCountDownTimer(
                      duration: 10,
                      initialDuration: 0,
                      controller: _controller,
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.height / 6,
                      ringColor: Colors.grey[300]!,
                      ringGradient: null,
                      fillColor: Color(0xff6c6996),
                      fillGradient: null,
                      backgroundColor: Color(0xff36344b),
                      textStyle: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      autoStart: true,
                      onStart: () {
                        print('Countdown Started');
                      },
                      onComplete: () {
                        _displayErrorMotionToast();
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    color: Color(0xff36344b),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        Questions[0],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //GestureDetector(
                      //onTap: () => Navigator.pushNamed(context, '/second'),
                      // child:
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(context, '/second'),

                          child: Container(
                            width: 150,
                            height: 100,
                            color: Color(0xff6c6996),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Text(
                                options[0],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                          //)
                        ),
                      ),
                      InkWell(
                        onTap: () => showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: const Text('TRY AGAIN'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: const <Widget>[
                                        Text('Wrong!!!!'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ]);
                            }),
                        child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Text(
                                    options[1],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                width: 150,
                                height: 100,
                                color: Color(0xff6c6996),
                              ),
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () => showDialog<void>(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: const Text('TRY AGAIN'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text('Wrong!!!!'),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('ok'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ]);
                                }),
                            child: ClipRRect(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Text(
                                    options[2],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                width: 150,
                                height: 100,
                                color: Color(0xff6c6996),
                              ),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () => showDialog<void>(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: const Text('TRY AGAIN'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text('Wrong!!!!'),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('ok'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ]);
                                }),
                            child: ClipRRect(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Text(
                                    options[3],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                width: 150,
                                height: 100,
                                color: Color(0xff6c6996),
                              ),
                            ),
                          )),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/third');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff36344b),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Text(
                        'Submit all',
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AnswerWidget extends StatelessWidget {
  AnswerWidget(this.options1, {Key? key}) : super(key: key);

  //const AnswerWidget({Key? key}) : super(key: key);
  late List<String> options1 = ['sss', 'Google', 'Facebook', 'Microsoft'];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Text(
            options1[3],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xffffffff),
            ),
          ),
        ),
        width: 150,
        height: 100,
        color: Color(0xff6c6996),
      ),
    );
  }
}
