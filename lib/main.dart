import 'package:flutter/material.dart';
import 'package:tipo_triangulo/Pages/Triangulo.dart';
import 'package:tipo_triangulo/Pages/Sueldo.dart';
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
        //centrar el texto
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    context.go('/triangulo');
                  },
                  icon: const Icon(
                    Icons.change_circle,
                    size: 50,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text('Triángulo'),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    context.go('/sueldo');
                  },
                  icon: const Icon(
                    Icons.attach_money,
                    size: 50,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text('Sueldo'),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    context.go('/camisas');
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    size: 50,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text('Venta Camisas'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
