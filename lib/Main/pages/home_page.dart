import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lagoon_app/Authentication/auth_service.dart';
import 'package:lagoon_app/Main/app_pallette.dart';
import 'package:lagoon_app/Main/pages/account_widget.dart';
import 'package:lagoon_app/Main/pages/home_widget.dart';
import 'package:lagoon_app/Main/pages/settings_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  void setIndex(int newIndex){
    setState(() {
      currentIndex = newIndex;
    });
  }

  final Set<Widget> pages = {
    HomeWidget(),
    AccountWidget(),
    SettingsWidget()
  };

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppPallette.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: setIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppPallette.gradiant2,
        selectedIconTheme: IconThemeData(size: 28),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        unselectedItemColor: AppPallette.textColor3,
        backgroundColor: AppPallette.backgroundColor2,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Compte'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Paramètres'),
        ],
      ),

      body: SafeArea(
        child: pages.elementAt(currentIndex),
      ),
    );
  }
}
