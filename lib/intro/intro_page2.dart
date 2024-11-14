// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace


import 'package:eventgo/widgets/app_text.dart';
import 'package:eventgo/widgets/app_text_large.dart';
import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Center(
                child: Image.asset('assets/intro.png'),
              ),
            ),
            SizedBox(height: 20),
            AppTextLarge(
              text: 'Accès Instantané',
              size: 25.0,
              color: Colors.black,
            ),
            SizedBox(height: 40),
            AppText(
              text:
                  'Accédez facilement à vos cours, devoirs et ressources essentiels en un seul endroit.',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
