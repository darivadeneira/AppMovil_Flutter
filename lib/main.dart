import 'package:flutter/material.dart';
import 'package:tipo_triangulo/Pages/page_tipoTriangulo.dart';
import 'package:tipo_triangulo/Pages/page_ajusteSueldo.dart';
import 'package:tipo_triangulo/config/router.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ejercicios',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

class Rutas extends StatelessWidget {
  const Rutas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rutas'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double iconSize = 50; // Tamaño fijo para los iconos
          double spacing = 16.0; // Espaciado fijo entre los elementos

          return Center(
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: spacing, // Espaciado horizontal entre columnas
                runSpacing: spacing, // Espaciado vertical entre filas
                children: [
                  _buildIconColumn(context, Icons.architecture, 'Triángulo', '/triangulo', iconSize),
                  _buildIconColumn(context, Icons.loop, 'Ajuste de Sueldo', '/ajusteSueldo', iconSize),
                  _buildIconColumn(context, Icons.shopping_cart, 'Venta Camisas', '/camisas', iconSize),
                  _buildIconColumn(context, Icons.attach_money, 'Pago de Sueldo', '/sueldo', iconSize),
                  _buildIconColumn(context, Icons.arrow_upward, 'Orden Ascendente', '/ascendentes', iconSize),
                  _buildIconColumn(context, Icons.calculate, 'Raíces Cuadráticas', '/ecuaciones', iconSize),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildIconColumn(
    BuildContext context,
    IconData icon,
    String label,
    String route,
    double iconSize,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            context.go(route);
          },
          icon: Icon(icon, size: iconSize),
        ),
        const SizedBox(height: 8.0),
        Text(label, textAlign: TextAlign.center),
      ],
    );
  }
}
