import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:prototipohackathon/src/models/datos_model.dart';
import 'package:prototipohackathon/src/providers/datos_providers.dart';

class EstadisticasPage extends StatefulWidget {
  @override
  _EstadisticasPageState createState() => _EstadisticasPageState();
}

class _EstadisticasPageState extends State<EstadisticasPage> {
  List<charts.Series<Task,String>> _seriesPieData;
  final datosProvider = new DatosProvider();
  void initState(){
    super.initState();
    _seriesPieData = List<charts.Series<Task,String>>();
    _crearDatos();

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Covid-19 Bolivia'),
          backgroundColor: Colors.green,
        ),
        body: _crearDatos(),
      ),
    );

  }



  Widget _crearDatos() {
    return FutureBuilder(
      future: datosProvider.cargarDatos(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        if (snapshot.hasData) {
          final datos = snapshot.data.asMap();
          final recuperados = datos[2];
          final muertes = datos[1];
          final confirmados = datos[0];
          var pieData=[
            new Task('recuperados', recuperados, Colors.green),
            new Task('muertos', muertes, Colors.red),
            new Task('Confirmados', confirmados, Colors.greenAccent),
          ];
          _seriesPieData.add(
            charts.Series(
              data: pieData,
              domainFn: (Task task,_)=> task.task,
              measureFn: (Task task,_)=> task.taskvalue,
              colorFn: (Task task,_)=> charts.ColorUtil.fromDartColor(task.colorval),
              id: 'Diario',
              labelAccessorFn: (Task row,_)=>'${row.taskvalue}',
            ),
          );

          return TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text('Covid-19 en Bolivia',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.0,),
                        Expanded(
                          child: charts.PieChart(
                            _seriesPieData,
                            animate: true,
                            animationDuration: Duration(seconds: 2),
                            behaviors: [
                              new charts.DatumLegend(
                                outsideJustification: charts.OutsideJustification.endDrawArea,
                                horizontalFirst: false,
                                desiredMaxRows: 2,
                                cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                                entryTextStyle: charts.TextStyleSpec(
                                    color: charts.MaterialPalette.green.shadeDefault,
                                    fontFamily: 'Georgia',
                                    fontSize: 11),
                              )
                            ],
                            defaultRenderer: new charts.ArcRendererConfig(
                                arcWidth: 100,
                                arcRendererDecorators: [
                                  new charts.ArcLabelDecorator(
                                      labelPosition: charts.ArcLabelPosition.inside
                                  )
                                ]
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )

            ],
          );

        }else{
          return Center(child: CircularProgressIndicator());
        }

      },
    );
  }
}

class Task{
  String task;
  int taskvalue;
  Color colorval;

  Task(this.task,this.taskvalue,this.colorval);
}
