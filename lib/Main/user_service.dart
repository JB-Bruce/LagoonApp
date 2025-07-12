import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

ValueNotifier<UserService> userService = ValueNotifier(UserService());

class UserService {

  String? name = '';

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