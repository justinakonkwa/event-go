// ignore_for_file: prefer_const_constructors

import 'package:eventgo/widgets/app_text.dart';
import 'package:eventgo/widgets/app_text_large.dart';
import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).size.height * 0.08),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.47,
              width: 400,
              child: Image.asset('assets/intro.png'),
            ),
            SizedBox(height: 20),
            AppTextLarge(
              text: 'Nouvelle Expérience',
              color: Colors.black,
            ),
            SizedBox(height: 40),
            AppText(
              text:
                  'ransformez votre parcours académique avec notre application innovante et intuitive.',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
