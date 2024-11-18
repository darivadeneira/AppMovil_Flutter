import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:tipo_triangulo/Pages/Sueldo.dart';
import 'package:tipo_triangulo/Pages/Triangulo.dart';
import 'package:tipo_triangulo/Pages/VentaCamisas.dart';
import 'package:tipo_triangulo/main.dart';

final GoRouter router = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: '/', 
    builder: (BuildContext context, GoRouterState state) {
      return Rutas();
    }),
  
  GoRoute(
    path: '/triangulo',
    builder: (BuildContext context, GoRouterState state) {
      return TipoTriangulo();
    }),
  GoRoute(
    path: '/Sueldo',
    builder: (BuildContext context, GoRouterState state) {
      return Sueldo();
  }),
  GoRoute(
    path: '/camisas',
    builder: (BuildContext context, GoRouterState state) {
      return Venta();
    }),
]); 