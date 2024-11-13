

import 'package:eventgo/authantification/main_page.dart';
import 'package:eventgo/intro/Intro.dart';
import 'package:eventgo/language/language_preferences.dart';
import 'package:eventgo/menu_page.dart';
import 'package:eventgo/pages/add_eventpage.dart';
import 'package:eventgo/pages/homepage.dart';
import 'package:eventgo/widgets/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'firebase_options.dart'; // Add this line

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure plugin services are initialized
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedLanguage = prefs.getString('language');

  var delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en_US',
    supportedLocales: [
      'en_US',
      'fr',
    ],
    preferences: TranslatePreferences(savedLanguage),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Themeprovider()),
        // ChangeNotifierProvider(create: (_) => /StockNotifier()),
      ],
      child: LocalizedApp(
        delegate,
        const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        theme: Provider.of<Themeprovider>(context).themeData,
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home':(context)=> AuthVerification(),
          '/intro': (context) => const Intro(),
          '/signup': (context) => const MainPage(),
          '/addevent': (context) => const AddEvent(),
          // '/
          // '/purchase': (context) => PaywallPage(),
          // '/schedule': (context) => const SchedulePage(),
        },
      ),
    );
  }
}
