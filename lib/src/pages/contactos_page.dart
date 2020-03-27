import 'package:flutter/material.dart';

class ContactosPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Contactos'),
          backgroundColor: Colors.green,
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            SizedBox(height: 20.0,),
            _contacto1(),
            _contacto2()
          ],
        )
    );
  }

 Widget _contacto1() {
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

  Widget _contacto2() {
    return Card (
      elevation: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
}