import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Sueldo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SueldoState();
}

class SueldoState extends State<Sueldo>{
  //CÓDIGO
  //Controladores
  TextEditingController _controllerHorasNormales = TextEditingController();
  TextEditingController _controllerHorasNocturnas = TextEditingController();
  //Variables
  int horasNormales = 0;
  int horasNocturnas = 0;
  double sueldo = 0;
  bool mostrar = false;
  //Funcion
  void _calcularSueldo(){
    setState(() {
      sueldo = 2000 * (horasNormales + horasNocturnas * 1.3);
      mostrar = true;
    });
  }

  //DISEÑO
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Sueldos", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controllerHorasNormales,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Ingrese las horas normlaes trabajadas en la semana: "),
              onChanged: (value){
                horasNormales = int.tryParse(value) ?? 0;
              },
            ),

            TextField(
              controller: _controllerHorasNocturnas,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Ingrese las horas nocturnas trabajadas en la semana: "),
              onChanged: (value) {
                horasNocturnas = int.tryParse(value) ?? 0;
              },
            ),

            const SizedBox(height:20),
            ElevatedButton(
              onPressed: _calcularSueldo,
              child: const Text('Calcular Sueldo', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black)
            ),
            const SizedBox(height:20),
            if (mostrar)
              Text(
                'Sueldo semanal = $sueldo',
                style: const TextStyle(fontSize: 24),
              ),
          ],
        ),
      )

    );
  }

}