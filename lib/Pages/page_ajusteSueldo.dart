import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AjusteSueldo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SueldoState();
}

class SueldoState extends State<AjusteSueldo> {
  // Controladores para la entrada de campos de texto
  final TextEditingController _controllerTiempo = TextEditingController();
  final TextEditingController _controllerSueldo = TextEditingController();

  double sueldo_ajustado = 0;

  // Clave global para ScaffoldMessenger
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  // Función para mostrar SnackBar
  void mostrarSnackBar(String mensaje, Color color) {
    _scaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar() // Oculta cualquier SnackBar activo
      ..showSnackBar(
        SnackBar(
          content: Text(mensaje),
          backgroundColor: color,
          duration: Duration(seconds: 2), // Duración limitada
        ),
      );
  }

  // Función para calcular el sueldo
  void calcularSueldo() {
    setState(() {
      int? tiempo = int.tryParse(_controllerTiempo.text);
      double? sueldo = double.tryParse(_controllerSueldo.text);

      if (tiempo == null || sueldo == null) {
        sueldo_ajustado = 0;
        mostrarSnackBar("Por favor ingrese un número válido.", Colors.red);
        return;
      } else if (tiempo <= 0 || sueldo <= 0) {
        sueldo_ajustado = 0;
        mostrarSnackBar("Por favor ingrese un número mayor a 0.", Colors.red);
        return;
      }

      // Lógica para calcular el sueldo ajustado
      if (tiempo < 10) {
        if (sueldo <= 300000)
          sueldo_ajustado = sueldo * 0.12;
        else if (sueldo > 300000 && sueldo <= 500000)
          sueldo_ajustado = sueldo * 0.10;
        else if (sueldo >= 500000)
          sueldo_ajustado = sueldo * 0.08;
      } else if (tiempo > 10 && tiempo < 20) {
        if (sueldo <= 300000)
          sueldo_ajustado = sueldo * 0.14;
        else if (sueldo > 300000 && sueldo <= 500000)
          sueldo_ajustado = sueldo * 0.12;
        else if (sueldo >= 500000)
          sueldo_ajustado = sueldo * 0.10;
      } else if (tiempo >= 20) {
        sueldo_ajustado = sueldo * 0.15;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey, // Asociar la clave global
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ajuste de Sueldo',
            style: TextStyle(
              fontSize: 34,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 0, 152, 20),
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
                controller: _controllerTiempo,
                decoration: const InputDecoration(
                  labelText: 'Tiempo trabajado',
                  hintText: 'Ingrese el tiempo trabajado',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _controllerSueldo,
                decoration: const InputDecoration(
                  labelText: 'Sueldo',
                  hintText: 'Ingrese el sueldo',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: calcularSueldo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 137, 255, 141),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.loop),
                    SizedBox(width: 8),
                    Text("Calcular el sueldo ajustado"),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Sueldo ajustado: \$ $sueldo_ajustado',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AjusteSueldo(),
  ));
}
