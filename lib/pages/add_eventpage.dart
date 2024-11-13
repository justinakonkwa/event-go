import 'package:eventgo/authantification/login_page.dart';
import 'package:eventgo/authantification/signup_page.dart';
import 'package:eventgo/screens/Help_page.dart';
import 'package:eventgo/widgets/app_text.dart';
import 'package:eventgo/widgets/app_text_large.dart';
import 'package:eventgo/widgets/bouton_next.dart';
import 'package:eventgo/widgets/constantes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  User? user; // Variable pour stocker l'utilisateur connecté

  @override
  void initState() {
    super.initState();
    // Récupérer l'utilisateur connecté
    user = FirebaseAuth.instance.currentUser;
  }

  Future<void> _logout() async {
    try {
      // Supprime le token FCM de l'utilisateur

      // Déconnexion de Firebase
      await FirebaseAuth.instance.signOut();

      // Réinitialise l'état utilisateur
      setState(() {
        user = null;
      });

      // Redirection vers la page de connexion après la déconnexion
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AddEvent()),
      );
    } catch (e) {
      print('Erreur lors de la déconnexion : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppTextLarge(
          text: 'Vendre des Billets',
        ),
        actions: [
          // Afficher le bouton de déconnexion uniquement si l'utilisateur est connecté
          if (user != null)
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: _logout,
              tooltip: 'Se déconnecter',
            ),
        ],
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
                    child: Icon(
                      CupertinoIcons.tickets_fill,
                      color: Colors.grey,
                      size: 40,
                    ),
                  ),
                  if (user != null) ...[
                    // Si l'utilisateur est connecté, afficher un message différent
                    AppTextLarge(
                      text: "Tu es déjà connecté !",
                      size: 16,
                      textAlign: TextAlign.center,
                    ),
                    sizedbox,
                    NextButton(
                      color: Colors.black,
                      width: 200,
                      onTap: () {
                        Navigator.pushNamed(context,
                            '/eventPage'); // Rediriger vers la page des événements
                      },
                      child: AppText(
                        text: "Accéder à tes événements",
                        color: Colors.white,
                      ),
                    ),
                  ] else ...[
                    // Si l'utilisateur n'est pas connecté, afficher le texte d'authentification
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
                        showModalBottomSheet(
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.45,
                                child: SignUpPage());
                          },
                        );
                      },
                      child: AppText(
                        text: "S'inscrire ou se connecter",
                        color: Colors.white,
                      ),
                    ),
                  ],
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
