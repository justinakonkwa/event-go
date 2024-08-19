import 'package:eventgo/widgets/app_text.dart';
import 'package:eventgo/widgets/app_text_large.dart';
import 'package:eventgo/widgets/bouton_next.dart';
import 'package:eventgo/widgets/constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppTextLarge(
          text: 'Vendre des Billets',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextLarge(text: "Tu n'as pas encore vendu de billets",size: 16,),
            sizedbox,
            NextButton(
              color: Colors.black,
              width: 200,
              onTap: () {},
              child: AppText(text: 'Commenecer à vendre',color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
