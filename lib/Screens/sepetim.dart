import 'package:flutter/material.dart';

class SepetimPage extends StatefulWidget {
  const SepetimPage({Key? key}) : super(key: key);

  @override
  _SepetimPageState createState() => _SepetimPageState();
}

class _SepetimPageState extends State<SepetimPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Burası Sepetim Sayfası", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
      ),
    );
  }
}
