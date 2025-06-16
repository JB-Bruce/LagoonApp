import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:lagoon_app/Authentication/Pages/email_sent_page.dart';
import 'package:lagoon_app/Authentication/Pages/loading_page.dart';
import 'package:lagoon_app/Authentication/auth_service.dart';
import 'package:lagoon_app/Main/home_page.dart';
import 'firebase_options.dart';

import 'Authentication/Pages/login_page.dart';
import 'Authentication/Pages/signin_page.dart';
import 'Main/app_pallette.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ValueListenableBuilder(
        valueListenable: authService,
        builder: (context, authService, child) {
          return StreamBuilder(
            stream: authService.authStateChanges,
            builder: (context, snapshot) {
              Widget widget;

              if(snapshot.connectionState == ConnectionState.waiting){
                widget = LoadingPage();
              } else if(snapshot.hasData){
                if(snapshot.data!.emailVerified){
                  widget = const HomePage();
                }else{
                  widget = const EmailSentPage();
                }
              }else{
                widget = LoginPage();
              }

              return widget;
            },
          );
        },
      ),
      theme: ThemeData.dark(),
      routes: {
        '/signin': (context) => SigninPage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}


