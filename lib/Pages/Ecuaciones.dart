import 'package:flutter/material.dart';
import 'dart:math';

class QuadraticSolverScreen extends StatefulWidget {
  @override
  _QuadraticSolverScreenState createState() => _QuadraticSolverScreenState();
}

class _QuadraticSolverScreenState extends State<QuadraticSolverScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();

  String _result = "";

  void _solveQuadratic() {
    final double? a = double.tryParse(_aController.text);
    final double? b = double.tryParse(_bController.text);
    final double? c = double.tryParse(_cController.text);

    if (a == null || b == null || c == null) {
      setState(() {
        _result = "Por favor, ingrese valores válidos para A, B y C.";
      });
      return;
    }

    if (a == 0) {
      setState(() {
        _result =
            "El coeficiente A no corresponde a una ecuación de segundo grado.";
      });
      return;
    }

    final double discriminant = pow(b, 2) - 4 * a * c;

    if (discriminant < 0) {
      setState(() {
        _result = "La solución es imaginaria (discriminante < 0).";
      });
    } else if (discriminant == 0) {
      final double root = -b / (2 * a);
      setState(() {
        _result = "La ecuación tiene una raíz única: $root";
      });
    } else {
      final double root1 = (-b + sqrt(discriminant)) / (2 * a);
      final double root2 = (-b - sqrt(discriminant)) / (2 * a);
      setState(() {
        _result = "Las soluciones son: $root1 y $root2";
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
                    _solveQuadratic();
                  }
                },
                child: Text("Calcular Raíces"),
              ),
              SizedBox(height: 20),
              Text(
                _result,
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
