import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prototipohackathon/src/pages/mapa_page.dart';


class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-17.7862892, -63.1811714),
    zoom: 12.4746,
  );


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Bolivia'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){},
          )
        ],
      ),

      body: GoogleMap(
        myLocationButtonEnabled: true,
        mapType: MapType.normal,

        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            final route = MaterialPageRoute(
                builder: (context) {
                  return MapaPage();
                }
            );
            Navigator.push(context, route);
          },
        backgroundColor: Colors.green,
          label: Text('Mapa de los casos'),
          icon: Icon(Icons.new_releases),),

    );
  }


}