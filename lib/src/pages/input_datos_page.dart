import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
   String _nombre;
   String _fecha = '';
   TextEditingController _inputFieldDateController = new TextEditingController();
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
        children: <Widget>[
          SizedBox(height: 20),
          _crearInput('Nombres','Nombrdes'),
          Divider(),
          _crearInput('Apellidos','Apellidos'),
          Divider(),
          _crearInput('ORH+','Tipo de sangre'),
          Divider(),
          _crearFecha(context),
        ],
      ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Navigator.pop(context);
          },
          backgroundColor: Colors.blue,
          label: Text('Guardar'),
          icon: Icon(Icons.save),)
    );
  }

  Widget _crearInput(String HintT,String LabelT) {

      return TextField(
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: HintT,
          labelText: LabelT
        ),
        onChanged: (valor){
          setState(() {
            _nombre = valor;
          });
        },
      );
  }
   Widget _crearFecha(BuildContext context) {

     return TextField(
       enableInteractiveSelection: false,
       controller: _inputFieldDateController,
       decoration: InputDecoration(
           border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(20.0)
           ),
           hintText: 'Fecha de nacimiento',
           suffixIcon: Icon(Icons.calendar_today),
           labelText: 'Fecha de nacimiento'
       ),
       onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
       },
     );
   }
   _selectDate(BuildContext context) async {
      DateTime picked = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(1930),
          lastDate: new DateTime.now()
      );

      if (picked != null) {
        setState(() {
          _fecha = picked.toString();
          _inputFieldDateController.text = _fecha;
        });
      }
   }





}