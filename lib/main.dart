import 'package:dashboard/src/core/routes.dart';
import 'package:dashboard/src/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dashboard',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.name,
      onGenerateRoute: Routes.routes,
    );
  }
}
