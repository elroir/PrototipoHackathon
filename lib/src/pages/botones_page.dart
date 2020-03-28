import 'package:flutter/material.dart';
import 'package:prototipohackathon/src/pages/map_page.dart';

class BotonesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: Stack(
        children: <Widget>[
          MapSample()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title:Text('Mapa')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('Informacion')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text('Contactos')
          ),
        ],
      ),
    );
  }
}