// ignore_for_file: avoid_unnecessary_containers

import 'package:eventgo/widgets/app_text.dart';
import 'package:eventgo/widgets/app_text_large.dart';
import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

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
              child: Image.asset('assets/intro.png'),
            ),
            const SizedBox(height: 20),
            AppTextLarge(
              text: 'Restez Connecté',
              size: 25.0,
              color: Colors.black,
            ),
            const SizedBox(height: 40),
            AppText(
              text:
                  'Engagez-vous avec vos enseignants et camarades. Recevez des notifications instantanées.',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
