import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vog_demo/Models/admins.dart';
import 'package:vog_demo/Models/user.dart';
import 'package:vog_demo/Repository/user_repository.dart';
import 'package:vog_demo/Services/auth_base.dart';
import 'package:vog_demo/locator.dart';

enum ViewState { Idle, Busy }

class AdminModel with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.Idle;
  UserRepository _userRepository = locator<UserRepository>();
  Admins? _uzer;

  Admins? get uzer => _uzer;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  AdminModel() {
    adminCurrentUser();
  }

  @override
  Future<Admins?> adminCurrentUser() async {
    try {
      state = ViewState.Busy;
      _uzer = await _userRepository.adminCurrentUser();
      return _uzer;
    } catch (e) {
      debugPrint('VMdeki Current Userda Hata:' + e.toString());
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<Admins?> adminSignInWithGoogle() async {
    try {
      state = ViewState.Busy;
      _uzer = await _userRepository.adminSignInWithGoogle();
      if (_uzer != null)
        return _uzer;
      else
        return null;
    } catch (e) {
      debugPrint('VMdeki Current Userda Hata:' + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool?> signOut() async {
    try {
      state = ViewState.Busy;
      return await _userRepository.signOut();
    } catch (e) {
      debugPrint('VMdeki Current Userda Hata:' + e.toString());
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<Uzer?> currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }

  @override
  Future<Uzer?> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
}
