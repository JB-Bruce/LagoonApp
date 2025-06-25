import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lagoon_app/Authentication/auth_service.dart';
import 'package:lagoon_app/Main/Widgets/input_field_account_widget.dart';
import 'package:lagoon_app/Main/app_pallette.dart';
import 'package:lagoon_app/Main/user_service.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  final emailController = TextEditingController();
  final nameController = TextEditingController();

  void save(){
    userService.value.saveUserData(authService.value.currentUser!.uid, nameController.text ?? '');
  }

  void logout() async {
    try{
      await authService.value.signOut();
    } on FirebaseAuthException catch(e){
      log(e.message ?? 'error while logging out');
    }
  }

  void setName() async{
    String? s = await userService.value.loadUserFirstName(authService.value.currentUser!.uid);
    log(s ?? 'no string');
    log(authService.value.currentUser!.uid);
    setState(() {
      nameController.text = s ?? '';
    });
  }


  @override
  void initState() {
    super.initState();
    setName();
  }


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [

          const SizedBox(height: 50),

          Text(
            'Compte',
            style: TextStyle(
              color: AppPallette.textColor1,
              fontWeight: FontWeight.w800,
              fontSize: 35
            ),
          ),

          const SizedBox(height: 80),

          Row(
            children: [
              Text('Informations personnelles',
                style: TextStyle(
                  color: AppPallette.textColor1,
                  fontWeight: FontWeight.w600,
                  fontSize: 20
                ),
              ),
            ],
          ),

          Divider(
            color: AppPallette.borderColor4,
            thickness: 2,
          ),

          const SizedBox(height: 30),

          InputFieldAccountWidget(title: 'Email', hint: authService.value.currentUser?.email ?? 'error in email', controller: emailController, editable: false, icon: Icons.mail_outline,),

          const SizedBox(height: 30),

          InputFieldAccountWidget(title: 'Nom', hint: 'Nom', controller: nameController, editable: true, icon: Icons.person_outline,),

          const SizedBox(height: 80),

          Row(
            children: [
              Text('Mot de passe',
                style: TextStyle(
                    color: AppPallette.textColor1,
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                ),
              ),
            ],
          ),

          Divider(
            color: AppPallette.borderColor4,
            thickness: 2,
          ),

          const SizedBox(height: 50),

          ElevatedButton(onPressed: save, child:
            Text('Save',

            ),
          ),
          //InputFieldAccountWidget(title: 'Email', hint: authService.value.currentUser?.email ?? 'error in email', controller: emailController, editable: false, icon: Icons.mail_outline,),

          const SizedBox(height: 100),

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
    );
  }
}
