import 'dart:io';

import 'package:chat_flutter/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin{
  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();
  bool _estaEscribiendo = false;
  List<ChatMessage> _message = [];
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      title: Column(
        children: [ 
          CircleAvatar(
            child: Text('Te',style: TextStyle(fontSize: 12),),
            backgroundColor: Colors.blue[100],
            maxRadius: 14,
          ),
          SizedBox(height: 3,),
          Text('Melissa Flores',style: TextStyle(color:Colors.black87,fontSize: 12 ),)
        ],
      ),
      centerTitle: true,
      elevation: 1.0,
    ),
     body: Container(
      child: Column(
        children: [ 
          Flexible(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _message.length,
              itemBuilder: (_,i)=>_message[i],
              reverse: true,)
          ),
          Divider(height: 1,),
          //caja de texto
          Container(
            color: Colors.white,
            
            child: _inputChat(),
          )
        ],
      ),
     ),
    );
  }

  Widget _inputChat(){
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String texto) {
                  //Todo: Cuando hay valor, para poder poster
                  setState((){
                    if( texto.trim().length > 0){
                      _estaEscribiendo = true;
                    }else{
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar mensaje'),
                  focusNode: _focusNode,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: 
                  Platform.isIOS 
                  ? CupertinoButton(
                    child: Text('Enviar'),

                        onPressed: _estaEscribiendo?
                        ()=>_handleSubmit(_textController.text.trim()):null, 
                      
                    )
                   : Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.blue[400]),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: _estaEscribiendo?
                        ()=>_handleSubmit(_textController.text.trim()):null, 
                      icon: Icon(Icons.send)),
                    ),
                   ),
            )
          ],
        ),
      ));
     
  } 
  dynamic _handleSubmit(String texto){
        if(texto.length ==0 ) return;
        _textController.clear();
        this._focusNode.requestFocus();
        final newMessage = new ChatMessage(
          uid:'123',
          texto:texto,
          animationController: AnimationController(vsync: this,duration: Duration(milliseconds: 400)),);
        _message.insert(0,newMessage);
        newMessage.animationController.forward();
        setState((){
           _estaEscribiendo = false;
        });
      }
      @override
  void dispose() {
    //TODO: off del socket
    for(ChatMessage message in _message){
      message.animationController.dispose();
    }
    // TODO: implement dispose
    super.dispose();
  }
}