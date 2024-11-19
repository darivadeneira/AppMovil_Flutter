import 'package:flutter/material.dart';
import 'dart:math';

import 'package:go_router/go_router.dart';

class CalculadoraRaices extends StatefulWidget {
  @override
  _CalculadoraRaicesState createState() => _CalculadoraRaicesState();
}

class _CalculadoraRaicesState extends State<CalculadoraRaices> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();

  String _resultado = "";

  void _resolverEcuacion() {
    final double? a = double.tryParse(_aController.text);
    final double? b = double.tryParse(_bController.text);
    final double? c = double.tryParse(_cController.text);

    if (a == null || b == null || c == null) {
      setState(() {
        _resultado = "Por favor, ingrese valores válidos para A, B y C.";
      });
      return;
    }

    if (a == 0) {
      setState(() {
        _resultado =
            "El coeficiente A no corresponde a una ecuación de segundo grado.";
      });
      return;
    }

    final double discriminante = pow(b, 2) - 4 * a * c;

    if (discriminante < 0) {
      setState(() {
        _resultado = "La solución es imaginaria (discriminante < 0).";
      });
    } else if (discriminante == 0) {
      final double raiz = -b / (2 * a);
      setState(() {
        _resultado = "La ecuación tiene una raíz única: $raiz";
      });
    } else {
      final double raiz1 = (-b + sqrt(discriminante)) / (2 * a);
      final double raiz2 = (-b - sqrt(discriminante)) / (2 * a);
      setState(() {
        _resultado = "Las soluciones son: $raiz1 y $raiz2";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de Raíces Cuadráticas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
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
              SizedBox(height: 16),
              TextFormField(
                controller: _aController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Coeficiente A"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingrese un valor para A.";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _bController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Coeficiente B"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingrese un valor para B.";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Coeficiente C"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingrese un valor para C.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _resolverEcuacion();
                  }
                },
                child: Text("Calcular Raíces"),
              ),
              SizedBox(height: 20),
              Text(
                _resultado,
                style: TextStyle(fontSize: 16, color: Colors.blue),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
