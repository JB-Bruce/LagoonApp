import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lagoon_app/Authentication/Pages/loading_page.dart';
import 'package:lagoon_app/Authentication/auth_service.dart';
import 'package:lagoon_app/Main/app_pallette.dart';
import 'package:lagoon_app/Main/pages/account_widget.dart';
import 'package:lagoon_app/Main/pages/admin_widget.dart';
import 'package:lagoon_app/Main/pages/home_widget.dart';
import 'package:lagoon_app/Main/pages/settings_widget.dart';
import 'package:lagoon_app/Main/theme_notifier.dart';
import 'package:lagoon_app/Main/user_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<bool>? isAdminFuture;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    isAdminFuture = isAdmin(authService.value.currentUser!.email!);
    userService.value.loadUserFirstName(authService.value.currentUser!.uid);
  }

  void setIndex(int newIndex){
    setState(() {
      currentIndex = newIndex;
    });
  }

  Future<bool> isAdmin(String email) async {
    final doc = await FirebaseFirestore.instance.collection('admins').doc(email).get();
    return doc.exists;
  }



  @override
  Widget build(BuildContext context) {


    
    return FutureBuilder<bool>(
      future: isAdminFuture,

      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        }

        if (snapshot.hasError) {
          return Center(child: Text("Erreur")); //TODO Remplacer par page erreur
        }

        final isAdminUser = snapshot.data ?? false;

        final pages = isAdminUser
            ? [HomeWidget(), AdminWidget(), AccountPage(), SettingsWidget()]
            : [HomeWidget(), AccountPage(), SettingsWidget()];

        return ValueListenableBuilder(
          valueListenable: themeNotifier,
          builder: (context, value, child) {
            return Scaffold(
              backgroundColor: appColor.backgroundColor,
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: setIndex,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: appColor.gradiant2,
                selectedIconTheme: IconThemeData(size: 28),
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
                unselectedItemColor: appColor.textColor3,
                backgroundColor: appColor.backgroundColor2,

                items: isAdminUser ?
                [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
                  BottomNavigationBarItem(icon: Icon(Icons.security), label: 'Admin'),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Compte'),
                  BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Paramètres'),
                ] :
                [
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
        );
      },
    );
  }
}
