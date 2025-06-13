import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lagoon_app/Authentication/Widgets/InputField.dart';
import 'package:lagoon_app/Authentication/Widgets/validate_button.dart';
import 'package:lagoon_app/Authentication/auth_service.dart';
import 'package:lagoon_app/Main/app_pallette.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final emailController = TextEditingController();
  final mdpController = TextEditingController();
  final mdpConfirmationController = TextEditingController();

  String errorMsg = '';

  void signin() async {

    if(mdpController.text != mdpConfirmationController.text){
      setState(() {
        errorMsg = 'Les mots de passe sont différents';
      });
      return;
    }

    try {
      await authService.value.createAccount(email: emailController.text, password: mdpController.text);
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
              'Inscription',
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

            SizedBox(height: 20),

            InputField(
              controller: mdpConfirmationController,
              hintText: 'confirmation',
              obscureText: true,
              icon: Icons.lock,
            ),


            SizedBox(height: 40),

            ValidateButton(text: 'Inscription', event: signin),

            SizedBox(height: 10),

            Text(errorMsg,
              style: TextStyle(
                color: AppPallette.errorColor,
              ),
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 0.0,
              children: [
                Text('Déjà un compte ?' ,
                  style: TextStyle(
                    color: AppPallette.textColor2,
                  ),
                ),
                TextButton(
                  onPressed: ()=>{
                    Navigator.pushNamed(context, '/login')
                  },
                  child: Text("Se connecter",
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
