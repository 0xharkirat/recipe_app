import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/src/core/routing.dart';
import 'package:recipe_app/src/core/helper.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {

  HttpOverrides.global = MyHttpOverrides(); // override bad certificate for developement mode
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      title: 'Recipe App',
    );
  }
}
