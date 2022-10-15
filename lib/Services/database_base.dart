import 'package:vog_demo/Models/admins.dart';
import 'package:vog_demo/Models/user.dart';

abstract class DbBase {
  Future<bool> saveUser(Uzer? user);
  Future<bool> adminSaveUser(Admins? user);
  Future<Uzer?> readUser(String? userID);
  Future<Admins?> adminReadUser(String? userID);
}
