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
      log('✅ Data saved for user $uid');
    } catch (e) {
      log('❌ Failed to save user data: $e');
    }
  }

  Future<String?> loadUserFirstName(String uid) async {

    try{
      log((await FirebaseFirestore.instance.collection('users').doc(uid).get(GetOptions())) as String);
    }catch (e) {
      log('❌ New error data: $e');
    }

    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        log('✅ Data loaded: $data');
        return data['firstName'] as String?;
      } else {
        log('⚠️ Document does not exist for uid $uid');
        return null;
      }
    } catch (e) {
      log('❌ Error loading user data: $e');
      return null;
    }
  }
}