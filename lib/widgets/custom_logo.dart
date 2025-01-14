import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  final String titulo;
  const CustomLogo({super.key, required this.titulo});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        width: 170,
        child: Column(
          children: [ 
            Image(image: AssetImage('assets/tag-logo.png')),
            SizedBox(height: 20.0,),
            Text(this.titulo,style: TextStyle(fontSize: 30),)
          ],
        ),
      ),
    );
  }
}



  