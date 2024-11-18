import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Ascendentes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AscendentesState();
}

class AscendentesState extends State<Ascendentes>{
  //CÓDIGO
  //Controladores para la entrada de numeros
  final TextEditingController _controllerPrimerNumero = TextEditingController();
  final TextEditingController _controllerSegundoNumero = TextEditingController();
  final TextEditingController _controllerTercerNumero = TextEditingController();

  //Variables
  double primerNumero = 0;
  double segundoNumero = 0;
  double tercerNumero = 0;
  List<double> numerosOrdenados = [];
  bool mostrar = false;

  //Funcion
  void _ordenarNumeros() {
    setState(() {
      double menor, medio, mayor;
      if (primerNumero <= segundoNumero && primerNumero <= tercerNumero) {
        menor = primerNumero;
        if (segundoNumero <= tercerNumero) {
          medio = segundoNumero;
          mayor = tercerNumero;
        } else {
          medio = tercerNumero;
          mayor = segundoNumero;
        }
      } else if (segundoNumero <= primerNumero && segundoNumero <= tercerNumero) {
        menor = segundoNumero;
        if (primerNumero <= tercerNumero) {
          medio = primerNumero;
          mayor = tercerNumero;
        } else {
          medio = tercerNumero;
          mayor = primerNumero;
        }
      } else {
        menor = tercerNumero;
        if (primerNumero <= segundoNumero) {
          medio = primerNumero;
          mayor = segundoNumero;
        } else {
          medio = segundoNumero;
          mayor = primerNumero;
        }
      }

      numerosOrdenados = [menor, medio, mayor];
      mostrar = true;
    });
  }

  //DISEÑO
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ordenar números', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controllerPrimerNumero,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Ingrese el primer número: "),
              onChanged: (value) {
                primerNumero = double.tryParse(value) ?? 0;
              },
            ),

            TextField(
              controller: _controllerSegundoNumero,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Ingrese el segundo número: "),
              onChanged: (value) {
                segundoNumero = double.tryParse(value) ?? 0;
              },
            ),

            TextField(
              controller: _controllerTercerNumero,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Ingrese el tercer número: "),
              onChanged: (value) {
                tercerNumero = double.tryParse(value) ?? 0;
              },
            ),

            const SizedBox(height:20),
            ElevatedButton(
              onPressed: _ordenarNumeros,
              child: const Text('Ordenar', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black)
            ),
            const SizedBox(height:20),
            if (mostrar)
              Text(
                'Números ordenados = ${numerosOrdenados.join(' - ')}',
                style: const TextStyle(fontSize: 24),
              ),
          ],
        )
      )
    );
  }

}