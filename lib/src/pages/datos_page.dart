import 'package:flutter/material.dart';

class DatosPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Datos personales'),
          backgroundColor: Colors.green,
        ),
       body: Column(
         children: <Widget>[
           Text('Datos'),
         ],
       ),
    );
  }
}