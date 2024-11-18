import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class Venta extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VentaState();
}

class VentaState extends State<Venta> {
  //codigo

  //controladores para la entrada de campos de texto
  final TextEditingController _controllerNumCamisas = TextEditingController();

  //declarar variables
  int numCamisas = 0;
  int totalPagar = 0;

  //funciones para intercambiar palabras
  void cobrar() {
    setState(() {
      int? valorConvertido = int.tryParse(_controllerNumCamisas.text);
      if (valorConvertido != null) {
        numCamisas = valorConvertido;
        if (numCamisas < 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Por favor ingrese un número positivo."),
              backgroundColor: Colors.red,
            ),
          );
          _controllerNumCamisas.clear();
          totalPagar = 0;
          numCamisas = 0;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Por favor ingrese un número válido."),
            backgroundColor: Colors.red,
          ),
        );
        _controllerNumCamisas.clear();
        totalPagar = 0;
        numCamisas = 0;
      }

      if (numCamisas > 3) {
        totalPagar = 4000 * numCamisas;
      } else {
        totalPagar = 4800 * numCamisas;
      }
    });
  }

  //diseño
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Venta de Camisas",
          style: TextStyle(
            fontSize: 34,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 3, 96, 120),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.go('/');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.house_outlined),
                    SizedBox(width: 8),
                    Text("Menú Principal"),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Image.asset('assets/images/camisa.png',
                  width: 200, height: 200, fit: BoxFit.cover),
              SizedBox(height: 30),
              TextField(
                controller: _controllerNumCamisas,
                keyboardType: TextInputType.number,
                //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: "Ingrese el número de camisas que desea comprar:",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: cobrar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 17, 33, 154),
                  foregroundColor: Colors.white,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(width: 8),
                    Text("Pagar"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Número de camisas compradas: $numCamisas",
                style: TextStyle(fontSize: 24),
              ),
              Text(
                "Total a pagar: $totalPagar",
                style: TextStyle(fontSize: 24),
              ),
            ],
          )),
    );
  }
}
