import 'package:flutter/material.dart';
import 'package:lagoon_app/Main/app_pallette.dart';

class MentionsLegalesPage extends StatelessWidget {
  const MentionsLegalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: appColor.textColor1,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Mentions légales", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: appColor.textColor1)),
        centerTitle: true,
        backgroundColor: appColor.backgroundColor2,

        elevation: 1,
      ),
      backgroundColor: appColor.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Text(
            """
            
  ÉDITEUR DE L'APPLICATION  
  
Nom : BUSSARD Marc  
Adresse : 16  les savis, Le Gond-Pontouvre, 16160, France
E-mail : marco-nc@hotmail.com 
Téléphone : +33 6 50 67 60 94
Statut juridique : SAS  
Numéro SIRET : 888 050 663  
Directeur de la publication : BUSSARD Marc


  HÉBERGEMENT  
  
Nom : Google Firebase  
Adresse : Google Ireland Ltd., Gordon House, Barrow Street, Dublin 4, Ireland  
Site web : https://firebase.google.com/


L’application est la propriété exclusive de BUSSARD Marc.
            """,
            style: TextStyle(
              color: appColor.textColor1,
            ),
          ),
        ),
      ),
    );
  }
}
