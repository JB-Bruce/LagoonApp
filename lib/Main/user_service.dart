import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

ValueNotifier<UserService> userService = ValueNotifier(UserService());

class UserService {

  String version = '0.1.0';

  String? name = '';

  bool isDarkTheme = false;

  Future<void> saveUserData(String uid, String firstName) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'firstName': firstName,
      }, SetOptions(merge: true));
      name = firstName;
    } catch (e) {
      log('Info : Firestore not connected');
    }
  }

  Future<bool> isAlreadyParticipant(String uid) async {
    final doc = await FirebaseFirestore.instance
        .collection('participants')
        .doc(uid)
        .get();

    return doc.exists;
  }

  Future<Map<String, dynamic>?> getRandomWinner() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('participants')
          .get();

      final docs = snapshot.docs;

      if (docs.isEmpty) return null;

      final randomIndex = Random().nextInt(docs.length);
      final chosenDoc = docs[randomIndex];

      final data = chosenDoc.data();

      data['uid'] = chosenDoc.id;

      return data;
    } catch (e) {
      log("Erreur lors du tirage : $e");
      return null;
    }
  }

  Future<bool> isParticipantsEmpty() async{
    final snapshot = await FirebaseFirestore.instance
        .collection('participants')
        .get();

    final docs = snapshot.docs;

    if (docs.isEmpty) return true;

    return false;
  }

  Future<void> addParticipant(String uid, String email, String name) async {
    await FirebaseFirestore.instance
        .collection('participants')
        .doc(uid)
        .set({
      'email': email,
      'name': name,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> deleteAllParticipants() async {
    final collection = FirebaseFirestore.instance
        .collection('participants');

    final snapshot = await collection.get();

    for (final doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  Future<void> loadUserFirstName(String uid) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        name = data['firstName'] as String?;
        return;
      } else {
        log('⚠️ Document does not exist for uid $uid');
        name = '';
        return;
      }
    } catch (e) {
      log('Info : Firestore not connected');
      name = '';
      return;
    }
  }
}