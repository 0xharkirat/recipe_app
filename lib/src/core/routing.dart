import 'package:go_router/go_router.dart';
import 'package:recipe_app/src/views/screens/home_screen.dart';
import 'package:recipe_app/src/views/screens/ingredients_screen.dart';

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(path: "/", builder: (_, __) => HomeScreen()),
    GoRoute(path: '/ingredients', builder: (_, __) => IngredientsScreen()),
  ],
);
