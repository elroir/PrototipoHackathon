
import 'dart:convert';

import 'package:prototipohackathon/src/models/informacion_model.dart';
import 'package:http/http.dart' as http;
class InformacionProvider {
  final String _url = "https://hackathon-1585035007043.firebaseio.com";

  Future<bool> createInfo( InformacionModel info) async {
    final url = "$_url/info";
    final resp = await http.post(url,body: informacionModelToJson(info));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

}