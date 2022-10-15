import 'package:flutter/material.dart';

class FavorilerPage extends StatefulWidget {
  const FavorilerPage({Key? key}) : super(key: key);

  @override
  _FavorilerPageState createState() => _FavorilerPageState();
}

class _FavorilerPageState extends State<FavorilerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Burası Favoriler Sayfası",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
