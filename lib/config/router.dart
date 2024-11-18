import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:tipo_triangulo/Pages/page_ajusteSueldo.dart';
import 'package:tipo_triangulo/Pages/page_ascendentes.dart';
import 'package:tipo_triangulo/Pages/page_ecuaciones.dart';
import 'package:tipo_triangulo/Pages/page_tipoTriangulo.dart';
import 'package:tipo_triangulo/Pages/page_ventaCamisas.dart';
import 'package:tipo_triangulo/Pages/page_sueldo.dart';
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
    path: '/ajusteSueldo',
    builder: (BuildContext context, GoRouterState state) {
      return AjusteSueldo();
  }),
  GoRoute(
    path: '/camisas',
    builder: (BuildContext context, GoRouterState state) {
      return Venta();
    }),
  GoRoute(
    path: '/sueldo',
    builder: (BuildContext context, GoRouterState state) {
      return Sueldo();
    }),
  GoRoute(
    path: '/ascendentes',
    builder: (BuildContext context, GoRouterState state) {
      return Ascendentes();
    }), 
  GoRoute(
    path: '/ecuaciones',
    builder: (BuildContext context, GoRouterState state) {
      return CalculadoraRaices();
    }), 
]); 