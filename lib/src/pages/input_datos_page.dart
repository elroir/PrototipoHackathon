import 'package:flutter/material.dart';
import 'package:prototipohackathon/src/models/informacion_model.dart';
import 'package:prototipohackathon/src/utils/utils.dart' as utils;

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

   final formKey = GlobalKey<FormState>();
   InformacionModel informacion = new InformacionModel();
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0) ,
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              _crearInputString('Nombres','Nombres',informacion.nombres),
              Divider(),
              _crearInputString('Apellidos','Apellidos',informacion.apellidos),
              Divider(),
              _crearInputNumeric('Cedula de identidad','Ci',informacion.ci),
              Divider(),
              _crearFecha(context),
            ],
          ),
        ),
      ),


        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            _submit();

          },
          backgroundColor: Colors.blue,
          label: Text('Guardar'),
          icon: Icon(Icons.save),)
    );
  }

  Widget _crearInputString(String HintT,String LabelT,String InitialVal) {

      return TextFormField(
        initialValue: InitialVal,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: HintT,
          labelText: LabelT
        ),
      );
  }

   Widget _crearInputNumeric(String HintT,String LabelT, int InitialVal) {

     return TextFormField(

       textCapitalization: TextCapitalization.words,
       keyboardType: TextInputType.number,
       decoration: InputDecoration(
           border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(20.0)
           ),
           hintText: HintT,
           labelText: LabelT
       ),
       onSaved: (value)=> informacion.ci = int.parse(value),
       validator: (value) {
         if(utils.isNumeric(value)) {
           return null;
         } else {
           return 'Ingrese solo numeros';
         }
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

   void _submit(){
     if (!formKey.currentState.validate())  return;

     formKey.currentState.save();

     Navigator.pop(context);

   }





}