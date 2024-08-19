import 'package:eventgo/widgets/app_text.dart';
import 'package:eventgo/widgets/app_text_large.dart';
import 'package:eventgo/widgets/constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: AppTextLarge(text: 'Event Go',size: 30,),
            centerTitle: false,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(
                top: 80.0, // Ajuste la position de la barre de recherche sous le titre
                left: 20.0,
                right: 20.0,
              ),
              child: CupertinoTextField(
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                keyboardType: TextInputType.text,
                placeholder: 'Recherche des artistes, lieux, événements...',
                decoration: BoxDecoration(
                  color: Colors.grey[200],

                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefix: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Icon(
                    CupertinoIcons.search,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              AppTextLarge(text:' Trouve ton prochain Evénement'),
          SizedBox(height: 20,),
               Row(
                children: [
                  EventCard(
                    text: "Aujourd'hui",
                    icon: Icons.calendar_month,
                  ),
                  Spacer(),
                  EventCard(
                    text: "Demain",
                    icon: Icons.calendar_today,
                  ),
                ],
              ),
               sizedbox,
               Row(
                children: [
                  EventCard(
                    text: "ce week-end",
                    icon: Icons.calendar_month,
                  ),
                  Spacer(),
                  EventCard(
                    text: "tous évenements",
                    icon: Icons.calendar_today,
                  ),
                ],
              ),
          SizedBox(height: 20,),
          AppTextLarge(text: 'Event-Go Magazine'),
          sizedbox,
          AppText(text: '''Nos événements organisés , interviews et plus
encore.
          '''),
          Container(
            height: MediaQuery.of(context).size.width * 0.55, // Hauteur pour le conteneur contenant la ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5, // Nombre d'éléments dans la liste
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.8, // Largeur du conteneur
                  margin: EdgeInsets.symmetric(horizontal: 8.0), // Espacement horizontal entre les conteneurs
                  decoration: BoxDecoration(
                    color:  Colors.grey[200],// Couleur de fond des conteneurs
                    borderRadius: BorderRadius.circular(20), // Coins arrondis
                  ),
                  child: Center(
                    child: AppText(text:
                      'Item $index',

                    ),
                  ),
                );
              },
            )),
            ],
          ),
        ),
      ),
    );
  }
}


class EventCard extends StatelessWidget {
  final String text;
  final IconData icon;

  // Constructeur pour initialiser les paramètres
  EventCard({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),

      height: 50.0,
      width: MediaQuery.of(context).size.width * 0.44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: AppText(text: text)),
          SizedBox(width: 10),
          Icon(icon),
        ],
      ),
    );
  }
}
