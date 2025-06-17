import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lagoon_app/Authentication/auth_service.dart';
import 'package:lagoon_app/Main/app_pallette.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

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

          const SizedBox(height: 300),


        ],
      ),
    );
  }
}
