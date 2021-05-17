import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/widgets/GradientButtonBlocked.dart';
import 'package:music_app/widgets/InputField.dart';
import 'package:music_app/widgets/GradientButton.dart';

class EntranceError extends StatelessWidget {
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
                  'Input ypur e-mail',
                  style: textStyle,
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
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: InputField(
                  defaultValue: '1234567890',
                  secured: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '! Invalid email address ar password specified!'
                'check the entered data',
                style: GoogleFonts.montserrat(
                    fontSize: 18, color: Color.fromRGBO(246, 11, 11, 0.68)),
                // style: TextStyle(
                //     color: Color.fromRGBO(246, 11, 11, 0.68), fontSize: 18),
              ),
              SizedBox(
                height: 60,
              ),
              GradientButton('Log in', onPressed: () => print('Privet'))
            ],
          ),
        ),
      ),
    );
  }
}
