import 'package:eventgo/screens/Help_page.dart';
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
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.black12,
                    child: Icon(CupertinoIcons.tickets_fill,color: Colors.grey,size: 40,),
                  ),
                  // SizedBox(
                  //   height: 150.0,
                  //   child: Image.asset('assets/ticket.png'),
                  // ),
                  AppTextLarge(
                    text:
                        "Connecte-toi ou crée un compte pour vendre tes billets en un clin d'oeil !",
                    size: 16,
                    textAlign: TextAlign.center,
                  ),
                  sizedbox,
                  NextButton(
                    color: Colors.black,
                    width: 200,
                    onTap: () {
                      // showModalBottomSheet(
                      //
                      //   backgroundColor:
                      //   Theme.of(context).colorScheme.background,
                      //   context: context,
                      //   isScrollControlled: true,
                      //   builder: (BuildContext context) {
                      //     return  Container(
                      //         height:MediaQuery.of(context).size.height * 0.45,
                      //         child: SignupPage());
                      //   },
                      // );
                    },
                    child: AppTextLarge(
                      size: 14,
                      text: "S'inscrire ou se connecter",
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.grey),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpScreen(),
                    ),
                  );
                },
                title: AppTextLarge(
                  text: "C'est la première fois que tu vends ?",
                  size: 16,
                  textAlign: TextAlign.start,
                ),
                subtitle: AppText(
                    text:
                        "Pas de stress ! Découvre nos petits conseils sur tout ce qur tu dois savoir",
                    color: Colors.grey),
                trailing: const Icon(CupertinoIcons.chevron_compact_right),
              ),
            )
          ],
        ),
      ),
    );
  }
}
