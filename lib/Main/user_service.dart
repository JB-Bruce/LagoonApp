import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

ValueNotifier<UserService> userService = ValueNotifier(UserService());

class UserService {

  Future<void> saveUserData(String uid, String firstName) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'firstName': firstName,
      }, SetOptions(merge: true));
    } catch (e) {
      log('Info : Firestore not connected');
    }
  }

  Future<String?> loadUserFirstName(String uid) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        return data['firstName'] as String?;
      } else {
        log('⚠️ Document does not exist for uid $uid');
        return null;
      }
    } catch (e) {
      log('Info : Firestore not connected');
      return null;
    }
  }
}