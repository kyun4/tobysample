import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';

class AuthServices extends ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  } // signInWithEmailAndPassword

  String generateId() {
    final uuid = new Uuid();
    return uuid.v4();
  }

  String generateRandomCharacters(int length) {
    const characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    return String.fromCharCodes(
        Iterable.generate(length, (_) => random.nextInt(characters.length))
            .map((index) => characters.codeUnitAt(index)));
  } //  generateRandomCharacters

  Future<UserCredential> signUpWithEmailAndPassword(String email,
      String password, String firstname, String lastname, String phone) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      String fuid = generateId();

      final datetimenow = DateTime.now();
      final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
      String datetimenow_formatted = formatter.format(datetimenow);

      String ref_code = generateRandomCharacters(7);
      String barcode = generateRandomCharacters(12);
      String qrcode = generateRandomCharacters(20);

      _firebaseFirestore.collection('user_list').doc(fuid).set({
        'user_id': generateId(),
        'barcode': barcode,
        'qrcode': qrcode,
        'firstname': firstname,
        'lastname': lastname,
        'phone': phone,
        'email': email,
        'referal_code': ref_code,
        'date_time_registered': datetimenow_formatted,
        'date_time_verified': ''
      }, SetOptions(merge: true));

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  } // signUpWithEmailAndPassword

  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  } // signOut()
}
