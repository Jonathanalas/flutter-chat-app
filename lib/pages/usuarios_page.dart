import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chat_flutter/models/usuario.dart';

class UsuariosPage extends StatefulWidget {
  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  RefreshController _refreshController =RefreshController(initialRefresh: false);
  final usuarios =[
    Usuario(uid:'1',nombre: 'Maria',email: 'test1@test.com',online: true),
    Usuario(uid:'2',nombre: 'Melissa',email: 'test2@test.com',online: false),
    Usuario(uid:'3',nombre: 'Fernando',email: 'test3@test.com',online: false),
  ];
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Mi Nombre',style: TextStyle(color: Colors.black54),),
      elevation: 1,
      backgroundColor: Colors.white,
      leading: IconButton(
        //style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.black54)),
        icon: Icon(Icons.exit_to_app,color:Colors.black54 ,),
        onPressed: (){

        },
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Icon(Icons.check_circle,color: Colors.blue[400],),
          //child: Icon(Icons.offline_bolt,color: Colors.red,),
        )
      ],
    ),
     body: SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      enablePullUp: true,
      onRefresh: _cargaUsuarios,
      header: WaterDropHeader(
        complete: Icon(Icons.check,color: Colors.blue[400],),
        waterDropColor: Colors.blue,
      ),
     child: _listViewUsuarios(),
     ),
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (_,i)=> _usuarioListTitle(usuarios[i]),
    separatorBuilder: (_,i)=>Divider(), 
    itemCount: usuarios.length);
  }

  ListTile _usuarioListTitle(Usuario usuario) {
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
        child: Text(usuario.nombre.substring(0,2)),
        backgroundColor: Colors.blue[100],
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: usuario.online ? Colors.green[300] : Colors.red,
          borderRadius: BorderRadius.circular(100) 
        ),
      ),
      );
  }
  _cargaUsuarios()async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}