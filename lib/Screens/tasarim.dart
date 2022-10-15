import 'package:flutter/material.dart';

class TasarimPage extends StatefulWidget {
  const TasarimPage({Key? key}) : super(key: key);

  @override
  _TasarimPageState createState() => _TasarimPageState();
}

class _TasarimPageState extends State<TasarimPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Burası Tasarım Sayfası", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
      ),
    );
  }
}
