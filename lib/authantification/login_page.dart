// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventgo/authantification/otp.dart';
import 'package:eventgo/modeles/firebase_fonction.dart';
import 'package:eventgo/widgets/app_text.dart';
import 'package:eventgo/widgets/app_text_large.dart';
import 'package:eventgo/widgets/bouton_next.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _phoneNumberController =
  TextEditingController(text: '+243');
  final TextEditingController _passwordController = TextEditingController();
  bool visibility = false;
  bool isLoading = false;
  String? fcmToken;

  @override
  void initState() {
    super.initState();
    _retrieveFCMToken();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        _updateFCMToken();
      }
    });
  }

  // Méthode pour récupérer le token FCM
  Future<void> _retrieveFCMToken() async {
    fcmToken = await FirebaseMessaging.instance.getToken();
    print('FCM Token: $fcmToken');
  }
  // Méthode pour mettre à jour le token FCM
  Future<void> _updateFCMToken() async {
    try {
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({
          'fcmToken': fcmToken,
        });
      }
    } catch (e) {
      print('Erreur lors de la mise à jour du token FCM : $e');
    }
  }

  Future<void> _sendOTP() async {
    if (_phoneNumberController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      AllFonction().closeKeyboard(context);
      setState(() => isLoading = true);
      String phoneNumber = _phoneNumberController.text;

      try {
        QuerySnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .where('phoneNumber', isEqualTo: phoneNumber)
            .where('password', isEqualTo: _passwordController.text)
            .get();

        if (userSnapshot.docs.isNotEmpty) {
          await FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber: phoneNumber,
            verificationCompleted: (PhoneAuthCredential credential) async {
              // Authentification automatique réussie avec OTP
              await FirebaseAuth.instance.signInWithCredential(credential);
              _showSnackBar(context, 'Connexion réussie !');
              Navigator.pushReplacementNamed(context, '/home');
            },
            verificationFailed: (FirebaseAuthException e) {
              print('Erreur OTP : ${e.message}');
              _showSnackBar(context, 'OTP invalide. Veuillez réessayer.');
              setState(() => isLoading = false);
            },
            codeSent: (String verificationId, int? resendToken) {
              _showSnackBar(context, 'OTP envoyé avec succès !');
              setState(() => isLoading = false);
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return VerificationOTPPage(
                    phoneNumber: phoneNumber,
                    verificationId: verificationId,
                    name: '',
                    password: _passwordController.text,
                    isSignUp: false,
                    fcmToken: fcmToken ?? '',
                  );
                },
              );
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              _showSnackBar(context, 'Le délai pour entrer l\'OTP a expiré.');
            },
          );
        } else {
          _showSnackBar(context, 'Informations incorrectes.');
          setState(() => isLoading = false);
        }
      } catch (e) {
        _showSnackBar(context, 'Erreur lors de l\'envoi de l\'OTP.');
        print('Erreur lors de la vérification : $e');
        setState(() => isLoading = false);
      }
    } else {
      _showSnackBar(context, 'Veuillez compléter vos informations.');
      setState(() => isLoading = false);
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red, // Changez la couleur selon vos besoins
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    AppTextLarge(
                      text: translate("connexion.login"),
                      color: Theme.of(context).colorScheme.onBackground,
                      size: 16,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed:(){} ,
                      icon: Icon(
                        Icons.logout,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CupertinoTextField(
                  controller: _phoneNumberController,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Theme.of(context).colorScheme.onBackground),
                  keyboardType: TextInputType.phone,
                  placeholder: 'Phone Number',
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefix: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Icon(CupertinoIcons.phone),
                  ),
                ),
                SizedBox(height: 20),
                CupertinoTextField(
                  controller: _passwordController,
                  obscureText: visibility,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Theme.of(context).colorScheme.onBackground),
                  placeholder: 'Password',
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefix: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Icon(CupertinoIcons.lock_shield),
                  ),
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                    icon: Icon(visibility
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash),
                  ),
                ),
                SizedBox(height: 20),
                NextButton(

                  onTap: _sendOTP,
                  child: Text("Send OTP"),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    AppText(
                        text: translate("connexion.compte"),
                        color:
                        Theme.of(context).colorScheme.onBackground),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return LoginPage();
                          },
                        );
                      },
                      child: AppText(
                        text: translate("connexion.signup"),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}