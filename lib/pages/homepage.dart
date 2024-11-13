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
            title: AppTextLarge(
              text: 'Event Go',
              size: 30,
            ),
            centerTitle: false,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(
                top:
                    80.0, // Adjusts the position of the search bar under the title
                left: 20.0,
                right: 20.0,
              ),
              child: Container(
                height: 45,
                child: CupertinoTextField(
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  keyboardType: TextInputType.text,
                  placeholder: 'Recherche des artistes, lieux, événements...',
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefix: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      CupertinoIcons.search,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextLarge(text: 'Trouve ton prochain Événement'),
                SizedBox(height: 20),
                Row(
                  children: [
                    EventCard(
                      text: "Aujourd'hui",
                      icon: Icons.calendar_today,
                      color: Colors.blue,
                    ),
                    Spacer(),
                    EventCard(
                      text: "Demain",
                      icon: Icons.calendar_today,
                      color: Colors.orange,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    EventCard(
                      text: "Ce week-end",
                      icon: CupertinoIcons.calendar_today,
                      color: Colors.green,
                    ),
                    Spacer(),
                    EventCard(
                        text: "Tous événements",
                        icon: CupertinoIcons.calendar,
                        color: Colors.red),
                  ],
                ),
                SizedBox(height: 20),
                AppTextLarge(text: 'Event-Go Magazine'),
                SizedBox(height: 20),
                AppText(
                  text:
                      '''Nos événements organisés, interviews et plus encore.''',
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.width *
                      0.55, // Height for the container with ListView
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5, // Number of items in the list
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width *
                                0.8, // Width of the container
                            height: MediaQuery.of(context).size.width * 0.48,
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                            ),
                            child: Center(
                              child: AppText(
                                text: 'Item $index',
                              ),
                            ),
                          ),
                          AppText(
                            text:
                                'Double stade de France avec le rappeur Ninho',
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? color;
  // Constructor to initialize parameters
  EventCard({required this.text, required this.icon, this.color});

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(child: AppText(text: text)),
          SizedBox(width: 10),
          Icon(
            icon,
            color: color,
          ),
        ],
      ),
    );
  }
}
