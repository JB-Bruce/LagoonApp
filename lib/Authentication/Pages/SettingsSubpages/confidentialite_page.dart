import 'package:flutter/material.dart';
import 'package:lagoon_app/Main/app_pallette.dart';

class ConfidentialitePage extends StatelessWidget {
  const ConfidentialitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: appColor.textColor1,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Politique de confidentialité", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: appColor.textColor1)),
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
  1. COLLECTE DES DONNÉES  
Nous collectons des informations lorsque vous vous inscrivez à un tirage (nom, e-mail, identifiant utilisateur). Ces données sont nécessaires pour gérer les participations.

  2. UTILISATION  
Vos données sont utilisées uniquement pour :
- vous inscrire à un tirage
- sélectionner un gagnant

  3. PARTAGE  
Aucune donnée n’est vendue ni partagée avec des tiers, sauf avec les organisateurs du tirage.

  4. SÉCURITÉ  
Les données sont stockées de manière sécurisée via Firebase (Google) et ne sont accessibles qu’aux administrateurs autorisés.

  5. DROITS DES UTILISATEURS  
Vous pouvez demander la suppression ou la modification de vos données à tout moment en nous contactant à : marco-nc@hotmail.com

  6. DURÉE DE CONSERVATION  
Les données des participants sont supprimées après chaque session de tirage, sauf demande contraire de votre part.

  7. COOKIES  
L'application ne collecte aucun cookie ou traceur.
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
