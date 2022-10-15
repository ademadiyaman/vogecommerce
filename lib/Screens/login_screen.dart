import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vog_demo/Models/admins.dart';
import 'package:vog_demo/Models/user.dart';
import 'package:vog_demo/Screens/demo.dart';
import 'package:vog_demo/ViewModels/admin_model.dart';
import 'package:vog_demo/ViewModels/user_model.dart';
import 'package:vog_demo/Widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Text(
              "Giriş Yap & Kayıt Ol",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CustomButton(
            text: 'Google ile Giriş',
            onPressed: () => _googleIleGiris(context),
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            "Admin Girişi",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          CustomButton(
            text: 'Google ile Giriş',
            onPressed: () => _adminGoogleIleGiris(context),
          ),
        ],
      ),
    );
  }

  void _googleIleGiris(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    Uzer? _user = await _userModel.signInWithGoogle();
    if (_user != null) print("Oturum Açan User ID:" + _user.uid.toString());
  }

  void _adminGoogleIleGiris(BuildContext context) async {
    final _adminModel = Provider.of<UserModel>(context, listen: false);
    Admins? _uzer = await _adminModel.adminSignInWithGoogle();
    if (_uzer != null) print("Oturum Açan User ID:" + _uzer.adminID.toString());
  }
}
