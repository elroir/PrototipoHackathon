import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapaPage extends StatefulWidget {

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  String tipoMapa = 'streets' ;
  MapController map = new MapController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Bolivia'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){
              map.move(LatLng(-17.7862892, -63.1811714), 15);
            },
          )
        ],
      ),
      body: _crearFlutterMap(),
      floatingActionButton: _crearBotonFlotante(context),
    );
  }
  Widget _crearBotonFlotante(BuildContext context){
    return FloatingActionButton(
      child: Icon(Icons.repeat),
      backgroundColor: Colors.green,
      onPressed: (){
        //Tipos de mapa: streets,dark,light,outdoors,satellite
        switch(tipoMapa) {
          case 'streets': {
            tipoMapa = 'dark';
          }
          break ;
          case 'dark': {
            tipoMapa = 'light';
          }
          break;
          break ;
          case 'light': {
            tipoMapa = 'outdoors';
          }
          break;
          break ;
          case 'outdoors': {
            tipoMapa = 'satellite';
          }
          break;
          break ;
          case 'satellite': {
            tipoMapa = 'streets';
          }
          break;
        }
        setState(() {});
      },
    );
  }
  Widget _crearFlutterMap (){
    return FlutterMap(
      mapController: map,
      options: MapOptions(
        center: LatLng(-17.7862892, -63.1811714),
        zoom: 12,
      ),
      layers: [
        _crearMapa(),
        _crearArea(-17.7862892, -63.1811714, 300.0),
        _crearArea(-17.7822792, -63.1851214, 200.0),
        _crearArea(-17.7322792, -63.1451214, 150.0),
      ],

    );
  }

  _crearMapa(){
    return TileLayerOptions(
      urlTemplate: "https://api.mapbox.com/v4/"
          "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
      additionalOptions: {
        'accessToken': 'pk.eyJ1IjoiZWxyb2lyIiwiYSI6ImNrOGF2NmU3cDAyNXUzZGthZzk0dHlxcHgifQ.0WJEopvEOpOJEUsQ5_wdNA',
        'id': 'mapbox.$tipoMapa',
        //Tipos de mapa: streets,dark,light,outdoors,satellite
      }
    );
  }
  _crearArea(double lat,double long,double radio){
    return CircleLayerOptions(
      circles: <CircleMarker>[
        CircleMarker(
            point: LatLng(lat, long),
            radius: radio,
            useRadiusInMeter: true,
            color: Colors.transparent,
            borderColor: Colors.red,
            borderStrokeWidth: 5.0)
      ]
    );
  }
  _crearMarcadores(){
    return MarkerLayerOptions(
      markers: <Marker>[
        Marker(
          width: 100.0,
          height: 100.0,
          point: LatLng(-17.7862892, -63.1811714),
          builder: (context) => Container(
            child: Icon(Icons.location_on,size: 45.0,
            color: Theme.of(context).primaryColor,),
          )
        )
      ]
    );
  }
  getLatLng(String valor){
    final latlng = valor.substring(4).split(',');
    final lat = double.parse(latlng[0]);
    final lng = double.parse(latlng[1]);

    return LatLng(lat,lng);
  }
}
