import 'package:flutter/material.dart';
import 'package:music_app/pages/SuccessfulRegistration.dart';
import 'package:music_app/widgets/InputField.dart';
import 'package:music_app/widgets/GradientButton.dart';

class Registration extends StatelessWidget {
  final TextStyle textStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 24,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'Input your e-mail',
                  style: textStyle,
                  textAlign: TextAlign.left, //??????????
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: InputField(defaultValue: 'yulianka@blabla.by'),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Input your password',
                  style: textStyle,
                  textAlign: TextAlign.left, //??????????
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: InputField(
                  defaultValue: '',
                  secured: true,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 40),
                  child: GradientButton(
                    'Sign up',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessfulRegistration()),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
