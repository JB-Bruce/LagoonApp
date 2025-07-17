import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lagoon_app/Authentication/auth_service.dart';
import 'package:lagoon_app/Main/app_pallette.dart';
import 'package:lagoon_app/Main/pages/qr_scanner_page.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';


class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  void openQRScan(BuildContext context) async {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => QrScannerPage()),
      );

      if (result != null) {
        log('Résultat du QR Code : $result');
      }

  }

  Future<bool> isPhone() async {
    final deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        return androidInfo.isPhysicalDevice;
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        return iosInfo.isPhysicalDevice;
      }

      return false;

    } catch (e) {
      log("Erreur lors de la détection de l’émulateur : $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const SizedBox(height: 300),

          Text(
            'Accueil',
            style: TextStyle(
              color: AppPallette.textColor1,
              fontSize: 35,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 70),

          IconButton(
            onPressed: () async {
              if(await isPhone()){
                openQRScan(context);
                return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Scan de QR code indisponible")),
                );
                return;
              }
              openQRScan(context);
            },

            icon: Icon(Icons.qr_code_rounded,
              size: 45,
            ),
          ),

          const SizedBox(height: 230),


        ],
      ),
    );
  }
}
