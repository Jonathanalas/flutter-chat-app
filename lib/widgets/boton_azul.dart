import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const BotonAzul({super.key, required this.text, required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue)),
            onPressed: this.onPressed,
        child: Container(
          width: double.infinity,
          height: 55,
          child: Center(
            child: Text(
              'Ingresar',
              style: TextStyle(color: Colors.white, fontSize: 17.5),
            ),
          ),
        ));
  }
}
