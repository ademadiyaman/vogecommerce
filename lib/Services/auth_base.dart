import 'package:vog_demo/Models/admins.dart';
import 'package:vog_demo/Models/user.dart';

abstract class AuthBase {
  Future<Uzer?> currentUser();
  Future<Admins?> adminCurrentUser();
  Future<Uzer?> signInWithGoogle();
  Future<Admins?> adminSignInWithGoogle();
  Future<bool?> signOut();
}
