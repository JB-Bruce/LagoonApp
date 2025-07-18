import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lagoon_app/Authentication/Widgets/validate_button.dart';
import 'package:lagoon_app/Authentication/auth_service.dart';
import 'package:lagoon_app/Main/app_pallette.dart';
import 'package:lagoon_app/Main/pages/home_page.dart';

class EmailSentPage extends StatefulWidget {
  const EmailSentPage({super.key});

  @override
  State<EmailSentPage> createState() => _EmailSentPageState();
}

class _EmailSentPageState extends State<EmailSentPage> {


  @override
  Widget build(BuildContext context) {


    void back() async{
      try{
        await authService.value.currentUser!.reload();
        if(authService.value.currentUser?.emailVerified ?? false){
          await authService.value.reSignIn(password: authService.value.tempString!); // can be changed to direct connexion
          authService.value.tempString = null;
        }else{
          await authService.value.signOut();
        }
      } on FirebaseAuthException catch(e){
        log(e.message ?? 'error while logging out');
      }
    }

    return Scaffold(
      backgroundColor: appColor.backgroundColor,

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Email envoyé !',
                style: TextStyle(
                  color: appColor.textColor1,
                  fontWeight: FontWeight.w800,
                  fontSize: 30
                ),
              ),

              SizedBox(height: 10),

              Icon(Icons.check,
                size: 70,
                color: appColor.gradiant2,

              ),

              SizedBox(height: 50),

              Divider(
                color: appColor.borderColor2,
                thickness: 2,
                indent: 40,
                endIndent: 40,
              ),

              SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Un email de vérification vous à été envoyé à ${authService.value.currentUser?.email ?? '*email*'}. Terminez votre inscription en cliquant sur le lien reçu.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: appColor.textColor2,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),

              SizedBox(height: 50),

              Divider(
                color: appColor.borderColor2,
                thickness: 2,
                indent: 40,
                endIndent: 40,
              ),

              SizedBox(height: 100),

              ValidateButton(text: 'Retour', event: back, icon: Icons.arrow_back)
            ],
          ),
        ),
      ),
    );
  }
}
