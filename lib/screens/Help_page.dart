import 'package:eventgo/widgets/app_text.dart';
import 'package:eventgo/widgets/app_text_large.dart';
import 'package:eventgo/widgets/constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTextLarge(
          text: 'Petis Conseils de vente',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                height: 200.0,
                child: Image.asset('assets/ticket.png'),
              ),
              AppTextLarge(text: 'Guide pour vendre des billets'),
              sizedbox,
              sizedbox,
              const ExpandableCard(
                title: "Vendre des billets",
                content:
                    "Tu peux acheter et revendre des billets de concerts, de festivals, d'événements sportifs, de représentations théâtrales et d'autres événements en direct sur notre plateforme sécurisée. Il te suffit de suivre les étapes pour créer un compte ou te connecter, d'ajouter ton billet et les informations sur le prix, et de mettre ton billet en vente.",
              ),
              sizedbox,
              sizedbox,
              const ExpandableCard(
                title: "Pourquoi les fans font confiance à Event-GO",
                content:
                    "Nos fans nous ont attribué la note de 4,3 sur Trustpilot et nous garantissons la sécurité de tous de plusieurs manières. Les profils de nos acheteurs et de nos vendeurs sont vérifiés et nous disposons d'un système anti-fraude qui analyse tous les billets. SecureSwap est une mesure de sécurité supplémentaire qui consiste à créer un tout nouveau billet et un nouveau code-barres en collaboration avec nos partenaires organisateurs.",
              ),
              sizedbox,
              sizedbox,
              const ExpandableCard(
                title: "Gérer ou modifier des annonces",
                content:
                    "Tu peux retrouver les annonces de tes billets en vente dans la section << Vendre >>> sur l'appli ou dans la section << Tes annonces >> sur notre site Web. C'est à cet endroit que tu peux modifier le prix, la description et tes coordonnées bancaires. Tu peux également y ajouter ou y retirer des billets de la vente.",
              ),
              sizedbox,
              sizedbox,
              const ExpandableCard(
                title: "Faire un transfert de billet Event-Go",
                content:
                    "Pour créer ton annonce sur l'appli Event-Go, clique sur <<< Vendre >> et suis les étapes qui s'affichent. Si tu as acheté tes billets sur la plateforme Ticketmaster, tu devras accéder et gérer tes billets depuis leur plateforme, sur l'appli Event-Go",
              ),
              sizedbox,
              sizedbox,
              const ExpandableCard(
                title: "Recevoir l'argent des billets vendus",
                content:
                    "Tu recevras l'argent de ta vente sous 3 jours sur le compte pour les versements renseigné au moment de ton inscription. Pour savoir quand ton argent arrivera sur ton compte, rends-toi dans la section << Versements >> de ton compte. Tu pourras y retrouver le statut de tous tes versements.",
              ),
              sizedbox,
              sizedbox,
              const ExpandableCard(
                title:
                    "Vendre des billets pas encore émis au format capture d'écran ou e-mail",
                content:
                    "Parfois, les organisateurs n'émettent les billets que quelques jours avant l'événement, par e-mail ou sur une appli, mais cela ne t'empêche pas de vendre tes billets. Suis les étapes sur l'appli pour importer le bon format. La plupart des billets se vendent juste avant l'événement, donc tout marche comme sur des roulettes!",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandableCard extends StatefulWidget {
  final String title;
  final String content;

  const ExpandableCard({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool _isExpanded = false; // État de l'expansion

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: AppTextLarge(
            text: widget.title,
            size: 16,
          ),
          trailing: Icon(
            _isExpanded
                ? CupertinoIcons.chevron_compact_down
                : CupertinoIcons.chevron_compact_right,
          ),
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                bottom: 10.0,
              ),
              child: AppText(
                text: widget.content,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
