
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lagoon_app/Authentication/auth_service.dart';
import 'package:lagoon_app/Main/app_pallette.dart';
import 'package:lagoon_app/Main/user_service.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/foundation.dart' show kDebugMode;


class QrScannerPage extends StatefulWidget {
  @override
  _QrScannerPageState createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  bool _scanned = false;

  void _handleScan(String idQR) async {
    final user = authService.value.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Utilisateur non connecté')),
      );
      Navigator.pop(context);
      return;
    }

    final already = await userService.value.isAlreadyParticipant(user.uid);
    if (already) {
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Déjà inscrit"),
          content: Text("Vous êtes déjà inscrit au jeu."),
          actions: [
            ElevatedButton(
              child: Icon(Icons.check, color: AppPallette.gradiant2, size: 25,),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      );
      Navigator.pop(context);
      return;
    }

    String? name = userService.value.name;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Confirmation"),
        content: Text("Souhaitez-vous vous inscrire au jeu concours du Lagoon ?"),
        actions: [
          ElevatedButton(
            child: Icon(Icons.check, color: AppPallette.gradiant2, size: 25,),
            onPressed: () => Navigator.pop(context, true),
          ),
          IconButton(
              onPressed: () => Navigator.pop(context, false),
              icon: Icon(Icons.clear, color: AppPallette.errorColor2, size: 25,),
          ),
        ],
      ),
    );

    if (confirm == true) {
      if (name == null || name == '') {
        name = await showDialog<String>(
          context: context,
          builder: (context) {
            final nameController = TextEditingController();
            return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  title: Text("Entrez votre nom"),
                  content: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 150),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppPallette.textColor2,
                                    width: .8,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppPallette.gradiant1,
                                    width: 1.5,
                                  ),
                                ),
                                hintText: "Nom ou pseudo"),
                            onChanged: (_) =>
                                setState(() {}),
                          ),

                          if(nameController.text
                              .trim()
                              .length < 4)
                            SizedBox(height: 5),

                          if(nameController.text
                              .trim()
                              .length < 4)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('4 caractères minimum',
                                  style: TextStyle(
                                    color: AppPallette.errorColor2,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        final name = nameController.text.trim();
                        if (name.length >= 4) {
                          Navigator.pop(context, name);
                        } else {
                          null;
                        }
                      },
                      icon: Icon(Icons.check, color: nameController.text.trim().length >= 4 ? AppPallette.gradiant2 : AppPallette.borderColor2, size: 25,),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context, null),
                      icon: Icon(Icons.clear, color: AppPallette.errorColor2, size: 25,),
                    ),
                  ],
                );
              },
            );
          },
        );
      }


      if (name == null || name == '') {
        Navigator.pop(context);
        return;
      }

      await userService.value.addParticipant(
          user.uid, user.email ?? '', name ?? 'empty_name');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check, color: AppPallette.textColor1, size: 20,),

              SizedBox(width: 20),

              Text("Inscription réussie",
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
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scanner un QR Code')),
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (capture) async {
              if (_scanned) return;
              _scanned = true;

              final barcode = capture.barcodes.first;
              final String? code = barcode.rawValue;

              if (code != null && code == 'lagoon-game-participation-01') {
                _handleScan(code);
              }
            },
          ),

          if (kDebugMode)
            Positioned(
              bottom: 30,
              left: 30,
              child: ElevatedButton(
                onPressed: () {
                  final fakeQr = "lagoon-game-participation-01";
                  _handleScan(fakeQr);
                },
                child: Text("Test QR"),
              ),
            ),
        ],
      ),
    );
  }
}