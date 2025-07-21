import 'package:flutter/material.dart';
import 'package:lagoon_app/Main/app_pallette.dart';

class CguPage extends StatelessWidget {
  const CguPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: appColor.textColor1,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Conditions générales d'utilisation", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: appColor.textColor1)),
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
  1. OBJET  
L'application "Lagoon app" permet aux utilisateurs d'avoir accès aux dernières nouveautées du bar et de participer à des jeux organisés par l'établissement.

  2. ACCÈS AU SERVICE  
L'application est gratuite et accessible sans obligation d’achat. Les utilisateurs peuvent s’inscrire aux tirages via un QR code fourni par les organisateurs.

  3. DONNÉES PERSONNELLES  
Les données collectées (adresse e-mail, prénom) sont utilisées uniquement pour la gestion des participants aux tirages. Voir la Politique de confidentialité.

  4. RESPONSABILITÉS  
L’éditeur n’est pas responsable en cas de mauvaise utilisation de l’application ou d’erreurs dans les informations saisies par les utilisateurs.

  5. PROPRIÉTÉ  
Tous les contenus (logos, textes, design) appartiennent à l’éditeur. Toute reproduction est interdite sans autorisation préalable.

  6. LITIGES  
Tout litige sera soumis à la juridiction française compétente.
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
