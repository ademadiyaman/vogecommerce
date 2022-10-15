import 'package:flutter/material.dart';

class SepeteEkle extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const SepeteEkle({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(1),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 12),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          fixedSize: const Size(150, 22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1),
            side: const BorderSide(color: Colors.green),
          ),
        ),
      ),
    );
  }
}
