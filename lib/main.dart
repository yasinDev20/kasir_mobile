import 'package:flutter/material.dart';
import 'package:kasir_mobile/config/di/injection.dart';
import 'package:kasir_mobile/config/routes/routes.dart';
import 'package:kasir_mobile/config/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await injectionInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final _materialTheme = MaterialTheme(Typography.material2021().black);

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: _materialTheme.light(),
      darkTheme: _materialTheme.dark(),
      themeMode: ThemeMode.system,
      routerConfig: MyRouter.router,
      builder: (context, child) => child!,
    );
  }
}
