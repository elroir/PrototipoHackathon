
import 'package:flutter/material.dart';
import 'package:prototipohackathon/src/pages/input_datos_page.dart';

class DatosPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Covid-19 Bolivia'),
          backgroundColor: Colors.green,
        ),
       body: ListView(

         children: <Widget>[
           SizedBox(height:15.0,),
           Text('Datos Personales: ',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,)),
           SizedBox(height:10.0,),
           Text('Nombre\s: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,)),
           Text('Gerson',style: TextStyle(fontSize: 13)),
           Text('Apellidos: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,)),
           Text('Oliva Rojas',style: TextStyle(fontSize: 13)),
           Text('Fecha de nacimiento: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,)),
           Text('02/Mar/1998',style: TextStyle(fontSize: 13)),
           Text('Tipo de sangre: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,)),
           Text('',style: TextStyle(fontSize: 13)),
           SizedBox(height:10.0,),
           FlatButton(
             child: Text('Introducir datos'),
             color: Colors.green,
             onPressed: (){
               final route = MaterialPageRoute(
                   builder: (context) {
                     return InputPage();
                   }
               );
               Navigator.push(context, route);
             },
           ),
           Divider(),
           Text('Sintomas del Covid-19: ',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,)),
           SizedBox(height:10.0 ,),
           Text('Fiebre mayor a 37.5',style: TextStyle(fontSize: 16,)),
           Text('Tos',style: TextStyle(fontSize: 16,)),
           Text('Dolor de garganta',style: TextStyle(fontSize: 16,)),
           Text('Dificultad para respirar(casos graves)',style: TextStyle(fontSize: 16,)),
           //_informacion('Sintomas del Covid-19','Fiebre mayor a 37.5, Tos , Dolor de garganta, Dificultad para respirar(casos graves)'),
           Divider(),
           Text('Si usted presenta estos sintomas, por favor llamar a: ',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,)),
           SizedBox(height:10.0 ,),
           _contacto(),
         ],
       ),
    );
  }
  Widget _contacto() {
    return Card (
      elevation: 2,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_circle, color: Colors.blue,),
            title: Text('Sedes'),
            subtitle: Text('Si sospecha que puede tener el virus, puede ponerrse en contacto con el SEDES'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Icon(Icons.call, color: Colors.blue),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('77521478'),
                onPressed: null,
              )
            ],
          )
        ],
      ),
    );
  }
  Widget _informacion(String titulo,String subtitulo) {
    return Card (
      elevation: 2,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(titulo),
            subtitle: Text(subtitulo),
          ),
        ],
      ),
    );
  }


}