import 'package:flutter/material.dart';
import 'package:prototipohackathon/src/pages/datos_page.dart';
import 'package:prototipohackathon/src/pages/estadisticas_page.dart';
import 'package:prototipohackathon/src/pages/map_page.dart';

class AppMain extends StatefulWidget {
  @override
  _AppMainState createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _callPage(currentIndex),
      bottomNavigationBar: _createBottomNavigationBar(),
    );
  }

  Widget _callPage(int paginaActual) {

    switch ( paginaActual){
      case 0: return MapSample();
      case 1: return DatosPage();
      case 2: return EstadisticasPage();
    }

  }

  Widget _createBottomNavigationBar(){
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
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
            icon: Icon(Icons.insert_chart),
            title: Text('Estadisticas')
        ),
      ],
    );
  }
}