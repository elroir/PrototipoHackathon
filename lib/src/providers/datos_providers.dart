import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prototipohackathon/src/models/datos_model.dart';

class DatosProvider {

  Future <List> cargarDatos() async {
    final url = 'https://coronavirus-tracker-api.herokuapp.com/v2/locations/26';
    final resp = await http.get(url);
    final List<int> datos = new List();
    final Map<String, dynamic> decodedData = json.decode(resp.body);
   // if (decodedData == null) return [];
    datos.add(decodedData['location']['latest']['confirmed']);
    datos.add(decodedData['location']['latest']['deaths']);
    datos.add(decodedData['location']['latest']['recovered']);


    return datos;

  }


}