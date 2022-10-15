import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vog_demo/Models/admins.dart';
import 'package:vog_demo/Models/user.dart';
import 'package:vog_demo/Services/database_base.dart';

class AdminAuthMethods implements DbBase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseAuth _adminAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //Uzer? _uzer;

  Stream<User?> get authChanges => _auth.authStateChanges();
  User get admin => _auth.currentUser!;

  Admins _userFromFirebase(User? user) {
    if (user == null) null;
    return Admins(adminEmail: admin.email!, adminID: admin.uid);
  }

  @override
  Future<bool> saveUser(Uzer? user) async {
    bool res = false;
    Uzer? uzer;

    Map<String, dynamic> _eklenecekUzerMap = user!.toMap();
    await _firestore.collection("users").doc(user.uid).set(user.toMap());

    DocumentSnapshot _okunanUser =
        await FirebaseFirestore.instance.doc("users/${user.uid}").get();

    Map<String, dynamic> _okunanUserBilgileriMap =
        _okunanUser.data() as Map<String, dynamic>;
    Uzer? _okunanUserNesnesi = Uzer.fromMap(_okunanUserBilgileriMap);
    print("Okunan user nesnesi :" + _okunanUserNesnesi.toString());
    return true;
  }

  @override
  Future<bool> adminSaveUser(Admins? admin) async {
    Map<String, dynamic> _eklenecekUzerMap = admin!.toMap();
    await _firestore.collection("admins").doc(admin.adminID).set(admin.toMap());

    DocumentSnapshot _okunanUser =
        await FirebaseFirestore.instance.doc("admins/${admin.toMap()}").get();

    Map<String, dynamic> _okunanUserBilgileriMap =
        _okunanUser.data() as Map<String, dynamic>;
    Admins? _okunanUserNesnesi = Admins.fromMap(_okunanUserBilgileriMap);
    print("Okunan user nesnesi :" + _okunanUserNesnesi.toString());
    return true;
  }

  @override
  Future<Uzer?> readUser(String? userID) async {
    DocumentSnapshot _okunanUser =
        await _firestore.collection("users").doc(userID).get();
    Map<String, dynamic> _okunanUserBilgileriMap =
        _okunanUser.data() as Map<String, dynamic>;
    Uzer? _okunanUserNesnesi = Uzer.fromMap(_okunanUserBilgileriMap);
    print("Okunan user nesnesi :" + _okunanUserNesnesi.toString());
    return _okunanUserNesnesi;
  }

  Future<bool?> signInWithGoogle(Admins user, BuildContext context) async {
    bool res = false;
    Uzer? uzer;
    try {
      Map<String, dynamic> _eklenecekUzerMap = user.toMap();

      DocumentSnapshot _okunanUser =
          await FirebaseFirestore.instance.doc("admins/${user.adminID}").get();

      if (_okunanUser.data() == null) {
        await _firestore
            .collection("admins")
            .doc(user.adminID)
            .set(user.toMap());
        return true;
      } else {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print("Hata gardaşşş" + e.toString());
      res = false;
    }
    /*
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();

    if (_googleUser != null) {
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
        await _auth.signInWithCredential(GoogleAuthProvider.credential(
            idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken),
            UserCredential userCredential =
            await _auth.signInWithCredential(credential),
            );

      }*/
  }

  void signOut(BuildContext context) async {
    try {
      final _googleSignIn = GoogleSignIn();
      await _googleSignIn.signOut();
      await _auth.signOut();
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<Admins?> adminReadUser(String? userID) async {
    DocumentSnapshot _okunanUser =
        await _firestore.collection("admins").doc(userID).get();
    Map<String, dynamic> _okunanUserBilgileriMap =
        _okunanUser.data() as Map<String, dynamic>;
    Admins? _okunanUserNesnesi = Admins.fromMap(_okunanUserBilgileriMap);
    print("Okunan user nesnesi :" + _okunanUserNesnesi.toString());
    return _okunanUserNesnesi;
  }
}
