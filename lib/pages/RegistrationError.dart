import 'package:flutter/material.dart';
import 'package:music_app/widgets/InputField.dart';
import 'package:music_app/widgets/GradientButton.dart';

class RegistrationError extends StatelessWidget {
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
                  'Введи свою почту',
                  style: textStyle,
                  textAlign: TextAlign.left, //??????????
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: InputField(defaultValue: 'yulianka@blabla.by'),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Упс! Эта почта уже занята(',
                style: TextStyle(
                    color: Color.fromRGBO(246, 11, 11, 0.68), fontSize: 18),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Введи свой пароль',
                  style: textStyle,
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: InputField(
                  defaultValue: '1234567890',
                  secured: true,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: GradientButton('Регистрация',
                    onPressed: () => print('Privet')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
