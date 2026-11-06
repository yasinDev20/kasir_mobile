import 'package:flutter/material.dart';
import 'package:kasir_mobile/core/theme/theme.dart';
import 'package:kasir_mobile/features/products/presentation/pages/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final _materialTheme = MaterialTheme(Typography.material2021().black);

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _materialTheme.light(),
      darkTheme: _materialTheme.dark(),
      themeMode: ThemeMode.system,

      builder: (context, child) => ProductPage(),
    );
  }
}
