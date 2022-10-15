import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vog_demo/Resources/auth_methods.dart';
import 'package:vog_demo/Screens/sepetim.dart';
import 'package:vog_demo/ViewModels/user_model.dart';

class HesabimPage extends StatefulWidget {
  const HesabimPage({Key? key}) : super(key: key);

  @override
  _HesabimPageState createState() => _HesabimPageState();
}

class _HesabimPageState extends State<HesabimPage> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    UserModel _userModel = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Text(
          "Hesabım",
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 22,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: _userModel.uzer!.profilePhoto!,
                  height: 130,
                  width: 130,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Icon(
                  Icons.mail_outline,
                  color: Colors.black,
                  size: 34,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 11),
                    child: Text(
                      _userModel.uzer!.eMail,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 11),
                    child: Text(
                      "Mail Adresiniz",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Card(
              elevation: 1,
              margin: EdgeInsets.zero,
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SepetimPage(),
                  ));
                },
                child: ListTile(
                  title: Text(
                    "Siparişlerim",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  leading: Icon(Icons.shopping_cart_outlined),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Card(
              margin: EdgeInsets.zero,
              color: Colors.white,
              child: ListTile(
                title: Text(
                  "Favorilerim",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                leading: Icon(Icons.favorite_border_outlined),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Card(
              margin: EdgeInsets.zero,
              color: Colors.white,
              child: ListTile(
                title: Text(
                  "Adreslerim",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                leading: Icon(Icons.home),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Card(
              margin: EdgeInsets.zero,
              color: Colors.white,
              child: ListTile(
                title: Text(
                  "Destek Taleplerim",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                leading: Icon(Icons.support_agent),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Card(
              margin: EdgeInsets.zero,
              color: Colors.white,
              child: ListTile(
                title: Text(
                  "Ayarlarım",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                leading: Icon(Icons.settings),
              ),
            ),
          ),
          InkWell(
            onTap: () => _authMethods.signOut(context),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextButton(
                onPressed: () => _authMethods.signOut(context),
                child: Center(
                    child: Text(
                  "Çıkış Yap",
                  style: TextStyle(fontSize: 15, color: Colors.red),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
