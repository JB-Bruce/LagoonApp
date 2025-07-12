import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lagoon_app/Authentication/Widgets/validate_button.dart';
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

  bool changed = false;

  void save() async{
    await userService.value.saveUserData(authService.value.currentUser!.uid, nameController.text ?? '');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check, color: AppPallette.textColor1, size: 20,),

            SizedBox(width: 20),

            Text("Informations enregistrées",
              style: TextStyle(
                color: AppPallette.textColor1,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        backgroundColor: AppPallette.gradiant3,
      ),
    );

    setState(() {
      changed = false;
    });
  }

  void logout() async {
    try{
      await authService.value.signOut();
    } on FirebaseAuthException catch(e){
      log(e.message ?? 'error while logging out');
    }
  }

  void setName() async{
    String? s = userService.value.name;
    log(s ?? 'no string');
    log(authService.value.currentUser!.uid);
    setState(() {
      nameController.text = s ?? '';
    });
  }
  
  void setChanged(bool change){
    setState(() {
      changed = change;
    });
  }


  @override
  void initState() {
    super.initState();
    setName();
  }


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
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
      
            const SizedBox(height: 70),
      
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
      
            InputFieldAccountWidget(title: 'Nom', hint: 'Nom', changedFunc: (String)=>{setChanged(true)}, controller: nameController, editable: true, icon: Icons.person_outline,),
      
            const SizedBox(height: 60),
      
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
      
            /*ElevatedButton(onPressed: save, child:
              Text('Save',
      
              ),
            ),*/


      
            //InputFieldAccountWidget(title: 'Email', hint: authService.value.currentUser?.email ?? 'error in email', controller: emailController, editable: false, icon: Icons.mail_outline,),
      
            Text('Non disponible',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
            ),
      
            const SizedBox(height: 60),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 75),
              child: InkWell(
                onTap: changed ? save : null,
                borderRadius: BorderRadius.circular(15),
                focusColor: AppPallette.gradiant2,
                child: Ink(
                  padding: const EdgeInsets.all(12),
                  //margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: changed ? AppPallette.gradiant1 : AppPallette.borderColor2,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Center(
                          child: Text('Sauvegarder',
                            style: TextStyle(
                              color: AppPallette.textColor1,
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5),

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
    );
  }
}
