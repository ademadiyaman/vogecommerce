import 'package:vog_demo/Models/admins.dart';
import 'package:vog_demo/Models/user.dart';
import 'package:vog_demo/Resources/admin_auth_methods.dart';
import 'package:vog_demo/Resources/auth_methods.dart';
import 'package:vog_demo/Services/auth_base.dart';
import 'package:vog_demo/Services/firebase_auth_service.dart';
import 'package:vog_demo/locator.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  final AuthMethods _authMethods = AuthMethods();
  final AdminAuthMethods _adminAuthMethods = AdminAuthMethods();

  AppMode appMode = AppMode.RELEASE;
  @override
  Future<Uzer?> currentUser() async {
    if (appMode == AppMode.RELEASE) {
      Uzer? _user = await _firebaseAuthService.currentUser();
      if (_user != null) {
        return await _authMethods.readUser(_user.uid);
      } else {
        await _firebaseAuthService.signOut();
        return null;
      }
    }
  }

  @override
  Future<Uzer?> signInWithGoogle() async {
    if (appMode == AppMode.RELEASE) {
      Uzer? _user = await _firebaseAuthService.signInWithGoogle();
      if (_user != null) {
        bool? _sonuc = await _authMethods.saveUser(_user);
        if (_sonuc) {
          return await _authMethods.readUser(_user.uid);
        }
      } else {
        await _firebaseAuthService.signOut();
        return null;
      }
    } else
      return null;
  }

  @override
  Future<Admins?> adminSignInWithGoogle() async {
    if (appMode == AppMode.RELEASE) {
      Admins? _adminUser = await _firebaseAuthService.adminSignInWithGoogle();
      if (_adminUser != null) {
        bool? _sonuc = await _adminAuthMethods.adminSaveUser(_adminUser);
        if (_sonuc) {
          return await _adminAuthMethods.adminReadUser(_adminUser.adminID);
        }
      } else {
        await _firebaseAuthService.signOut();
        return null;
      }
    } else
      return null;
  }

  @override
  Future<bool?> signOut() async {
    if (appMode == AppMode.RELEASE) {
      return await _firebaseAuthService.signOut();
    }
  }

  @override
  Future<Admins?> adminCurrentUser() async {
    if (appMode == AppMode.RELEASE) {
      Admins? _adminUser = await _firebaseAuthService.adminCurrentUser();
      if (_adminUser != null) {
        return await _authMethods.adminReadUser(_adminUser.adminID);
      } else {
        await _firebaseAuthService.signOut();
        return null;
      }
    }
  }
}
