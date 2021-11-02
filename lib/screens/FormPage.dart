import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_app_dart/components/CommonComponents.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> with TickerProviderStateMixin {
  AnimationController _animation;
  Animation _fadeCtrl;
  bool disableBtn = false;

  final GlobalKey<FormState> _form = new GlobalKey<FormState>();
  final name = new TextEditingController(text: '');
  final relationship = new TextEditingController(text: '');
  final message = new TextEditingController(text: '');

  @override
  void initState() {
    _animation =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    _fadeCtrl = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animation, curve: Curves.easeIn),
    );
    _animation.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _form,
              child: FadeTransition(
                  opacity: _fadeCtrl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                            child: Text(
                              'Patrick & Mariane',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.parisienne(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 20, 10),
                            child: Text(
                              'Sage Garden Cafe + Restaurant, Alabang\nDecember 18, 2021',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.parisienne(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ))
                      ]),
                      Container(
                        height: MediaQuery.of(context).size.height / 1.7,
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 15),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xFFFEE391), width: 3),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white.withOpacity(0.5),
                                  blurRadius: 9,
                                  spreadRadius: 4)
                            ],
                            borderRadius: BorderRadius.circular(30.0)),
                        child: SingleChildScrollView(
                            child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.fromLTRB(0, 20, 20, 10),
                                child: Text(
                                  'Send your wishes to the couple!',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.parisienne(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                            formSpacer(ratio: 1.5),
                            commonTextField(
                              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                              label: "Name",
                              ctrl: name,
                            ),
                            commonTextField(
                              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                              label: "Relationship to couple",
                              ctrl: relationship,
                            ),
                            commonTextField(
                                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                                label: "Message",
                                ctrl: message,
                                multiLine: 3,
                                maxLines: 50,
                                onChanged: (val) {
                                  if (val.isEmpty) {
                                    setState(() {
                                      disableBtn = false;
                                    });
                                  } else {
                                    setState(() {
                                      disableBtn = true;
                                    });
                                  }
                                }),
                            formSpacer(ratio: 1.5),
                            Container(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
                                child: primaryButton(context,
                                    title: "Submit message",
                                    color: disableBtn
                                        ? Color(0xFFFEE391)
                                        : Colors.grey,
                                    onTap: () =>
                                        disableBtn ? _submitForm(context) : {},
                                    textStyle: GoogleFonts.parisienne(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    shadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          blurRadius: 8,
                                          spreadRadius: 4)
                                    ])),
                          ],
                        )),
                      )
                    ],
                  )),
            )));
  }

  _submitForm(BuildContext context) {
    if (_form.currentState.validate()) {}
  }
}
