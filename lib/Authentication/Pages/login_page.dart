import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lagoon_app/Authentication/Pages/signin_page.dart';
import 'package:lagoon_app/Authentication/Widgets/InputField.dart';
import 'package:lagoon_app/Authentication/Widgets/validate_button.dart';
import 'package:lagoon_app/Authentication/auth_service.dart';
import 'package:lagoon_app/Main/app_pallette.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final mdpController = TextEditingController();

  String errorMsg = '';

  void login() async {
    try {
      await authService.value.signIn(email: emailController.text, password: mdpController.text);
    } on FirebaseAuthException catch(e){
      setState(() {
        errorMsg = e.message ?? 'error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallette.backgroundColor,

      body: SafeArea(
        child: Center(
          child: Column(children: [
            Text(
              'Lagoon',
              style: TextStyle(
                color: AppPallette.textColor1,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              'bar - restaurant',
              style: TextStyle(
                color: AppPallette.textColor3,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 130),

            Text(
              'Connexion',
              style: TextStyle(
                color: AppPallette.textColor1,
                fontSize: 35,
                fontWeight: FontWeight.w900,
                fontFamily: ''
              ),
            ),

            Icon(
              Icons.key_rounded,
              size: 70,
              color: Colors.yellow[500],
            ),

            SizedBox(height: 80),

            InputField(
              controller: emailController,
              hintText: 'email',
              obscureText: false,
              icon: Icons.person,
            ),

            SizedBox(height: 20),

            InputField(
              controller: mdpController,
              hintText: 'mot de passe',
              obscureText: true,
              icon: Icons.lock,
            ),

            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: ()=>{},
                    child: Text('Mot de passe oublié ?',
                      style: TextStyle(
                        color: AppPallette.textColor2,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            ValidateButton(text: 'Connexion', event: login),

            SizedBox(height: 10),

            Text(errorMsg,
              style: TextStyle(
                color: AppPallette.errorColor,
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 0.0,
              children: [
                Text('Pas de compte ?' ,
                  style: TextStyle(
                    color: AppPallette.textColor2,
                  ),
                ),
                TextButton(
                  onPressed: ()=>{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SigninPage()),
                    ),
                  },
                  child: Text("Créer un compte",
                    style: TextStyle(
                      color: AppPallette.gradiant1,
                    ),
                  ),
                ),
              ],
            ),



          ],),
        ),
      ),
    );
  }
}
