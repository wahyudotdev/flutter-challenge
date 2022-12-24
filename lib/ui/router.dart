import 'package:flutter/material.dart';
import 'package:traveloka_kw/ui/home/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

var router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
]);

Widget get errorPage => const Center(
      child: SizedBox(
        width: 200,
        child: Text('Error, maybe you forgot to include required obj'),
      ),
    );
