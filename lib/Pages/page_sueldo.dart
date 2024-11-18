import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Sueldo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SueldoState();
}

class SueldoState extends State<Sueldo> {
  // Controladores
  TextEditingController _controllerHorasNormales = TextEditingController();
  TextEditingController _controllerHorasNocturnas = TextEditingController();

  // Variables
  int horasNormales = 0;
  int horasNocturnas = 0;
  double sueldo = 0;
  bool mostrar = false;

  // Clave global para ScaffoldMessenger
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  // Función para mostrar SnackBar
  void mostrarSnackBar(String mensaje, Color color) {
    _scaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(mensaje),
          backgroundColor: color,
          duration: Duration(seconds: 2),
        ),
      );
  }

  // Función para calcular el sueldo
  void _calcularSueldo() {
    setState(() {
      int? horasNormalesInput = int.tryParse(_controllerHorasNormales.text);
      int? horasNocturnasInput = int.tryParse(_controllerHorasNocturnas.text);

      if (horasNormalesInput == null || horasNocturnasInput == null) {
        mostrarSnackBar("Por favor ingrese números válidos.", Colors.red);
        return;
      } else if (horasNormalesInput < 0 || horasNocturnasInput < 0) {
        mostrarSnackBar("Las horas no pueden ser negativas.", Colors.red);
        return;
      }

      horasNormales = horasNormalesInput;
      horasNocturnas = horasNocturnasInput;
      sueldo = 2000 * (horasNormales + horasNocturnas * 1.3);
      mostrar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sueldos",
            style: TextStyle(
              fontSize:34,
              color: Color.fromARGB(255, 0, 255, 72)),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
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
              SizedBox(height: 90),
              TextField(
                controller: _controllerHorasNormales,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText:
                      "Ingrese las horas normales trabajadas en la semana:",
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _controllerHorasNocturnas,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText:
                      "Ingrese las horas nocturnas trabajadas en la semana:",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcularSueldo,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 8),
                    Text("Sueldo a Recibir"),
                  ],
                ),
                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 0, 255, 72),
                foregroundColor: const Color.fromARGB(255, 68, 68, 68)),
              ),
              const SizedBox(height: 20),
              if (mostrar)
                Text(
                  'Sueldo semanal = \$${sueldo.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 24),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
