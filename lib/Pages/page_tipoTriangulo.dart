import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TipoTriangulo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TipoTrianguloState();
}

class TipoTrianguloState extends State<TipoTriangulo> {
  // Controladores para la entrada de campos de texto
  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();
  final TextEditingController _controllerC = TextEditingController();

  // Declarar variables
  String esTriangulo = "";
  String tipo_Triangulo = "";
  String imagenTriangulo = ''; // Variable para almacenar la imagen

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

  // Función para identificar tipo de triángulo
  void TipoTriangulo() {
    // Eliminar cualquier snackbar anterior
    _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();

    setState(() {
      int? valorA = int.tryParse(_controllerA.text);
      int? valorB = int.tryParse(_controllerB.text);
      int? valorC = int.tryParse(_controllerC.text);

      // Validación de entrada
      if (valorA == null || valorB == null || valorC == null) {
        esTriangulo = "";
        tipo_Triangulo = "";
        imagenTriangulo = '';
        mostrarSnackBar("Por favor ingrese un número válido.", Colors.red);
        return;
      } else if (valorA <= 0 || valorB <= 0 || valorC <= 0) {
        esTriangulo = "";
        tipo_Triangulo = "";
        imagenTriangulo = '';
        mostrarSnackBar("Por favor ingrese un número mayor a 0.", Colors.red);
        return;
      } else if (valorA < (valorB + valorC) &&
          valorB < (valorA + valorC) &&
          valorC < (valorA + valorB)) {
        esTriangulo = "Es triángulo";
      } else {
        tipo_Triangulo = "";
        imagenTriangulo = '';
        esTriangulo = "No es triángulo";
        mostrarSnackBar("No es un triángulo.", Colors.red);
        return;
      }

      // Lógica para determinar el tipo de triángulo
      if (valorA == valorB && valorB == valorC) {
        tipo_Triangulo = "Equilátero";
        imagenTriangulo =
            'assets/images/equilatero.png'; // Cambiar la imagen para equilátero
      } else if (valorA == valorB || valorA == valorC || valorB == valorC) {
        tipo_Triangulo = "Isósceles";
        imagenTriangulo =
            'assets/images/isosceles.png'; // Cambiar la imagen para isósceles
      } else {
        tipo_Triangulo = "Escaleno";
        imagenTriangulo =
            'assets/images/escaleno.png'; // Cambiar la imagen para escaleno
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey, // Asociar la clave global
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Tipo de Triángulo",
            style: TextStyle(
              fontSize: 34,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
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
                controller: _controllerA,
                decoration:
                    const InputDecoration(labelText: "Ingrese el lado A: "),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _controllerB,
                decoration:
                    const InputDecoration(labelText: "Ingrese el lado B: "),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _controllerC,
                decoration:
                    const InputDecoration(labelText: "Ingrese el lado C: "),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: TipoTriangulo,
                child: const Text("Identificar tipo de triángulo"),
              ),
              SizedBox(height: 16),
              Text(
                tipo_Triangulo,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              // Mostrar la imagen correspondiente al tipo de triángulo
              if (imagenTriangulo.isNotEmpty)
                Image.asset(
                  imagenTriangulo,
                  width: 200,
                  height: 200,
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
    home: TipoTriangulo(),
  ));
}
