import 'package:flutter/material.dart';

import 'package:chat_flutter/widgets/boton_azul.dart';
import 'package:chat_flutter/widgets/custom_label.dart';
import 'package:chat_flutter/widgets/custom_logo.dart';
import 'package:chat_flutter/widgets/custom_input.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xffF2F2F2),
     body: SafeArea(
       child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
         child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
           child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                CustomLogo(titulo:'Messenger'),
                _From(),
                CustomLabel(ruta: 'register',titulo: 'No tienes cuenta?',subTitulo: 'Crea una ahora!',),
                Text('Terminos y condiciones de uso',style: TextStyle(fontWeight: FontWeight.w200,),)
            ],
           ),
         ),
       ),
     ),
    );
  }
}
class _From extends StatefulWidget {
  const _From({super.key});

  @override
  State<_From> createState() => __FromState();
}

class __FromState extends State<_From> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.only(top: 40),
       padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [ 
          CustomInput(
            icon: Icons.mail_outlined,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
         CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Password',
            isPassword: true,
            textController: passCtrl,
          ),
          //TODO: Crear boton
          BotonAzul( text:'Ingrese',onPressed:(){
            print(emailCtrl.text);
            print(passCtrl.text);
          },),
],
      ),
    );
  }
}
