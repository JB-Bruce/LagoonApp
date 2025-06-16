import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lagoon_app/Authentication/auth_service.dart';
import 'package:lagoon_app/Main/app_pallette.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    void logout() async {
      try{
        await authService.value.signOut();
      } on FirebaseAuthException catch(e){
        log(e.message ?? 'error while logging out');
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 300),

              Text(
                'Accueil',
                style: TextStyle(
                  color: AppPallette.textColor1,
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 300),
              
              TextButton(
                onPressed: logout,
                child: Text(
                  'Deconnexion',
                  style: TextStyle(
                    color: AppPallette.errorColor2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
